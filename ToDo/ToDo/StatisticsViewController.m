//
//  StatisticsViewController.m
//  ToDo
//
//  Created by Cubes School 10 on 5/4/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "StatisticsViewController.h"

@interface StatisticsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *completedPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *notCompletedPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *inProgressPercentageLabel;
@property (weak, nonatomic) IBOutlet UILabel *completedCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *notCompletedCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *inProgressCountLabel;
- (IBAction)backButtonTapped:(id)sender;

@end

@implementation StatisticsViewController

#pragma mark - Actions
- (IBAction)backButtonTapped:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];

}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}


@end
