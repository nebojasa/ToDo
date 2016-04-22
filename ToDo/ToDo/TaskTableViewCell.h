//
//  TaskTableViewCell.h
//  ToDo
//
//  Created by macbook pro on 22/04/2016.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *taskTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *taskDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *taskGroupView;
@end