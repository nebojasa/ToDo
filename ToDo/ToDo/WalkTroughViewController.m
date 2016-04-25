//
//  WalkTroughViewController.m
//  ToDo
//
//  Created by macbook pro on 22/04/2016.
//  Copyright © 2016 Cubes School 10. All rights reserved.
//

#import "WalkTroughViewController.h"
#import "Constanc.h"
#import "WalkthroughItem.h"
#import "WalktroughCollectionViewCell.h"

@interface WalkTroughViewController() <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (strong, nonatomic) NSArray *itemsArray;
@end

@implementation WalkTroughViewController

#pragma mark - Actions

- (IBAction)closeButtonTapped:(UIButton *)sender {
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:WALKTROUGH_PRESENTED];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.itemsArray = @[
                        [[WalkthroughItem alloc] initWithText:@"Keep your work organized and\nquickly check your reminders\nwith simple calendar." andImage:[UIImage imageNamed:@"calendar"]],
                        [[WalkthroughItem alloc] initWithText:@"Manage your tasks quick and easy\nfromyour phone." andImage:[UIImage imageNamed:@"phone"]],
                        [[WalkthroughItem alloc] initWithText:@"Quickly add tasks\nfrom home screen." andImage:[UIImage imageNamed:@"tasks"]]
                        ];
    self.pageControl.numberOfPages = self.itemsArray.count;
    self.closeButton.alpha = 0.0;
                        
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.itemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WalktroughCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    WalkthroughItem *item = [self.itemsArray objectAtIndex:indexPath.item];
    cell.walkthroughItem = item;
    self.pageControl.currentPage = indexPath.item;
    
    return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width, collectionView.frame.size.height);
}

@end