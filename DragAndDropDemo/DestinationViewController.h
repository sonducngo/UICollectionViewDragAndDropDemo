//
//  DestinationViewController.h
//  DragAndDropDemo
//
//  Created by Son Ngo on 2/13/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyModel.h"
#import "ViewController.h"

@interface DestinationViewController : NSObject

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView;
- (void)addModel:(MyModel *)model;

@end
