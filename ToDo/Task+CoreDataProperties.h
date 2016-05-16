//
//  Task+CoreDataProperties.h
//  ToDo
//
//  Created by Cubes School 10 on 5/11/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Task.h"

NS_ASSUME_NONNULL_BEGIN

@interface Task (CoreDataProperties)
    //svojstva koja se nalaze u bazi
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSString *desc;
@property (nullable, nonatomic, retain) NSNumber *group;
@property (nullable, nonatomic, retain) NSString *heading;
@property (nullable, nonatomic, retain) NSNumber *latitude;//Vraper klasa kako od primitovnog tipa napraviti objektni
@property (nullable, nonatomic, retain) NSNumber *longitude;

@end

NS_ASSUME_NONNULL_END
