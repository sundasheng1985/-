//
//  MCharDotView.h
//  一闪一闪动画
//
//  Created by 孙玉震 on 17/2/22.
//  Copyright © 2017年 孙玉震. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MCharDotView : UIView

@property (nonatomic ,strong) UIColor *color;

+ (MCharDotView *)blinkDot;
- (void)makeAnimation;
@end
