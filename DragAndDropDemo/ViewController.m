//
//  SDNViewController.m
//  DragAndDropDemo
//
//  Created by Son Ngo on 2/9/14.
//  Copyright (c) 2014 Son Ngo. All rights reserved.
//

#import "ViewController.h"
#import "CardView.h"
#import "SourceViewController.h"
#import "DestinationViewController.h"

@interface ViewController () <UIGestureRecognizerDelegate> {
  SourceViewController *_sourceViewController;
  DestinationViewController *_destinationViewController;
  CardView *_draggedCard;
  MyModel *_model;
}

@property (weak, nonatomic) IBOutlet UICollectionView *destinationCollectionView;
@property (weak, nonatomic) IBOutlet UICollectionView *sourceCollectionView;

@end

#pragma mark -
@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  _sourceViewController = [[SourceViewController alloc] initWithCollectionView:self.sourceCollectionView
                                                       andParentViewController:self];
  _destinationViewController = [[DestinationViewController alloc] initWithCollectionView:self.destinationCollectionView ];
  
  [self initDraggedCardView];
  
  UIPanGestureRecognizer *panGesture =
    [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
  panGesture.delegate = self;
  [self.view addGestureRecognizer:panGesture];
}

- (void)setSelectedModel:(MyModel *)model atPoint:(CGPoint)point {
  _model = model;
  
  if (_model != nil) {
    _draggedCard.label.text = [NSString stringWithFormat:@"%d", model.value];
    _draggedCard.center = point;
    _draggedCard.hidden = NO;
    
    [self updateCardViewDragState:[self isValidDragPoint:point]];
  } else {
    _draggedCard.hidden = YES;
  }
}

#pragma mark - Validation helper methods on drag and drop
- (BOOL)isValidDragPoint:(CGPoint)point {
  return !CGRectContainsPoint(self.sourceCollectionView.frame, point);
}

- (void)updateCardViewDragState:(BOOL)validDropPoint {
  if (validDropPoint) {
    _draggedCard.alpha = 1.0f;
  } else {
    _draggedCard.alpha = 0.2f;
  }
}

#pragma mark - initialization code
- (void)initDraggedCardView {
  _draggedCard = [[CardView alloc] initWithFrame:CGRectMake(0, 0, 120, 140)];
  _draggedCard.hidden = YES;
  [_draggedCard setHighlightSelection:YES];
  
  [self.view addSubview:_draggedCard];
}

#pragma mark - Pan Gesture Recognizers/delegate
- (void)handlePan:(UIPanGestureRecognizer *)gesture {
  CGPoint touchPoint = [gesture locationInView:self.view];
  if (gesture.state == UIGestureRecognizerStateChanged
             && !_draggedCard.hidden) {
    // card is dragged
    _draggedCard.center = touchPoint;
    [self updateCardViewDragState:[self isValidDragPoint:touchPoint]];
  } else if (gesture.state == UIGestureRecognizerStateRecognized
             && _model != nil) {
    _draggedCard.hidden = YES;
    
    BOOL validDropPoint = [self isValidDragPoint:touchPoint];
    [_sourceViewController cellDragCompleteWithModel:_model withValidDropPoint:validDropPoint];
    if (validDropPoint) {
      [_destinationViewController addModel:_model];
    }
    _model = nil;
  }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
  return YES;
}

@end
