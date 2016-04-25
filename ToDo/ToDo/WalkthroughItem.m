//
//  WalkthroughItem.m
//  ToDo
//
//  Created by macbook pro on 25/04/2016.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "WalkthroughItem.h"

@implementation WalkthroughItem

-(instancetype)initWithText:(NSString *)text andImage:(UIImage *)image{
    if (self = [super init]) {
        self.text = text;
        self.image = image;
    }
    return self;
}

@end
