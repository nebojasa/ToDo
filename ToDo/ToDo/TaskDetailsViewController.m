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

- (IBAction)addButtonTapped {
    [self saveTask];
}

- (IBAction)mapButtonTapped:(UIButton *)sender {
    sender.selected = !sender.selected;
    
    [UIView animateWithDuration:0.3 animations:^{
        self.mapView.alpha = (sender.selected) ? 1.0 : ZERO_VALUE;
    }];
}

- (IBAction)groupButtonTapped: (UIButton *)sender {
    self.group = sender.tag;
}

#pragma mark - Private API

- (BOOL)isEdited {
    if (self.titleTextField.text>0) {
        return YES;
    }
    return NO;
}

- (void)configureAlert {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Save Task" message:@"Are you shure you want to go back without saving?" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle: @"Yes" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
        [self.navigationController popViewControllerAnimated:YES];
    }];
    
    UIAlertAction *noAction = [UIAlertAction actionWithTitle: @"No" style:UIAlertActionStyleCancel handler:NULL];
    
    [alertController addAction:yesAction];
    [alertController addAction:noAction];
    
    [self presentViewController:alertController animated:YES completion:NULL];
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

- (void)saveTask {
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

- (void)registerForNotification {
    [[NSNotificationCenter defaultCenter] addObserverForName:CITY_CHANGED object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
        self.cityLabel.text = [DataManager sharedInstance].userLocality;
    }];
}

- (void)configureMap {
    //sakrijem mapu
    self.mapView.alpha = ZERO_VALUE;
    CLLocationCoordinate2D coordinate;
    
    //ako imam task, taj task dodajem na mapu
    if (self.task) {
        [self.mapView addAnnotation:self.task];
        
        coordinate = self.task.coordinate;
    } else {
        self.mapView.showsUserLocation = YES;
        coordinate = [DataManager sharedInstance].userlocation.coordinate;
    }
    [self zoomMapTocoordinate:coordinate];
    
    if ([DataManager sharedInstance].userLocality.length > 0) {
        self.cityLabel.text = [DataManager sharedInstance].userLocality;
    }
}

- (void)zoomMapTocoordinate:(CLLocationCoordinate2D) coordinate {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, kRegionRadius * 2.0, kRegionRadius * 2.0);
    MKCoordinateRegion coordinateRegion = [self.mapView regionThatFits:region];
    [self.mapView setRegion:coordinateRegion animated:YES];
}

- (void)fillData {
    self.titleTextField.text = self.task.heading;
    self.descriptonTextField.text = self.task.desc;
    self.group = [self.task.group integerValue];
    [self.mapView addAnnotation:self.task];
}


#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureTextFieldPlaceholders];
    [self registerForNotification];
    [self configureMap];
    
    self.addButton.alpha = ZERO_VALUE;
    
    if (self.task) {
        [self fillData];
    } else {
        self.group = NOT_COMPLETED_TASK_GROUP;
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.addButton.alpha = 1.0;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

# pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
}

@end
