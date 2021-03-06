//
//  DesignerTableViewCell.m
//  TableView
//
//  Created by Djuro Alfirevic on 4/18/16.
//  Copyright © 2016 Djuro Alfirevic. All rights reserved.
//

#import "DesignerTableViewCell.h"

@implementation DesignerTableViewCell

#pragma mark - Properties

- (void)setDesigner:(Designer *)designer {
    _designer = designer;
    
    self.designerNameLabel.text = designer.name;
    
    self.designerImageView.clipsToBounds = YES;
    self.designerImageView.layer.cornerRadius = self.designerImageView.frame.size.width/2;
    
    [self downloadImage];
}

#pragma mark - Private API

- (void)downloadImage {
    dispatch_queue_t downloadQueue = dispatch_queue_create("ImageDownloader", NULL);
    dispatch_async(downloadQueue, ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.designer.imageURL]];
        UIImage *image = [[UIImage alloc] initWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.designerImageView.image = image;
        });
    });
}

@end