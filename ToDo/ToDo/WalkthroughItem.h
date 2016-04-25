//
//  WalkthroughItem.h
//  ToDo
//
//  Created by macbook pro on 25/04/2016.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface WalkthroughItem : NSObject
@property(strong,nonatomic)NSString *text;
@property(strong,nonatomic)UIImage *image;

-(instancetype)initWithText: (NSString *)text andImage:(UIImage *)image;
@end
