//
//  MyModel.m
//  DragAndDropDemo
//
//  Created by Son Ngo on 2/9/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import "MyModel.h"

#pragma mark - 
@implementation MyModel

- (instancetype)initWithValue:(int)value {
  if (self = [super init]) {
    self.value = value;
  }
  return self;
}

@end
