//
//  BaseViewController.m
//  GoSolar
//
//  Created by Nebojsa Gujanicic on 30/06/2016.
//  Copyright © 2016 Nebojsa Gujanicic. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()
@end

@implementation BaseViewController

#pragma mark - Actions

- (IBAction) backButtonTapped {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}
@end
