//
//  UIView+GetAnimation.m
//  Animation
//
//  Created by 沛沛 on 2017/12/17.
//  Copyright © 2017年 沛沛. All rights reserved.
//

#import "UIView+GetAnimation.h"

@implementation UIView (GetAnimation)

//获取平移动画
+(CABasicAnimation *)getPositionAnimationWithtX:(CGFloat)X tY:(CGFloat)Y duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block{
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"position"];
    animate.toValue = [NSValue valueWithCGPoint:CGPointMake(X, Y)];
    animate.removedOnCompletion = NO;
    animate.fillMode = kCAFillModeForwards;
    animate.duration = duration;
    if(block){
        block(animate);
    }
    return animate;
}


//获取缩放动作
+(CABasicAnimation *)getScaleAnimationWithsX:(CGFloat)X sY:(CGFloat)Y duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block{
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
    animate.toValue = [NSValue valueWithCGSize:CGSizeMake(X, Y)];
    animate.removedOnCompletion = NO;
    animate.fillMode = kCAFillModeForwards;
    animate.duration = duration;
    if(block){
        block(animate);
    }
    return animate;
}

//获取旋转翻转动作
+(CABasicAnimation *)get3DMakeRotationAnimationWithrX:(CGFloat)X rY:(CGFloat)Y rZ:(CGFloat)Z angle:(CGFloat)angle duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block{
    if(X){
        CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
        animate.toValue = @(angle);
        animate.removedOnCompletion = NO;
        animate.fillMode = kCAFillModeForwards;
        animate.duration = duration;
        if(block){
            block(animate);
        }
        return animate;
    }else if(Y){
        CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
        animate.toValue = @(angle);
        animate.removedOnCompletion = NO;
        animate.fillMode = kCAFillModeForwards;
        animate.duration = duration;
        if(block){
            block(animate);
        }
        return animate;
    }else{
        CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        animate.toValue = @(angle);
        animate.removedOnCompletion = NO;
        animate.fillMode = kCAFillModeForwards;
        animate.duration = duration;
        if(block){
            block(animate);
        }
        return animate;
    }
}

//获取淡化动作
+(CABasicAnimation *)getOpacityAnimationWithOpacity:(CGFloat)opacity duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block{
    CABasicAnimation *animate = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animate.toValue = @(opacity);
    animate.removedOnCompletion = NO;
    animate.fillMode = kCAFillModeForwards;
    animate.duration = duration;
    if(block){
        block(animate);
    }
    return animate;
}

//获取3D缩放变换
+(CABasicAnimation *)getCATransform3DScaleAnimationWithXRatio:(CGFloat)xRatio YRatio:(float)yRatio duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block{
    CABasicAnimation *scaleAnima = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnima.fromValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, 1, 1, 0.0)];
    scaleAnima.toValue = [NSValue valueWithCATransform3D:CATransform3DScale(CATransform3DIdentity, xRatio, yRatio, 0.0)];
    scaleAnima.duration = duration;
    if(block){
        block(scaleAnima);
    }
    return scaleAnima;
}

//获取关键帧动画
+(CAKeyframeAnimation*)getCAKeyframeAnimationWithKeyPaths:(NSArray*)keyPaths keyTimes:(NSArray*)keyTimes calculationMode:(NSString*)calculationMode duration:(double)duration addition:(void(^)(CAKeyframeAnimation *keyAnimate))block{
    CAKeyframeAnimation *keyAnimate = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSMutableArray *values = [[NSMutableArray alloc]init];
    
    for (int i=0; i<keyPaths.count; i++) {
        [values addObject:keyPaths[i]];
    }
    keyAnimate.values = values;
    keyAnimate.keyTimes = keyTimes;
    
    keyAnimate.calculationMode = calculationMode;
    keyAnimate.removedOnCompletion = NO;
    keyAnimate.fillMode = kCAFillModeForwards;
    keyAnimate.duration = duration;
    
    if(block){
        block(keyAnimate);
    }
    return keyAnimate;
}



@end
