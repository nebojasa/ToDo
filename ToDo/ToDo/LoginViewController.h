//
//  LoginViewController.h
//  ToDo
//
//  Created by Cubes School 10 on 3/30/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *usernameImageView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UIView *maskLogoView;
@property (weak, nonatomic) IBOutlet UIView *logoView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinerView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UIView *footerView;
@property (nonatomic) CGFloat containerViewOriginY;

- (void)configureTextFieldPlaceholders;
- (void)registerForNotifications;
- (void)prepareForAnimations;
- (void)animate;
- (IBAction)submitButtonTapped;
@end
