//
//  ViewController.m
//  一闪一闪动画
//
//  Created by 孙玉震 on 17/2/22.
//  Copyright © 2017年 孙玉震. All rights reserved.
//

#import "ViewController.h"
#import "MCharDotView.h"
@interface ViewController ()
@property (nonatomic,strong) MCharDotView *dotView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.dotView = [MCharDotView blinkDot];
    self.dotView.color = [UIColor yellowColor];
    UIView *superView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 20, 20)];
    superView.backgroundColor = [UIColor grayColor];
    [superView addSubview:_dotView];
    _dotView.center = superView.center;
    NSLog(@"%.2f, %.2f",_dotView.center.x,_dotView.center.y);
    [self.view addSubview:superView];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAtion) userInfo:nil repeats:YES];
    [timer fire];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)timerAtion{
    CGFloat x = self.dotView.center.x +1;
    self.dotView.center = CGPointMake(x, self.dotView.center.y);
     NSLog(@"%.2f, %.2f",_dotView.center.x,_dotView.center.y);
    [self.dotView makeAnimation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
