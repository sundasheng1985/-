//
//  MCharDotView.m
//  一闪一闪动画
//
//  Created by 孙玉震 on 17/2/22.
//  Copyright © 2017年 孙玉震. All rights reserved.
//

#import "MCharDotView.h"

@interface MCharDotView ()<CAAnimationDelegate>
@property (nonatomic, strong) CAShapeLayer *dot;
@property (nonatomic, strong) CAShapeLayer *dotAnimator;
@end
@implementation MCharDotView

+ (MCharDotView *)blinkDot{
    return [[MCharDotView alloc]initWithFrame:CGRectMake(0, 0, 4, 4)];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = NO;
        [self.layer addSublayer:self.dot];
        [self.layer addSublayer:self.dotAnimator];
    }
    return self;
}

- (CAShapeLayer *)dot{
    if (!_dot) {
        _dot = [CAShapeLayer layer];
        _dot.fillColor = [UIColor whiteColor].CGColor;
        _dot.path = CGPathCreateWithEllipseInRect(self.bounds, NULL);
        _dot.frame = self.bounds;
    }
    return _dot;
}

- (CAShapeLayer *)dotAnimator{
    if (!_dotAnimator) {
        _dotAnimator = [CAShapeLayer layer];
        _dotAnimator.fillColor = [UIColor whiteColor].CGColor;
        _dotAnimator.path = CGPathCreateWithEllipseInRect(self.bounds, NULL);
        _dotAnimator.frame = self.bounds;
    }
    return _dotAnimator;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    if (newSuperview) {
        [self makeAnimation];
    }
}
- (void)makeAnimation{
    [self.dotAnimator removeAnimationForKey:@"flashAnimation"];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.delegate = self;
    group.duration = 1.0;
    group.repeatCount = DBL_MAX;
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.byValue = @(2.0);
    
    CABasicAnimation *fadeAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    fadeAnimation.fromValue = @(1.0);
    fadeAnimation.toValue = @(0);
    group.animations = @[scaleAnimation,fadeAnimation];
    [self.dotAnimator addAnimation:group forKey:@"flashAnimation"];
    
}
- (void)setColor:(UIColor *)color{
    _color = color;
    self.dot.fillColor = color.CGColor;
    self.dotAnimator.fillColor = color.CGColor;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
