//
//  CardCell.m
//  DragAndDropDemo
//
//  Created by Son Ngo on 2/10/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import "CardCell.h"
#import "CardView.h"

NSString * const CELL_REUSE_ID = @"CELL_ID";

@interface CardCell () {
  CardView *_cardView;
}

@end

#pragma mark -
@implementation CardCell

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    _cardView = [[CardView alloc] init];
    [self.contentView addSubview:_cardView];
  }
  return self;
}

- (void)setModel:(MyModel *)model {
  _model = model;
  
  _cardView.label.text = [NSString stringWithFormat:@"%d", _model.value];
}

#pragma mark - Overriden methods
- (void)layoutSubviews {
  [super layoutSubviews];
  
  _cardView.frame = self.bounds;
}

@end
