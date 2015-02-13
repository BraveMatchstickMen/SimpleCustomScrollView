//
//  SimpleCustomScrollView.m
//  CustomScrollView
//
//  Created by BraveMatch on 15/2/10.
//  Copyright (c) 2015年 BraveMatch. All rights reserved.
//

#import "SimpleCustomScrollView.h"

@implementation SimpleCustomScrollView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 给视图添加pan手势
        UIPanGestureRecognizer *gestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
        [self addGestureRecognizer:gestureRecognizer];
    }
    return self;
}




- (void)handlePanGesture:(UIPanGestureRecognizer *)gestureRecognizer
{
    // translationInView 这个方法返回的是:在指定父视图坐标系统中, 横、纵坐标移动的坐标
    CGPoint translation = [gestureRecognizer translationInView:self];
    CGRect bounds = self.bounds;
    
    // 动态改变bounds
    CGFloat newBoundsOriginX = bounds.origin.x - translation.x;
    CGFloat minBoundsOriginX = 0.0;
    CGFloat maxBoundsOriginX = self.contentSize.width - bounds.size.width;
    bounds.origin.x = fmax(minBoundsOriginX, fmin(newBoundsOriginX, maxBoundsOriginX));
    
    CGFloat newBoundsOriginY = bounds.origin.y - translation.y;
    CGFloat minBoundsOriginY = 0.0;
    CGFloat maxBoundsOriginY = self.contentSize.height - bounds.size.height;
    bounds.origin.y = fmax(minBoundsOriginY, fmin(newBoundsOriginY, maxBoundsOriginY));
    
    self.bounds = bounds;
    
    // 因为拖动起来一直是在递增, 所以每次都要用 setTranslation: 方法置0
    [gestureRecognizer setTranslation:CGPointZero inView:self];
    
    // 真相只有一个, 打印一下
    NSLog(@"self.view's bounds is : %@", NSStringFromCGRect(self.bounds));
}





@end
