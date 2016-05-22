//
//  HomeViewController.m
//  ToDo
//
//  Created by Cubes School 10 on 4/8/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "HomeViewController.h"
#import "TaskTableViewCell.h"
#import "Constanc.h"
#import "MenuView.h"

@interface HomeViewController() <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MenuViewDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (weak, nonatomic) IBOutlet MenuView *menuView;
@end

@implementation HomeViewController

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.taskTitleLabel.text = [NSString stringWithFormat: @"red %ld", indexPath.row];
    
    switch (indexPath.row) {
            
        case COMPLETED_TASK_GROUP:
            cell.taskGroupView.backgroundColor = kTurquoiseColor;
            break;
            
        case NOT_COMPLETED_TASK_GROUP:
            cell.taskGroupView.backgroundColor = kPurpleColor;
            break;
            
        case IN_PROGRESS_TASK_GROUP:
            cell.taskGroupView.backgroundColor = kOrangeColor;
            break;
            
        default:
            cell.taskGroupView.backgroundColor = [UIColor redColor];
            break;
    }
    
    return cell;
}

- (void)pickImage {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Choose source:" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
        pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        pickerController.delegate = self;
        pickerController.allowsEditing = YES;
        [self presentViewController:pickerController animated:YES completion:nil];
        
        
    }]];
    
    if (![UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear] || [UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
        [alertController addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
            pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            pickerController.delegate = self;
            pickerController.allowsEditing = YES;
            [self presentViewController:pickerController animated:YES completion:nil];
            
        }]];
        
    }
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
        
    }]];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(pickImage)];
    self.profileImageView.userInteractionEnabled = YES;
    tap.numberOfTapsRequired = 1;
    [self.profileImageView addGestureRecognizer:tap];
    
    self.menuView.delegate = self;//delekat za menu view je homeviewcontroller
    self.profileImageView.clipsToBounds = YES;
    self.profileImageView.layer.cornerRadius = self.profileImageView.frame.size.width/2;

//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//       [self performSegueWithIdentifier:@"TaskDetailsSegue" sender:self];
//   });
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//    [self performSegueWithIdentifier:@"Websegue" sender:self];
//        [self presentErrorWithTitle:@"Internet" andError:@"Nemate internet konekciju"];
//    });
    

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//      if (![[NSUserDefaults standardUserDefaults] boolForKey:WALKTROUGH_PRESENTED]) {
//          [self performSegueWithIdentifier:@"WalkThrough" sender:self];
//    }
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

#pragma mark - Private API

- (void)configureProfileImage {
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:USER_IMAGE]) {
        NSData *data = [[NSUserDefaults standardUserDefaults] objectForKey:USER_IMAGE];
        
        self.profileImageView.image = [UIImage imageWithData:data];
    }
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if (!image) {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    self.profileImageView.image = image;
    
    NSData *data = UIImageJPEGRepresentation(image, 1.0);
    
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:USER_IMAGE];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
    //After picking image, dismiss image
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - MenuViewDelegate

- (void) menuViewOptionTapped:(MenuOption)option {
    switch (option) {
        case TASK_DETAILS_MENU_OPTION:
            [self performSegueWithIdentifier:@"TaskDetailsSegue" sender:nil];
            break;
        case STATISTICS_MENU_OPTION:
            [self performSegueWithIdentifier:@"StatisticsSegue" sender:nil];
            break;
        case WALKTHROUGH_MENU_OPTION:
            [self performSegueWithIdentifier:@"WalkThrough" sender:nil];
            break;
        case ABOUT_MENU_OPTION:
            [self performSegueWithIdentifier:@"WalkThrough" sender:nil];
            break;
        default:
            break;
    }
}

@end