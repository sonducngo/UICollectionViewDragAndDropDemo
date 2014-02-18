//
//  MyModel.h
//  DragAndDropDemo
//
//  Created by Son Ngo on 2/9/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface MyModel : NSObject

@property (nonatomic, assign) int value;

- (instancetype)initWithValue:(int)value;

@end
