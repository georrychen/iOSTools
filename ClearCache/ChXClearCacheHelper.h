//
//  ChXClearCacheHelper.h
//  MobileProjectDemo
//
//  Created by Xu Chen on 2018/6/22.
//  Copyright © 2018年 xuchen. All rights reserved.
//  清理软件缓存工具类（整理自 268demo ）

#import <Foundation/Foundation.h>

@interface ChXClearCacheHelper : NSObject
/**
 获取缓存大小
*/
+ (NSString *)getAppCachesSize;

/**
 清理缓存
 */
+ (void)clearAppCaches;

@end
