//
//  UIView+GetAnimation.h
//  Animation
//
//  Created by 沛沛 on 2017/12/17.
//  Copyright © 2017年 沛沛. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GetAnimation)
+(CABasicAnimation *)getPositionAnimationWithtX:(CGFloat)X tY:(CGFloat)Y duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block;
+(CABasicAnimation *)getScaleAnimationWithsX:(CGFloat)X sY:(CGFloat)Y duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block;
+(CABasicAnimation *)get3DMakeRotationAnimationWithrX:(CGFloat)X rY:(CGFloat)Y rZ:(CGFloat)Z angle:(CGFloat)angle duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block;
+(CABasicAnimation *)getOpacityAnimationWithOpacity:(CGFloat)opacity duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block;
+(CABasicAnimation *)getCATransform3DScaleAnimationWithXRatio:(CGFloat)xRatio YRatio:(float)yRatio duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block;
+(CAKeyframeAnimation*)getCAKeyframeAnimationWithKeyPaths:(NSArray*)keyPaths keyTimes:(NSArray*)keyTimes calculationMode:(NSString*)calculationMode duration:(double)duration addition:(void(^)(CAKeyframeAnimation *keyAnimate))block;
@end
