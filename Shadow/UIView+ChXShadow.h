//
//  UIView+ChXShadow.h
//  MobileProjectDemo
//
//  Created by Xu Chen on 2018/6/22.
//  Copyright © 2018年 xuchen. All rights reserved.
//  View 上高效率添加阴影

#import <UIKit/UIKit.h>

@interface UIView (ChXShadow)

/**
 View周边添加阴影
 注意：
     view的frame 一定是添加约束后真实的frame，否则会发生偏移。
     需要在controller中的viewDidLayoutSubviews方法 和 cell的layoutSubviews方法里使用
 
 @param view 要添加阴影的view
 @param shadowOpacity 阴影透明度
 @param shadowOffset 阴影偏移
 @param shadowRadius 阴影半径
 */
+ (void)addShadowToView:(UIView *)view
            withOpacity:(float)shadowOpacity
           shadowOffset:(CGSize)shadowOffset
           shadowRadius:(CGFloat)shadowRadius;

/**
 添加默认参数的View阴影
 
 @param view 要添加阴影的view
 */
+ (void)addDefaultShadowToView:(UIView *)view;


@end
