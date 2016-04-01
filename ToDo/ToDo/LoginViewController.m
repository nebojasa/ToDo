//
//  LoginViewController.m
//  ToDo
//
//  Created by Cubes School 10 on 3/30/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController()
@property (weak, nonatomic) IBOutlet UIImageView *usernameImageView;
@property (weak, nonatomic) IBOutlet UIImageView *passwordImageView;
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
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
                                    NSFontAttributeName: [UIFont fontWithName:@"AvenirNext-Regular" size:14.0], NSForegroundColorAttributeName: [UIColor whiteColor]
                                    };
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:textField.placeholder attributes:attributes];
    
    }
}


@end

