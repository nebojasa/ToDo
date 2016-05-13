//
//  Task+CoreDataProperties.m
//  ToDo
//
//  Created by Cubes School 10 on 5/11/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Task+CoreDataProperties.h"

@implementation Task (CoreDataProperties)
    //kada radimo sa bazom i definisemo entitet i generisi mi subclasu za entitete
    //dok nasa app radi svi propertiji se generisu dinamicki
@dynamic date;
@dynamic desc;
@dynamic group;
@dynamic heading;
@dynamic latitude;
@dynamic longitude;

@end
