//
//  UIView+Animation.h
//  Animation
//
//  Created by 沛沛 on 2017/12/16.
//  Copyright © 2017年 沛沛. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+GetAnimation.h"

@interface UIView (Animation)
//平移到某一点
-(void)setPositionAnimationWithtX:(CGFloat)tX andtY:(CGFloat)tY duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block;

//缩放，长宽放大缩小n倍。
-(void)setTransformMakeScaleAnimationWithWidthRatio:(CGFloat)W heightRatio:(CGFloat)H duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block;

//绕轴旋转某个角度，选择绕某一轴将其置为1，其余为0
-(void)setTransform3DMakeRotationAnimationWithAngle:(CGFloat)angle isX:(CGFloat)X isY:(CGFloat)Y isZ:(CGFloat)Z duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block;

//透明度变化。
-(void)setOpacityAnimationWithOpacity:(float)opacity duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block;

//设置关键帧动画
-(void)setKeyAnimationWithKeyPath:(NSArray*)keyPaths keyTimes:(NSArray *)keyTimes duration:(double)duration calculationMode:(NSString*)calculationMode additions:(void(^)(CAKeyframeAnimation *keyAnimate))block;

//设置动画组
-(void)setSerialAnimateWithAnimateGroup:(NSArray<CAAnimation*> *)aniArr duration:(double)duration additions:(void(^)(CAAnimationGroup *animaGroup))block;

//设置重复动画
-(void)setRepeatAnimationWithAnimations:(NSArray<CAAnimation*>*)animations instanceCount:(int)instanceCount instanceDelay:(float)instanceDelay repeatCount:(int)repeatCount;
@end
