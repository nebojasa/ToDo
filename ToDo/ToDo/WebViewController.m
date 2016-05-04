
//
//  WebViewController.m
//  ToDo
//
//  Created by Cubes School 10 on 5/4/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "WebViewController.h"


@interface WebViewController ()<UIWebViewDelegate>
@property(weak,nonatomic) IBOutlet UIWebView *webView;
@property(weak,nonatomic) IBOutlet UIButton *closeButton;
@property(strong,nonatomic) UIDynamicAnimator *animator;
-(IBAction)closeButtonTapped:(id)sender;

@end

@implementation WebViewController

#pragma mark - Actions

-(IBAction)closeButtonTapped:(id)sender{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
#pragma mark - Private API

- (void)animateCloseButton{
}


#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.closeButton.alpha = ZERO_VALUE;
    
  }

- (void) veiwDidAppear:(BOOL) animated {
    [super viewDidAppear:animated];
    
   //[self closeButtonTapped.animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
