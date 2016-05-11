//
//  DataManager.m
//  ToDo
//
//  Created by Cubes School 10 on 5/11/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "DataManager.h"
#import "AppDelegate.h"
#import "Task.h"
#import <MapKit/MapKit.h>

@interface DataManager()
@property (strong, nonatomic) NSManagedObjectContext *manageObjectContext;
@end

@implementation DataManager

#pragma mark - Properties

- (void) setUserlocation:(CLLocation *)userlocation {

    _userlocation = userlocation;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:userlocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if (error) {
            NSLog(@"CLGeocoder error: %@", [error localizedDescription]);
        }
        if (placemarks.count>0) {
            CLPlacemark *placemark = [placemarks firstObject];
            
            self.userLocality = placemark.locality;
            
            //
            //
            //
            //
            
            [[NSNotificationCenter defaultCenter] postNotificationName:CITY_CHANGED object:nil];
        }
    }];
}

- (NSManagedObjectContext *)manageObjectContext {
    if (!_manageObjectContext) {
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        _manageObjectContext = appDelegate.managedObjectContext;
    }
    return _manageObjectContext;
}



#pragma mark - Public API

+ (instancetype)sharedInstance{

    static DataManager *sharedManager;
    @synchronized (self) {
        if (sharedManager  == nil) {
            sharedManager = [[DataManager alloc] init];
        }
    }
    return sharedManager;
}

- (NSMutableArray *) fetchEntity:(NSString *) entityName //fetch iz baze dohvatanje podataka iz baze
                      withFilter:(NSString *) filter
                     withSortAsc:(BOOL)sortAscending
                          forKey:(NSString *) sortKey {
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:
                                              entityName inManagedObjectContext:self.manageObjectContext];
    [fetchRequest setEntity:entityDescription];
    
    //Sorting
    if (sortKey !=nil) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortKey ascending:sortAscending];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
        //NSArray *sortDescriptors = @[sortDescriptor];
        [fetchRequest setSortDescriptors:sortDescriptors];
    }
    
    //Filtering
    
    if (filter != nil ) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:filter];
        [fetchRequest setPredicate:predicate];
    }
    
    NSError *error;
    NSMutableArray *resultsArray = [[self.manageObjectContext executeFetchRequest:fetchRequest error:&error]mutableCopy];
    
    //NSArray *array = [self.manageObjectContext executeFetchRequest:fetchRequest error:&error];
    //NSMutableArray *resultsArray = [NSMutableArray arrayWithArray:array];
    
    if (resultsArray == nil) NSLog(@"Error fetching %@(s).", entityName);

    return resultsArray;
}

- (void) deleteObjectInDatabase:(NSManagedObject *) object {

    
}

- (void) updateObjectInDatabase:(NSManagedObject *) object {

    
}

- (void) logObjectInDatabase:(NSManagedObject *) object {

    
}

- (CGFloat) numberOfTasksPerTaskGroup:(TaskGroup) group{

    return 0.0;
}

- (void) saveTaskWithTitle:(NSString *)title
               description:(NSString *)description
                     group:(NSInteger)group {

}

@end
