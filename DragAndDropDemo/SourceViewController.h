//
//  SourceViewController.h
//  DragAndDropDemo
//
//  Created by Son Ngo on 2/10/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ViewController.h"
#import "MyModel.h"

@interface SourceViewController : NSObject

- (instancetype)initWithCollectionView:(UICollectionView *)view
               andParentViewController:(ViewController *)parent;

- (void)cellDragCompleteWithModel:(MyModel *)model
               withValidDropPoint:(BOOL)validDropPoint;

@end
