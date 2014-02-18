//
//  CardCell.h
//  DragAndDropDemo
//
//  Created by Son Ngo on 2/10/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"

extern NSString * const CELL_REUSE_ID;

@interface CardCell : UICollectionViewCell

@property (nonatomic, strong) MyModel *model;

@end
