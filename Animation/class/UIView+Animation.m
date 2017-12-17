//
//  UIView+Animation.m
//  Animation
//
//  Created by 沛沛 on 2017/12/16.
//  Copyright © 2017年 沛沛. All rights reserved.
//

#import "UIView+Animation.h"
#import "UIView+GetAnimation.h"

@implementation UIView (Animation)



//平移到某一点
-(void)setPositionAnimationWithtX:(CGFloat)tX andtY:(CGFloat)tY duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block{
    CABasicAnimation *animate = [UIView getPositionAnimationWithtX:tX tY:tY duration:duration addition:block];
    [self.layer addAnimation:animate forKey:@"Translation"];
}

//放大，长宽放大缩小n倍。
-(void)setTransformMakeScaleAnimationWithWidthRatio:(CGFloat)W heightRatio:(CGFloat)H duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block{
    CGFloat currentW = self.bounds.size.width*W;
    CGFloat currentH = self.bounds.size.height*H;
    CABasicAnimation *animate = [UIView getScaleAnimationWithsX:currentW sY:currentH duration:duration addition:block];
    [self.layer addAnimation:animate forKey:@"Scale"];
}

//绕轴旋转某个角度
-(void)setTransform3DMakeRotationAnimationWithAngle:(CGFloat)angle isX:(CGFloat)X isY:(CGFloat)Y isZ:(CGFloat)Z duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block{
    CABasicAnimation *animate = [UIView get3DMakeRotationAnimationWithrX:X rY:Y rZ:Z angle:angle duration:duration addition:block];
    [self.layer addAnimation:animate forKey:@"Rotation"];
}

//淡入淡出
-(void)setOpacityAnimationWithOpacity:(float)opacity duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block{
    CABasicAnimation *animate = [UIView getOpacityAnimationWithOpacity:opacity duration:duration addition:block];
    [self.layer addAnimation:animate forKey:@"Opacity"];
}

//多帧移动动画
/*参数说明
 kCAAnimationLinear calculationMode的默认值,表示当关键帧为座标点的时候,关键帧之间直接直线相连进行插值计算;
 kCAAnimationDiscrete 离散的,就是不进行插值计算,所有关键帧直接逐个进行显示;
 kCAAnimationPaced 使得动画均匀进行,而不是按keyTimes设置的或者按关键帧平分时间,此时keyTimes和timingFunctions无效;
 kCAAnimationCubic 对关键帧为座标点的关键帧进行圆滑曲线相连后插值计算,对于曲线的形状还可以通过tensionValues,continuityValues,biasValues来进行调整自定义,这里的数学原理是Kochanek–Bartels spline,这里的主要目的是使得运行的轨迹变得圆滑;
 kCAAnimationCubicPaced 看这个名字就知道和kCAAnimationCubic有一定联系,其实就是在kCAAnimationCubic的基础上使得动画运行变得均匀,就是系统时间内运动的距离相同,此时keyTimes以及timingFunctions也是无效的.
 */
-(void)setKeyAnimationWithKeyPath:(NSArray*)keyPaths keyTimes:(NSArray *)keyTimes duration:(double)duration calculationMode:(NSString*)calculationMode additions:(void(^)(CAKeyframeAnimation *keyAnimate))block{
    CAKeyframeAnimation *keyAnimate = [UIView getCAKeyframeAnimationWithKeyPaths:keyPaths keyTimes:keyTimes calculationMode:calculationMode duration:duration addition:block];
    [self.layer addAnimation:keyAnimate forKey:@"GGKeyframeAnimation"];
}

//组合动画
-(void)setSerialAnimateWithAnimateGroup:(NSArray<CAAnimation*> *)aniArr duration:(double)duration additions:(void(^)(CAAnimationGroup *animaGroup))block{
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.animations = aniArr;
    animaGroup.duration = duration;
    animaGroup.fillMode = kCAFillModeBoth;
    animaGroup.removedOnCompletion = NO;
    if(block){
        block(animaGroup);
    }
    [self.layer addAnimation:animaGroup forKey:@"groupAnimation"];
}

//重复图层动画
-(void)setRepeatAnimationWithAnimations:(NSArray<CAAnimation*>*)animations instanceCount:(int)instanceCount instanceDelay:(float)instanceDelay repeatCount:(int)repeatCount{
    CAShapeLayer *caLayer = [CAShapeLayer layer];
    caLayer.frame = self.bounds;
    caLayer.path = [UIBezierPath bezierPathWithRect:caLayer.bounds].CGPath;
    caLayer.fillColor = (self.backgroundColor).CGColor;
    caLayer.opacity = self.alpha;
    
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = self.bounds;
    replicatorLayer.instanceCount = instanceCount;
    replicatorLayer.instanceDelay = instanceDelay;
    [replicatorLayer addSublayer:caLayer];
    
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.animations = animations;
    animaGroup.duration = instanceCount* instanceDelay;
    animaGroup.autoreverses = NO;
    animaGroup.repeatCount = repeatCount;
    
    [self.layer addSublayer:replicatorLayer];
    
    [caLayer addAnimation:animaGroup forKey:@"groupAnimation"];
}






@end
