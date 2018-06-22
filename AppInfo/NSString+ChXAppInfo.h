//
//  NSString+ChXAppInfo.h
//  MobileProjectDemo
//
//  Created by Xu Chen on 2018/6/22.
//  Copyright © 2018年 xuchen. All rights reserved.
//  获取APP的基本信息

#import <Foundation/Foundation.h>

@interface NSString (ChXAppInfo)

/**
 获取手机系统版本号
 例： 1.0
 
 @return 版本号
 */
+ (NSString *)appVersion;

/**
 获取手机型号
 例：iPhone X

 @return 手机型号
 */
+ (NSString*)iPhoneModel;

/**
 获取 IPV6地址

 @return IP 地址
 */
+ (NSString *)iPAddress_Ipv6;

/**
 获取 IP 地址

 @param preferIPv4 是否为 IPv4 网路
 @return IP 地址
 */
+ (NSString *)iPAddress:(BOOL)preferIPv4;

/**
 获取手机硬盘空闲空间
 例：
     NSString *allSpaceStr = [NSString stringWithFormat:@"%.2f", [NSString allDiskSpace]];
     NSString *freeString = [NSString stringWithFormat:@"总空间%@G/ 剩余%@G",allSpaceStr,freeSpaceStr];
     NSLog(@"%@",freeString);

 @return 硬盘空闲空间大小
 */
+ (double)freeDiskSpace;

/**
 获取手机硬盘总空间

 @return 硬盘总空间大小
 */
+ (double)allDiskSpace;



@end
