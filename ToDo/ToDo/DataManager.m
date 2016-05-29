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
@property (strong, nonatomic) NSManagedObjectContext *manageObjectContext;//kljucna stvar za baze se radi preko ManageObjectContext
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
            
            //Videcu sta ovde ide
            //
            //
            //
            
            [[NSNotificationCenter defaultCenter] postNotificationName:CITY_CHANGED object:nil];// Poslali smo lokaciju da je grad promenjen
        }
    }];
}

- (NSManagedObjectContext *)managedObjectContext {
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    _manageObjectContext = appDelegate.managedObjectContext;
    
    return appDelegate.managedObjectContext;
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
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc]init];//zahtev za fetchovanj podataka
    NSEntityDescription *entityDescription = [NSEntityDescription entityForName:entityName
                                                         inManagedObjectContext:self.manageObjectContext];// prva stvar koju radimo
    [fetchRequest setEntity:entityDescription];
    
    //Sorting
    if (sortKey !=nil) {
        NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:sortKey ascending:sortAscending];
        NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];//pravimo niz od sort deskriptora
        //NSArray *sortDescriptors = @[sortDescriptor];
        [fetchRequest setSortDescriptors:sortDescriptors];
    }
    
    //Filtering
    
    if (filter != nil ) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:filter];//Definisali smo NSPredicate kao where in sql
        [fetchRequest setPredicate:predicate];
    }
    
    NSError *error;
    NSMutableArray *resultsArray = [[self.manageObjectContext executeFetchRequest:fetchRequest error:&error]mutableCopy];//&error bocni efekat
    
//    NSArray *array = [self.manageObjectContext executeFetchRequest:fetchRequest error:&error];
//    NSMutableArray *resultsArray = [NSMutableArray arrayWithArray:array];
//    
    if (resultsArray == nil) NSLog(@"Error fetching %@(s).", entityName);

    return resultsArray;
}

- (void) deleteObjectInDatabase:(NSManagedObject *) object {
    [self.manageObjectContext deleteObject:object];
    [self saveToDatabase];
    
}

- (void) updateObjectInDatabase:(NSManagedObject *) object {
    NSError *error = nil;
    if ([object.managedObjectContext hasChanges] && ![object.managedObjectContext save:&error]) {
        NSLog(@"Error updating to database: %@, %@", [error localizedDescription], [error userInfo]);
        abort();
    }
    
}

- (void) logObjectInDatabase:(NSManagedObject *) object {
    NSEntityDescription *description = [object entity];
    NSDictionary *attributes = [description attributesByName];
    
    for (NSString *attribute in attributes) {
        NSLog(@"%@ = %@,",attribute, [object valueForKey:attribute]);
    }

    
}

- (CGFloat) numberOfTasksPerTaskGroup:(TaskGroup) group{
    NSArray *tasksArray = [self fetchEntity:NSStringFromClass([Task class])
                                withFilter:[NSString stringWithFormat:@"group = %ld", group]
                               withSortAsc:NO
                                    forKey:nil];

    return tasksArray.count;
}

- (void) saveTaskWithTitle:(NSString *)title
               description:(NSString *)description
                     group:(NSInteger)group {

    Task *task = (Task *)[NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass([Task class]) inManagedObjectContext:self.managedObjectContext];
    task.heading = title;
    task.desc = description;
    if (self.userlocation) {
        task.latitude = [NSNumber numberWithFloat:self.userlocation.coordinate.latitude];
        task.longitude = [NSNumber numberWithFloat:self.userlocation.coordinate.longitude];
    }
    task.date = [NSDate date];
    task.group = [NSNumber numberWithInteger:group];
    
    [self saveToDatabase];
}

#pragma mark - Private API

- (void) saveToDatabase {
    NSError *error = nil;
    if ([self.managedObjectContext hasChanges] &&![self.managedObjectContext save:&error]) {
            NSLog(@"Error saving to database: %@, %@", [error localizedDescription], [error userInfo]);
            abort();
    }
}

@end
