//
//  UIViewController+Utilities.h
//  ToDo
//
//  Created by Cubes School 10 on 5/20/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constanc.h"

@interface UIViewController (Utilities)
- (void) presentErrorWithTitle:(NSString *)title andError:(NSString *)error;
@end
