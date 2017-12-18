# EasyAnimation
用一行代码写出你想要的动画效果
/************************/ 

本封装库抽取了设置动画时常用的属性参数，可以用一句代码快速设置一个或者一组动画效果。如果想要进行更多设置，可以在block里面添加对应的属性，例如重复次数等。

#import "UIView+Animation.h"

将你要使用动画的view执行对应的方法即可。（所有的方法默认执行动画后不返回，如果要返回则在block中设置即可）

//平移到某一点，其中tx和ty表示view的中心点将要移动到的位置

-(void)setPositionAnimationWithtX:(CGFloat)tX andtY:(CGFloat)tY duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block;

//缩放，长宽放大缩小n倍

-(void)setTransformMakeScaleAnimationWithWidthRatio:(CGFloat)W heightRatio:(CGFloat)H duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block;

//绕轴旋转某个角度，选择绕某一轴将其置为1，其余为0，并设置旋转角度（0～2M_PI）

-(void)setTransform3DMakeRotationAnimationWithAngle:(CGFloat)angle isX:(CGFloat)X isY:(CGFloat)Y isZ:(CGFloat)Z duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block;

//透明度变化，设置值为0.0～1.0

-(void)setOpacityAnimationWithOpacity:(float)opacity duration:(double)duration additions:(void(^)(CABasicAnimation *animate))block;

//设置关键帧动画，需要定义一个CGPoint的数组来规划你要走的路线，keytiems可以设置每段位移的位移时间间隔长短比例。
/*calculationMode参数说明
 
 kCAAnimationLinear calculationMode的默认值,表示当关键帧为座标点的时候,关键帧之间直接直线相连进行插值计算;
 
 kCAAnimationDiscrete 离散的,就是不进行插值计算,所有关键帧直接逐个进行显示;
 
 kCAAnimationPaced 使得动画均匀进行,而不是按keyTimes设置的或者按关键帧平分时间,此时keyTimes和timingFunctions无效;
 
 kCAAnimationCubic 对关键帧为座标点的关键帧进行圆滑曲线相连后插值计算,对于曲线的形状还可以通过tensionValues,continuityValues,biasValues来进行调整自定义,这里的数学原理是Kochanek–Bartels spline,这里的主要目的是使得运行的轨迹变得圆滑;
 
 kCAAnimationCubicPaced 看这个名字就知道和kCAAnimationCubic有一定联系,其实就是在kCAAnimationCubic的基础上使得动画运行变得均匀,就是系统时间内运动的距离相同,此时keyTimes以及timingFunctions也是无效的.
 */

-(void)setKeyAnimationWithKeyPath:(NSArray*)keyPaths keyTimes:(NSArray *)keyTimes duration:(double)duration calculationMode:(NSString*)calculationMode additions:(void(^)(CAKeyframeAnimation *keyAnimate))block;

//设置动画组，需要传入你要组合的动画并设置其属性，详细见一下获取动画实例的方法。

-(void)setSerialAnimateWithAnimateGroup:(NSArray<CAAnimation*> *)aniArr duration:(double)duration additions:(void(^)(CAAnimationGroup *animaGroup))block;

//设置重复动画，需要传入你要组合的动画并设置其属性，设置每次重复出现的时间间隔和重复次数。

-(void)setRepeatAnimationWithAnimations:(NSArray<CAAnimation*>*)animations instanceCount:(int)instanceCount instanceDelay:(float)instanceDelay repeatCount:(int)repeatCount;

/////获取动画实例的方法
//位移

+(CABasicAnimation *)getPositionAnimationWithtX:(CGFloat)X tY:(CGFloat)Y duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block;

//缩放

+(CABasicAnimation *)getScaleAnimationWithsX:(CGFloat)X sY:(CGFloat)Y duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block;

//旋转

+(CABasicAnimation *)get3DMakeRotationAnimationWithrX:(CGFloat)X rY:(CGFloat)Y rZ:(CGFloat)Z angle:(CGFloat)angle duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block;

//透明度

+(CABasicAnimation *)getOpacityAnimationWithOpacity:(CGFloat)opacity duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block;

//3D缩放

+(CABasicAnimation *)getCATransform3DScaleAnimationWithXRatio:(CGFloat)xRatio YRatio:(float)yRatio duration:(double)duration addition:(void(^)(CABasicAnimation *animate))block;

//关键帧动画

+(CAKeyframeAnimation*)getCAKeyframeAnimationWithKeyPaths:(NSArray*)keyPaths keyTimes:(NSArray*)keyTimes calculationMode:(NSString*)calculationMode duration:(double)duration addition:(void(^)(CAKeyframeAnimation *keyAnimate))block;

![image](https://github.com/PeipeiQ/EasyAnimation/blob/master/luzhi.gif)  
