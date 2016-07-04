//
//  WeatherViewController.m
//  GoSolar
//
//  Created by Nebojsa Gujanicic on 01/07/2016.
//  Copyright © 2016 Nebojsa Gujanicic. All rights reserved.
//

#import "WeatherViewController.h"
#import "Constants.h"

@interface WeatherViewController ()<UITableViewDataSource,UITableViewDelegate>
@end

@implementation WeatherViewController
#pragma mark - Properties

- (NSMutableArray *)itemsArray {//lazy loading..
    if (!_itemsArray) {
        _itemsArray = [[NSMutableArray alloc] init];
    }
    
    return _itemsArray;
}
#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
}

- (void)loadData {
    
    dispatch_queue_t downloadQueue = dispatch_queue_create("WeatherDownloader", NULL);
    dispatch_async(downloadQueue, ^{
        
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:WEATHER_URL]];
        
        NSError *error;
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        
        if (error) {
            NSLog(@"%@", [error localizedDescription]);
        }
        
        if (data) {
            
            NSData *jsonData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            NSData *currentData = [jsonData valueForKey:@"curently"];
            NSString *temperatureString = [currentData valueForKey:@"temperature"];
            
            float farenhajt = temperatureString.floatValue;
            float celsius = (farenhajt - 32.0)*(5.0/9.0);
            
            NSLog(@"Trenutna temperatura na lokaciji je: %.2f",celsius);
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            
            [self.tableView reloadData];
        });
    });
}


#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}
@end
