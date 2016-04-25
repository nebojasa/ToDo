//
//  WalktroughCollectionViewCell.h
//  ToDo
//
//  Created by macbook pro on 25/04/2016.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WalkthroughItem.h"

@interface WalktroughCollectionViewCell : UICollectionViewCell
@property(weak, nonatomic) IBOutlet UIImageView *imageView;
@property(weak,nonatomic) IBOutlet UILabel *textLabel;
@property(weak,nonatomic) WalkthroughItem *walkthroughItem;
@end
