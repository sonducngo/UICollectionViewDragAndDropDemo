//
//  CardView.m
//  DragAndDropDemo
//
//  Created by Son Ngo on 2/9/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import "CardView.h"

#pragma mark -
@implementation CardView

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    self.label               = [[UILabel alloc] init];
    self.label.font          = [UIFont boldSystemFontOfSize:48];
    self.label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.label];
    
    self.backgroundColor    = [UIColor whiteColor];
    self.layer.cornerRadius = 10.0f;
  }
  return self;
}

- (void)layoutSubviews {
  [super layoutSubviews];
  
  self.label.frame = self.bounds;
}

#pragma mark - Public methods
- (void)setHighlightSelection:(BOOL)highlight {
  if (highlight) {
    self.layer.borderColor = [UIColor blueColor].CGColor;
    self.layer.borderWidth = 5.0f;
  } else {
    self.layer.borderWidth = 0.0f;
  }
}

@end
