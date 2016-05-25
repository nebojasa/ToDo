//
//  MenuView.h
//  ToDo
//
//  Created by Cubes School 10 on 5/18/16.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, MenuOption) {//definisanje tagova za buttone na xibview
    TASK_DETAILS_MENU_OPTION = 1,
    ABOUT_MENU_OPTION,
    STATISTICS_MENU_OPTION,
    WALKTHROUGH_MENU_OPTION
};

@protocol MenuViewDelegate <NSObject>
@required
- (void)menuViewOptionTapped:(MenuOption) option;
- (void) menuViewDidOpened;
- (void) menuViewDidClosed;
@end

@interface MenuView : UIView
@property (weak,nonatomic)IBOutlet id<MenuViewDelegate> delegate;
@end
