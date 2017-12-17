//
//  ViewController.m
//  Animation
//
//  Created by 沛沛 on 2017/12/15.
//  Copyright © 2017年 沛沛. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Animation.h"
@interface ViewController ()
@property(nonatomic,strong) UIView *view1;
@property(nonatomic,strong) UIView *view2;
@property(nonatomic,strong) UIView *view3;
@property(nonatomic,strong) UIView *view4;
@property(nonatomic,strong) UIView *view5;
@property(nonatomic,strong) UIView *view6;
@property(nonatomic,strong) UIView *view7;
@property(nonatomic,strong) UIButton *btn1;
@property(nonatomic,strong) UIButton *btn2;
@property(nonatomic,strong) UIButton *btn3;
@property(nonatomic,strong) UIButton *btn4;
@property(nonatomic,strong) UIButton *btn5;
@property(nonatomic,strong) UIButton *btn6;
@property(nonatomic,strong) UIButton *btn7;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _view1 = [[UIView alloc]initWithFrame:CGRectMake(50, 20, 50, 50)];
    _view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_view1];
    _view2 = [[UIView alloc]initWithFrame:CGRectMake(50, 100, 50, 50)];
    _view2.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_view2];
    _view3 = [[UIView alloc]initWithFrame:CGRectMake(50, 180, 50, 50)];
    _view3.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_view3];
    _view4 = [[UIView alloc]initWithFrame:CGRectMake(50, 260, 50, 50)];
    _view4.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_view4];
    _view5 = [[UIView alloc]initWithFrame:CGRectMake(50, 340, 50, 50)];
    _view5.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_view5];
    _view6 = [[UIView alloc]initWithFrame:CGRectMake(50, 420, 50, 50)];
    _view6.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_view6];
    _view7 = [[UIView alloc]initWithFrame:CGRectMake(50, 550, 50, 50)];
    _view7.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_view7];
    
    _btn1 = [[UIButton alloc]initWithFrame:CGRectMake(200, 20, 150, 20)];
    [_btn1 setTitle:@"位移" forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_btn1 addTarget:self action:@selector(tap1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn1];
    _btn2 = [[UIButton alloc]initWithFrame:CGRectMake(200, 100, 150, 20)];
    [_btn2 setTitle:@"缩放" forState:UIControlStateNormal];
    [_btn2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_btn2 addTarget:self action:@selector(tap2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn2];
    _btn3 = [[UIButton alloc]initWithFrame:CGRectMake(200, 180, 150, 20)];
    [_btn3 setTitle:@"旋转" forState:UIControlStateNormal];
    [_btn3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_btn3 addTarget:self action:@selector(tap3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn3];
    _btn4 = [[UIButton alloc]initWithFrame:CGRectMake(200, 260, 150, 20)];
    [_btn4 setTitle:@"透明" forState:UIControlStateNormal];
    [_btn4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_btn4 addTarget:self action:@selector(tap4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn4];
    _btn5 = [[UIButton alloc]initWithFrame:CGRectMake(200, 340, 150, 20)];
    [_btn5 setTitle:@"帧动画" forState:UIControlStateNormal];
    [_btn5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_btn5 addTarget:self action:@selector(tap5) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn5];
    _btn6 = [[UIButton alloc]initWithFrame:CGRectMake(200, 420, 150, 20)];
    [_btn6 setTitle:@"组合动画" forState:UIControlStateNormal];
    [_btn6 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_btn6 addTarget:self action:@selector(tap6) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn6];
    _btn7 = [[UIButton alloc]initWithFrame:CGRectMake(200, 550, 150, 20)];
    [_btn7 setTitle:@"重复动画" forState:UIControlStateNormal];
    [_btn7 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [_btn7 addTarget:self action:@selector(tap7) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn7];
    
}

-(void)tap1{
    [_view1 setPositionAnimationWithtX:150 andtY:45 duration:3 additions:nil];
}
-(void)tap2{
    [_view2 setTransformMakeScaleAnimationWithWidthRatio:1.5 heightRatio:0.5 duration:2 additions:nil];
}
-(void)tap3{
    [_view3 setTransform3DMakeRotationAnimationWithAngle:M_PI isX:0 isY:0 isZ:1 duration:2 additions:nil];
}
-(void)tap4{
    [_view4 setOpacityAnimationWithOpacity:0.2 duration:2 additions:nil];
}
-(void)tap5{
    NSArray *keyPointArr = @[[NSValue valueWithCGPoint:CGPointMake(75, 365)],[NSValue valueWithCGPoint:CGPointMake(300, 20)],[NSValue valueWithCGPoint:CGPointMake(10, 150)],[NSValue valueWithCGPoint:CGPointMake(175, 265)],[NSValue valueWithCGPoint:CGPointMake(275, 365)],[NSValue valueWithCGPoint:CGPointMake(240, 465)],[NSValue valueWithCGPoint:CGPointMake(175, 565)],[NSValue valueWithCGPoint:CGPointMake(75, 365)]];
    [_view5 setKeyAnimationWithKeyPath:keyPointArr keyTimes:nil duration:4 calculationMode:kCAAnimationCubicPaced additions:nil];
}
-(void)tap6{
    [_view6 setSerialAnimateWithAnimateGroup:@[[UIView getOpacityAnimationWithOpacity:0.3 duration:4 addition:nil],[UIView getCATransform3DScaleAnimationWithXRatio:2.5 YRatio:1.3 duration:4 addition:nil]] duration:4 additions:nil];
}
-(void)tap7{
    [_view7 setRepeatAnimationWithAnimations:@[[UIView getOpacityAnimationWithOpacity:0 duration:4 addition:nil],[UIView getCATransform3DScaleAnimationWithXRatio:2 YRatio:2 duration:4 addition:nil],[UIView get3DMakeRotationAnimationWithrX:0 rY:0 rZ:1 angle:M_PI duration:4 addition:nil]] instanceCount:4 instanceDelay:1 repeatCount:1000];
}

@end
