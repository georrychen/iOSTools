//
//  ChXClearCacheHelper.m
//  MobileProjectDemo
//
//  Created by Xu Chen on 2018/6/22.
//  Copyright © 2018年 xuchen. All rights reserved.
//

#import "ChXClearCacheHelper.h"
#import <SDImageCache.h>

@implementation ChXClearCacheHelper

// 获取所有缓存
+ (NSString *)getAppCachesSize {
    NSString *rootDirectory = NSHomeDirectory();
    BLLog(@"应用根目录 \n %@",rootDirectory);
    
    /*
     // Documents 目录进行数据持久化的保存，这种写法是一种获取应用根目录下 Document 目录的方法
    
     //NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
     
     NSArray *documentpaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
     NSString *documentsDirectory = [documentpaths objectAtIndex:0];
     */
   
    // Library 目录存放缓存
    NSString *libraryDirectory = [rootDirectory stringByAppendingPathComponent:@"Library"];
   
    // tmp 目录存放一些自定义文件
    NSString *tmpDirectory = [rootDirectory stringByAppendingPathComponent:@"tmp"];
    // Caches 目录存放应用缓存
    NSString *cachesDirectory  = [libraryDirectory stringByAppendingPathComponent:@"Caches"];
    // Cookies 目录存放Cookie文件
    NSString *cookiesDirectory = [libraryDirectory stringByAppendingPathComponent:@"Cookies"];

    float cachesSize = [self getCacheSizeWithFilePath:tmpDirectory] + [self getCacheSizeWithFilePath:cachesDirectory] + [self getCacheSizeWithFilePath:cookiesDirectory];

    return [NSString stringWithFormat:@"%.1fM",cachesSize];
}

// 获取path目录文件夹的大小
+ (CGFloat)getCacheSizeWithFilePath:(NSString *)path {
    NSFileManager *fileManager=[NSFileManager defaultManager];
    float folderSize = 0.0;
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            folderSize += [self fileSizeWithPath:absolutePath];
        }
        
        // SDWebImage框架自身计算缓存的实现
       folderSize += [[SDImageCache sharedImageCache] getSize]/1024.0/1024.0;
       return folderSize;
    }
    return 0;
}

// 计算单个文件大小
+ (float)fileSizeWithPath:(NSString *)path {
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]) {
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}

// 清除所有缓存
+ (void)clearAppCaches {
    NSString *rootDirectory = NSHomeDirectory();
    NSString *libraryDirectory = [rootDirectory stringByAppendingPathComponent:@"Library"];
    
    NSString *tmpDirectory = [rootDirectory stringByAppendingPathComponent:@"tmp"];
    NSString *cachesDirectory  = [libraryDirectory stringByAppendingPathComponent:@"Caches/com.yizhiluNewDemo"];
    NSString *defaultDirectory = [libraryDirectory stringByAppendingPathComponent:@"Caches/default"];
    NSString *cookiesDirectory = [libraryDirectory stringByAppendingPathComponent:@"Cookies"];
    
    [self clearCacheWithFilePath:tmpDirectory];
    [self clearCacheWithFilePath:cachesDirectory];
    [self clearCacheWithFilePath:defaultDirectory];
    [self clearCacheWithFilePath:cookiesDirectory];
    
    // 清理所有 SDWebImage 缓存的图片
    [[SDImageCache sharedImageCache] clearMemory];
}

// 清除path文件夹下缓存大小
+ (void)clearCacheWithFilePath:(NSString *)path {
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            // 如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
    
    // 清空 YYCache 缓存
    YYCache *cacher = [[YYCache alloc] initWithPath:path];
    [cacher removeAllObjects];
}


@end
