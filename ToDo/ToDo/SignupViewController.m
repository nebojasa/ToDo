//
//  SignupViewController.m
//  ToDo
//
//  Created by Cubes School 10 on 3/30/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController()

@property (weak, nonatomic) IBOutlet UILabel *signUpLabel;
@property (weak, nonatomic) IBOutlet UIImageView *usernameImageView;
@property (weak, nonatomic) IBOutlet UIImageView *emailImageView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;
@property (weak, nonatomic) IBOutlet UIImageView *birthdayImageView;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *birthdayTextField;
@property (weak, nonatomic) IBOutlet UIButton *joinButton;

@end

@implementation SignupViewController

- (IBAction)backButtonTapped:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end