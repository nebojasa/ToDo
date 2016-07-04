//
//  FacebookViewController.m
//  GoSolar
//
//  Created by Nebojsa Gujanicic on 01/07/2016.
//  Copyright © 2016 Nebojsa Gujanicic. All rights reserved.
//

#import "FacebookViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "AppDelegate.h"


@interface FacebookViewController ()
@property (nonatomic, strong) AppDelegate *appDelegate;
- (void)hideUserInfo:(BOOL)shouldHide;
@end

@implementation FacebookViewController

#pragma mark - Private API

- (void)hideUserInfo:(BOOL)shouldHide {
    self.imageProfilePicture.hidden = shouldHide;
    self.labelFullname.hidden = shouldHide;
    self.labelEmail.hidden = shouldHide;
}

#pragma mark - Public API

-(void)loginButtonClicked {
    FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    [login logInWithReadPermissions: @[@"public_profile"]
     fromViewController:self
     handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
         if (error) {
             NSLog(@"Process error");
         } else if (result.isCancelled) {
             NSLog(@"Cancelled");
         } else {
             NSLog(@"Logged in");
         }
     }];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *buttonToggleLoginState =[UIButton buttonWithType:UIButtonTypeCustom];
    buttonToggleLoginState.backgroundColor=[UIColor blueColor];
    buttonToggleLoginState.frame=CGRectMake(0,0,180,40);
    buttonToggleLoginState.center = self.view.center;
    [buttonToggleLoginState setTitle: @"My Login Button" forState: UIControlStateNormal];
    
    [buttonToggleLoginState addTarget:self action:@selector(loginButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:buttonToggleLoginState];
}


- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

@end
