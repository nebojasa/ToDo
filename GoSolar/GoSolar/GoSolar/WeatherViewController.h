//
//  WeatherViewController.h
//  GoSolar
//
//  Created by Nebojsa Gujanicic on 01/07/2016.
//  Copyright © 2016 Nebojsa Gujanicic. All rights reserved.
//

#import "BaseViewController.h"


@interface WeatherViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *imageWeather;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *descWeather;
@property (weak, nonatomic) IBOutlet UILabel *minTempWeather;
@property (weak, nonatomic) IBOutlet UILabel *maxTempWeather;
@property (strong, nonatomic) NSMutableArray *itemsArray;
@property(strong, nonatomic) NSMutableArray *maxTempArray;
@property(strong, nonatomic) NSMutableArray *minTempArray;
@property(strong, nonatomic) NSMutableArray *dayArray;
-(void) loadData;
@end
