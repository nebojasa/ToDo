//
//  ViewController.m
//  CarCrash
//
//  Created by Djuro Alfirevic on 4/22/16.
//  Copyright © 2016 Djuro Alfirevic. All rights reserved.
//

#import "ViewController.h"
#import <AudioToolbox/AudioToolbox.h>

#define kConstant 80.0
@interface ViewController()
@property (weak, nonatomic) IBOutlet UIImageView *carImageView;
@property (weak, nonatomic) IBOutlet UIImageView *lampImageView;

@end

@implementation ViewController

#pragma mark - Private API

- (void)playSound {
    NSString *path  = [[NSBundle mainBundle] pathForResource:@"alert" ofType:@"mp3"];
    NSURL *pathURL = [NSURL fileURLWithPath :path];
    
    SystemSoundID audioEffect;
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)pathURL, &audioEffect);
    AudioServicesPlaySystemSound(audioEffect);
    
    //AudioServicesDisposeSystemSoundID(audioEffect);
}
#pragma mark - Public API

-(void) animateCar{
    [UIView animateWithDuration:1.3
                     animations:^{
        CGRect carframe = self.carImageView.frame;
        carframe.origin.x = kConstant;
        self.carImageView.frame = carframe;}];
}

#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *carImageView = [[UIImageView alloc] initWithFrame:CGRectMake(412, 474, 168, 106)];
    
    carImageView.image = [UIImage imageNamed:@"car.JPG"];
    [self.view addSubview:carImageView];
}

- (void)viewDidAppear:(BOOL)animated{
    while (self.carImageView.frame.origin.x > kConstant ) {
    [self animateCar];
    [self playSound];
}
    NSLog(@"Uf!!");
    

}
@end