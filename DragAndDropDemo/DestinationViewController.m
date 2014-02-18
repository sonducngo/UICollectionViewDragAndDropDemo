//
//  DestinationViewController.m
//  DragAndDropDemo
//
//  Created by Son Ngo on 2/13/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import "DestinationViewController.h"
#import "CardCell.h"

@interface DestinationViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout> {
  NSMutableArray *_models;
  UICollectionView *_collectionView;
}

@end

#pragma mark -
@implementation DestinationViewController

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView {
  if (self = [super init]) {
    _models = [NSMutableArray array];
    
    _collectionView = collectionView;
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [_collectionView registerClass:[CardCell class] forCellWithReuseIdentifier:CELL_REUSE_ID];
  }
  return self;
}

- (void)addModel:(MyModel *)model {
  [_models addObject:model];
  
  [_collectionView reloadData];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  return _models.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  CardCell *cell = (CardCell *)[_collectionView dequeueReusableCellWithReuseIdentifier:CELL_REUSE_ID forIndexPath:indexPath];
  
  MyModel *model = [_models objectAtIndex:indexPath.item];
  cell.model = model;
  
  return cell;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
  return CGSizeMake(100, 120);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
  return UIEdgeInsetsMake(20, 40, 0, 40);
}

@end
