//
//  UIView+ChXShadow.m
//  MobileProjectDemo
//
//  Created by Xu Chen on 2018/6/22.
//  Copyright © 2018年 xuchen. All rights reserved.
//

#import "UIView+ChXShadow.h"

@implementation UIView (ChXShadow)

// 周边加阴影
+ (void)addShadowToView:(UIView *)view
            withOpacity:(float)shadowOpacity
           shadowOffset:(CGSize)shadowOffset
           shadowRadius:(CGFloat)shadowRadius {
    // 阴影颜色
    view.layer.shadowColor = [UIColor blackColor].CGColor;
    // 阴影偏移，默认(0, -3),这个跟shadowRadius配合使用
    view.layer.shadowOffset = shadowOffset;
    // 阴影透明度，默认0
    view.layer.shadowOpacity = shadowOpacity;
    // 阴影半径，默认3
    view.layer.shadowRadius = shadowRadius;
    
    // 路径阴影
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    float width = view.bounds.size.width;
    float height = view.bounds.size.height;
    float x = view.bounds.origin.x;
    float y = view.bounds.origin.y;
    
    CGPoint topLeft      = view.bounds.origin;
    CGPoint topRight     = CGPointMake(x + width, y);
    CGPoint bottomRight  = CGPointMake(x + width, y + height);
    CGPoint bottomLeft   = CGPointMake(x, y + height);
    
    CGFloat offset = 0.f;
    [path moveToPoint:CGPointMake(topLeft.x - offset, topLeft.y - offset)];
    [path addLineToPoint:CGPointMake(topRight.x + offset, topRight.y - offset)];
    [path addLineToPoint:CGPointMake(bottomRight.x + offset, bottomRight.y + offset)];
    [path addLineToPoint:CGPointMake(bottomLeft.x - offset, bottomLeft.y + offset)];
    [path addLineToPoint:CGPointMake(topLeft.x - offset, topLeft.y - offset)];
    
    // 设置阴影路径,只要你提前告诉CoreAnimation你要渲染的View的形状Shape,就会减少离屏渲染计算
    view.layer.shadowPath = path.CGPath;
}

// 默认参数设置的阴影
+ (void)addDefaultShadowToView:(UIView *)view {
    [self addShadowToView:view withOpacity:0.1 shadowOffset:CGSizeMake(0, 4) shadowRadius:3];
}

@end
