//
//  HomeViewController.m
//  GoSolar
//
//  Created by Nebojsa Gujanicic on 30/06/2016.
//  Copyright © 2016 Nebojsa Gujanicic. All rights reserved.
//

#import "HomeViewController.h"
#import "WeatherViewController.h"
#import "MapViewController.h"
#import "AboutViewController.h"
#import "WebViewController.h"
#import "ToolsViewController.h"
#import "FacebookViewController.h"
#import "CostsViewController.h"
#import "PhotovoltaicsViewController.h"
#import "SettingsViewController.h"
#import "Helpers.h"


@interface HomeViewController ()
@end

@implementation HomeViewController

#pragma mark - Actions

- (IBAction)weatherButtonTapped {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    WeatherViewController *toViewController = [storyboard instantiateViewControllerWithIdentifier:@"WeatherViewController"];
    [self presentViewController:toViewController animated:YES completion:NULL];
}

- (IBAction)mapButtonTapped {

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MapViewController *toViewController = [storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    [self presentViewController:toViewController animated:YES completion:NULL];
}

- (IBAction)webButtonTapped {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    WebViewController *toViewController = [storyboard instantiateViewControllerWithIdentifier:@"WebViewController"];
    toViewController.modalTransitionStyle = UIModalTransitionStylePartialCurl;
    [self presentViewController:toViewController animated:YES completion:NULL];

}

- (IBAction)toolsButtonTapped {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    ToolsViewController *toViewController = [storyboard instantiateViewControllerWithIdentifier:@"ToolsViewController"];
    [self presentViewController:toViewController animated:YES completion:NULL];
    

}

- (IBAction)faceButtonTapped {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    FacebookViewController *toViewController = [storyboard instantiateViewControllerWithIdentifier:@"FacebookViewController"];
    [self presentViewController:toViewController animated:YES completion:NULL];
    

}

- (IBAction)costsButtonTapped {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    CostsViewController *toViewController = [storyboard instantiateViewControllerWithIdentifier:@"CostsViewController"];
    [self presentViewController:toViewController animated:YES completion:NULL];
    

}

- (IBAction)photovoltaicsButtonTapped {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    PhotovoltaicsViewController *toViewController = [storyboard instantiateViewControllerWithIdentifier:@"PhotovoltaicsViewController"];
    [self presentViewController:toViewController animated:YES completion:NULL];
}

- (IBAction)aboutUsButtonTapped {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    AboutViewController *toViewController = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
    [self presentViewController:toViewController animated:YES completion:NULL];
}

- (IBAction)settingsButtonTapped {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SettingsViewController *toViewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    [self presentViewController:toViewController animated:YES completion:NULL];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
}

@end
