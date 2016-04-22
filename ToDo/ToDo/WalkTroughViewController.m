//
//  WalkTroughViewController.m
//  ToDo
//
//  Created by macbook pro on 22/04/2016.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "WalkTroughViewController.h"
#import "Constanc.h"
@interface WalkTroughViewController ()
    
@end

@implementation WalkTroughViewController

#pragma mark - Actions

- (IBAction)closeButtonTapped :(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:WALKTROUGH_PRESENTED];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
