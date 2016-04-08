//
//  LoginViewController.m
//  ToDo
//
//  Created by Djuro Alfirevic on 3/30/16.
//  Copyright © 2016 Djuro Alfirevic. All rights reserved.
//

#import "LoginViewController.h"

#define kConstant 50.0
#define ZERO_VALUE 0.0

@interface LoginViewController() <UITextFieldDelegate>
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
@end

@implementation LoginViewController

#pragma mark - Private API

- (void)configureTextField:(UITextField *)textField {
    if (textField.placeholder.length > 0) {
//        UIColor *color = [UIColor colorWithRed:117.0/255.0
//                                         green:113.0/255.0
//                                          blue:111.0/255.0
//                                         alpha:1.0];
        
        NSDictionary *attributes = @{
                                     NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Regular" size:14.0],
                                     NSForegroundColorAttributeName: [UIColor whiteColor]
                                     };
        
        textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:textField.placeholder
                                                                          attributes:attributes];
    }
}

#pragma mark - Actions

- (IBAction)forgotPasswordButtonTapped:(UIButton *)sender {
}

- (IBAction)signInButtonTapped:(UIButton *)sender {
    [self.spinerView startAnimating];
}

- (IBAction)signUpButtonTapped:(UIButton *)sender {
    NSLog(@"Sign up...");
}

- (void)animate{
        [UIView animateWithDuration:0.4 animations:^{
            CGRect frame = self.footerView.frame;
            frame.origin.y = 625;
            self.footerView.frame = frame;
        }];
    
    //Sign in button
    [UIView animateWithDuration:0.4
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         CGRect submitButtonFrame = self.submitButton.frame;
                         submitButtonFrame.origin.x = ZERO_VALUE;
                         self.submitButton.frame = submitButtonFrame;
                         
                     }completion:NULL];
    
    //Mask View
    [UIView animateWithDuration:1.0
                          delay:0.8
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         self.maskLogoView.alpha = ZERO_VALUE;
                     }completion:NULL];
}

- (void)prepareForAnimations{
    
    //Sign in button
    CGRect submitButtonFrame = self.submitButton.frame;
    submitButtonFrame.origin.x = self.view.frame.size.width;
    self.submitButton.frame = submitButtonFrame;
    
//    //Footer view
    CGRect footerViewFrame = self.footerView.frame;
    footerViewFrame.origin.y = self.view.frame.size.height;
    self.footerView.frame = footerViewFrame;
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.spinerView stopAnimating];
    [self configureTextField:self.usernameTextField];
    [self configureTextField:self.passwordTextField];
}

-(void)viewDidAppear:(BOOL)animated{
    [self animate];
    [self.maskLogoView setAlpha:0.0];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self prepareForAnimations];
    [self.spinerView stopAnimating];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [UIView animateWithDuration:10.0
                          delay:0.0
         usingSpringWithDamping:0.4
          initialSpringVelocity:10.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         CGRect frame = self.containerView.frame;
                         frame.origin.y = frame.origin.y - kConstant;
                         self.containerView.frame = frame;
                     }
                     completion:nil];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [UIView animateWithDuration:1.0
                          delay:0.0
         usingSpringWithDamping:0.4
          initialSpringVelocity:10.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         CGRect frame = self.containerView.frame;
                         frame.origin.y = frame.origin.y + kConstant;
                         self.containerView.frame = frame;
                     }
                     completion:nil];
}

@end