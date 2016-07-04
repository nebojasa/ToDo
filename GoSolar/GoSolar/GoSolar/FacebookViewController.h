//
//  FacebookViewController.h
//  GoSolar
//
//  Created by Nebojsa Gujanicic on 01/07/2016.
//  Copyright © 2016 Nebojsa Gujanicic. All rights reserved.
//

#import "BaseViewController.h"

@interface FacebookViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UIButton *buttonToggleLoginState;
@property (weak, nonatomic) IBOutlet UIImageView *imageProfilePicture;
@property (weak, nonatomic) IBOutlet UILabel *labelFullname;
@property (weak, nonatomic) IBOutlet UILabel *labelEmail;
@property (weak, nonatomic) IBOutlet UILabel *labelStatus;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)loginButtonClicked;
@end
