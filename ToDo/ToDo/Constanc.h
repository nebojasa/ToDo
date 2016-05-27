//
//  Constants.h
//  ToDo
//
//  Created by macbook pro on 22/04/2016.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#ifndef Constanc_h
#define Constanc_h

//Macros
#define COLOR(r,g,b,a)              [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//Notifications
static NSString *const SHOW_HOME            =@"SHOW_HOME";
static NSString *const CITY_CHANGED         =@"CITY_CHANGED";
static NSString *const SHOW_LOGIN         =@"SHOW_LOGIN";
static NSString *const OK_STRING         =@"OK";
static NSString *const EMPTY_STRING         =@"";
static NSString *const LOGGED_IN         =@"Yes";
//Colors

#define kOrangeColor                COLOR(254.0, 172.0, 73.0, 1.0)
#define kPurpleColor                COLOR(187.0, 114.0, 255.0, 1.0)
#define kTurquoiseColor             COLOR(72.0, 211.0, 194.0, 1.0)
#define kDescPlaceholderColor       COLOR(29.0, 29.0, 38.0, 1.0)

//Strings and Numbers

#define ZERO_VALUE                  0.0


//Enums
//User defaults
static NSString *const USER_IMAGE   =@"USER_IMAGE";
static NSString *const WALKTROUGH_PRESENTED   =@"WalkThrough";
static NSString *const CUBES_URL = @"http://www.cubes.rs";
typedef NS_ENUM (NSInteger, TaskGroup) {
    COMPLETED_TASK_GROUP = 1,
    NOT_COMPLETED_TASK_GROUP,
    IN_PROGRESS_TASK_GROUP,
};

#endif /* Constanc_h */
