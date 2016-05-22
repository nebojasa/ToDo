//
//  TaskDetailsViewController.m
//  ToDo
//
//  Created by Cubes School 10 on 5/20/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "TaskDetailsViewController.h"
#import "UIViewController+Utilities.h"
#import "DataManager.h"
#import <MapKit/MapKit.h>

#define kRegionRadius 50000 //koliko zelim da zumiram mapu koliki radius

@interface TaskDetailsViewController() <UITextFieldDelegate>

@property(weak,nonatomic)IBOutlet UITextField *titleTextField;
@property(weak,nonatomic)IBOutlet UITextField *descriptonTextField;
@property(weak,nonatomic)IBOutlet UIButton *addButton;
@property(weak,nonatomic)IBOutlet UIButton *mapButton;
@property(weak,nonatomic)IBOutlet UILabel *cityLabel;
@property(weak,nonatomic)IBOutlet MKMapView *mapView;
@property(weak,nonatomic)IBOutlet UIImageView *groupSelectorImageView;
@property(weak,nonatomic)IBOutlet UIView *completedView;
@property(weak,nonatomic)IBOutlet UIView *notCompletedView;
@property(weak,nonatomic)IBOutlet UIView *inProgressView;
@property(nonatomic)NSInteger group;//klikom na odgovarajuci button uradi animaciju selektorom
@end

@implementation TaskDetailsViewController

#pragma mark - Propeerties

-  (void)setGroup:(NSInteger)group {
    _group = group;
    
    __block CGPoint point;//definishem point
    
    switch (group) {
        case COMPLETED_TASK_GROUP:
            point = self.completedView.center;
            break;
        case NOT_COMPLETED_TASK_GROUP:
            point = self.notCompletedView.center;
            break;
        case IN_PROGRESS_TASK_GROUP:
            point = self.inProgressView.center;
            break;
        default:
            break;
    }
    
    [UIView animateWithDuration:0.4 animations:^{
        self.groupSelectorImageView.center = point;//animiram centar grup selektora da se poklopi sa centrom pointa
    }];
}

#pragma mark - Actions

- (IBAction)backButtonTapped {
    if ([self isEdited] && !self.task) {
        [self configureAlert];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (IBAction) addButtonTapped {
    [self saveTask];
}

- (IBAction) mapButtonTapped:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.mapView.alpha = (sender.selected) ? 1.0 : ZERO_VALUE;
    }];
}

- (IBAction) groupButtonTapped: (UIButton *)sender {
    self.group = sender.tag;
}
#pragma mark - Private API

- (BOOL) isEdited {
    
    return NO;
}

- (void)configureAlert {
    
}

- (void)configureTextFieldPlaceholders {
    NSMutableDictionary *titleAttributes = [[NSMutableDictionary alloc] init];
    [titleAttributes setObject:[UIFont fontWithName:@"Avenir-Light" size:35.0] forKey:NSFontAttributeName];
    [titleAttributes setObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName];
    
    NSAttributedString *titlePlaceholder = [[NSAttributedString alloc] initWithString:self.titleTextField.placeholder attributes:titleAttributes];
    self.titleTextField.attributedPlaceholder = titlePlaceholder;
    
    NSMutableDictionary *descriptionAttributes = [[NSMutableDictionary alloc] init];
    [descriptionAttributes setObject:[UIFont fontWithName:@"Avenir-Book" size:14.0] forKey:NSFontAttributeName];
    [descriptionAttributes setObject:kDescPlaceholderColor forKey:NSForegroundColorAttributeName];
    
    NSAttributedString *descriptionPlaceholder = [[NSAttributedString alloc] initWithString:self.descriptonTextField.placeholder attributes:descriptionAttributes];
    self.descriptonTextField.attributedPlaceholder = descriptionPlaceholder;
}

- (void) saveTask {
    if (self.titleTextField.text.length == 0) {
        [self presentErrorWithTitle:@"Validation" andError:@"Please add title."];
        return;
    }
    if (self.descriptonTextField.text.length == 0) {
        [self presentErrorWithTitle:@"Validation" andError:@"Please add short description."];
        return;
    }
    if (self.task) {
        self.task.heading = self.titleTextField.text;
        self.task.desc = self.descriptonTextField.text;
        self.task.group = [NSNumber numberWithInteger:self.group];
        [[DataManager sharedInstance] saveTaskWithTitle:self.titleTextField.text description:self.descriptonTextField.text group:self.group];
    }
    self.titleTextField.text = EMPTY_STRING;
    self.descriptonTextField.text = EMPTY_STRING;
    [self backButtonTapped];
}


#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureTextFieldPlaceholders];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
