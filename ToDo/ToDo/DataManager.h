//
//  DataManager.h
//  ToDo
//
//  Created by Cubes School 10 on 5/11/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <CoreLocation/CoreLocation.h>

@interface DataManager : NSObject
@property (strong, nonatomic) CLLocation *userlocation;
@property (strong, nonatomic) NSString *userLocality;


+ (instancetype) sharedInstance;//singleton
- (NSMutableArray *) fetchEntity:(NSString *) entityName //fetch iz baze dohvatanje podataka iz baze
                     withFilter:(NSString *) filter
                    withSortAsc:(BOOL)sortAscending
                         forKey:(NSString *) sortKey;

- (void) deleteObjectInDatabase:(NSManagedObject *) object;

- (void) updateObjectInDatabase:(NSManagedObject *) object;

- (void) logObjectInDatabase:(NSManagedObject *) object;

- (CGFloat) numberOfTasksPerTaskGroup:(TaskGroup) group;

- (void) saveTaskWithTitle:(NSString *)title
               description:(NSString *)description
                     group:(NSInteger)group;

@end
