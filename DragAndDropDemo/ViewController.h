//
//  SDNViewController.h
//  DragAndDropDemo
//
//  Created by Son Ngo on 2/9/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyModel.h"

@interface ViewController : UIViewController

- (void)setSelectedModel:(MyModel *)model atPoint:(CGPoint)point;

@end
