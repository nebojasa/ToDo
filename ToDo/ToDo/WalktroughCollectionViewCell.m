//
//  WalktroughCollectionViewCell.m
//  ToDo
//
//  Created by macbook pro on 25/04/2016.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "WalktroughCollectionViewCell.h"

@implementation WalktroughCollectionViewCell

#pragma mark - Properties

-(void)setWalkthroughItem:(WalkthroughItem *)walkthroughItem{
    _walkthroughItem = walkthroughItem;
    
    self.imageView.image = walkthroughItem.image;
    self.textLabel.text = walkthroughItem.text;
}

@end
