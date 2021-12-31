//
//  TiSDKResourceManager.m
//  TiSDKDemo
//
//  Created by iMacA1002 on 2019/12/10.
//  Copyright © 2020 Tillusory Tech. All rights reserved.
//

#import "TiSDKResourceManager.h"
#import "TiConfig.h"

@interface TiSDKResourceManager ()

@end

@implementation TiSDKResourceManager

static TiSDKResourceManager *shareManager = nil;
static dispatch_once_t token;

// MARK: --单例初始化方法--
+ (TiSDKResourceManager *)shareManager {
    dispatch_once(&token, ^{
        shareManager = [[TiSDKResourceManager alloc] init];
    });
    return shareManager;
}

+ (void)releaseShareManager{
    token = 0; // 只有置成0,GCD才会认为它从未执行过.它默认为0.这样才能保证下次再次调用shareInstance的时候,再次创建对象.
    //   [shareManager release];
    shareManager = nil;
}

- (instancetype)init{
    
    self = [super init];
    if (self) {
        NSString *stickerPath = [TICachesDirectory stringByAppendingPathComponent:@"sticker"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:stickerPath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:stickerPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
        
        NSString *giftPath = [TICachesDirectory stringByAppendingPathComponent:@"gift"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:giftPath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:giftPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
        
        NSString *watermarkPath = [TICachesDirectory stringByAppendingPathComponent:@"watermark"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:watermarkPath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:watermarkPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
        
        NSString *maskPath = [TICachesDirectory stringByAppendingPathComponent:@"mask"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:maskPath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:maskPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
        
        NSString *GreenscreenPath = [TICachesDirectory stringByAppendingPathComponent:@"greenscreen"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:GreenscreenPath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:GreenscreenPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
        
        NSString *portraitPath = [TICachesDirectory stringByAppendingPathComponent:@"portrait"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:portraitPath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:portraitPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
        
        NSString *gesturesPath = [TICachesDirectory stringByAppendingPathComponent:@"gestures"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:gesturesPath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:gesturesPath withIntermediateDirectories:NO attributes:nil error:nil];
        }
        
        // 拷贝本地贴纸文件到沙盒
        NSString *localPath1 =
        [[[NSBundle mainBundle] pathForResource:@"TiSDKResource" ofType:@"bundle"] stringByAppendingPathComponent:@"sticker"];
        NSArray *dirArr1 = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:localPath1 error:NULL];
        for (NSString *pathName in dirArr1) {
            if (![[NSFileManager defaultManager] fileExistsAtPath:[localPath1 stringByAppendingPathComponent:pathName]]) {
                [[NSFileManager defaultManager] copyItemAtPath:[localPath1 stringByAppendingPathComponent:pathName] toPath:[localPath1 stringByAppendingPathComponent:pathName] error:NULL];
            }
        }
        // 拷贝本地礼物文件到沙盒
        NSString *localPath2 =
        [[[NSBundle mainBundle] pathForResource:@"TiSDKResource" ofType:@"bundle"] stringByAppendingPathComponent:@"gift"];
        NSArray *dirArr2 = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:localPath2 error:NULL];
        for (NSString *pathName in dirArr2) {
            if (![[NSFileManager defaultManager] fileExistsAtPath:[localPath2 stringByAppendingPathComponent:pathName]]) {
                [[NSFileManager defaultManager] copyItemAtPath:[localPath2 stringByAppendingPathComponent:pathName] toPath:[localPath2 stringByAppendingPathComponent:pathName] error:NULL];
            }
        }
        // 拷贝本地水印文件到沙盒
        NSString *localPath3 =
        [[[NSBundle mainBundle] pathForResource:@"TiSDKResource" ofType:@"bundle"] stringByAppendingPathComponent:@"watermark"];
        NSArray *dirArr3 = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:localPath3 error:NULL];
        for (NSString *pathName in dirArr3) {
            if (![[NSFileManager defaultManager] fileExistsAtPath:[localPath3 stringByAppendingPathComponent:pathName]]) {
                [[NSFileManager defaultManager] copyItemAtPath:[localPath3 stringByAppendingPathComponent:pathName] toPath:[localPath3 stringByAppendingPathComponent:pathName] error:NULL];
            }
        }
        // 拷贝本地面具文件到沙盒
        NSString *localPath4 =
        [[[NSBundle mainBundle] pathForResource:@"TiSDKResource" ofType:@"bundle"] stringByAppendingPathComponent:@"mask"];
        NSArray *dirArr4 = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:localPath4 error:NULL];
        for (NSString *pathName in dirArr4) {
            if (![[NSFileManager defaultManager] fileExistsAtPath:[localPath4 stringByAppendingPathComponent:pathName]]) {
                [[NSFileManager defaultManager] copyItemAtPath:[localPath4 stringByAppendingPathComponent:pathName] toPath:[localPath4 stringByAppendingPathComponent:pathName] error:NULL];
            }
        }
        // 拷贝本地绿幕文件到沙盒
        NSString *localPath5 =
        [[[NSBundle mainBundle] pathForResource:@"TiSDKResource" ofType:@"bundle"] stringByAppendingPathComponent:@"greenscreen"];
        NSArray *dirArr5 = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:localPath5 error:NULL];
        for (NSString *pathName in dirArr5) {
            if (![[NSFileManager defaultManager] fileExistsAtPath:[localPath5 stringByAppendingPathComponent:pathName]]) {
                [[NSFileManager defaultManager] copyItemAtPath:[localPath5 stringByAppendingPathComponent:pathName] toPath:[localPath5 stringByAppendingPathComponent:pathName] error:NULL];
            }
        }
        // 拷贝本地互动贴纸文件到沙盒
        NSString *localPath6 =
        [[[NSBundle mainBundle] pathForResource:@"TiSDKResource" ofType:@"bundle"] stringByAppendingPathComponent:@"interaction"];
        NSArray *dirArr6 = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:localPath6 error:NULL];
        for (NSString *pathName in dirArr6) {
            if (![[NSFileManager defaultManager] fileExistsAtPath:[localPath6 stringByAppendingPathComponent:pathName]]) {
                [[NSFileManager defaultManager] copyItemAtPath:[localPath6 stringByAppendingPathComponent:pathName] toPath:[localPath6 stringByAppendingPathComponent:pathName] error:NULL];
            }
        }
        // 拷贝本地抠图文件到沙盒
        NSString *localPath7 =
        [[[NSBundle mainBundle] pathForResource:@"TiSDKResource" ofType:@"bundle"] stringByAppendingPathComponent:@"portrait"];
        NSArray *dirArr7 = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:localPath7 error:NULL];
        for (NSString *pathName in dirArr7) {
            if (![[NSFileManager defaultManager] fileExistsAtPath:[localPath7 stringByAppendingPathComponent:pathName]]) {
                [[NSFileManager defaultManager] copyItemAtPath:[localPath7 stringByAppendingPathComponent:pathName] toPath:[localPath7 stringByAppendingPathComponent:pathName] error:NULL];
            }
        }
        // 拷贝本地手势文件到沙盒
        NSString *localPath8 =
        [[[NSBundle mainBundle] pathForResource:@"TiSDKResource" ofType:@"bundle"] stringByAppendingPathComponent:@"gesture"];
        NSArray *dirArr8 = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:localPath8 error:NULL];
        for (NSString *pathName in dirArr8) {
            if (![[NSFileManager defaultManager] fileExistsAtPath:[localPath8 stringByAppendingPathComponent:pathName]]) {
                [[NSFileManager defaultManager] copyItemAtPath:[localPath8 stringByAppendingPathComponent:pathName] toPath:[localPath8 stringByAppendingPathComponent:pathName] error:NULL];
            }
        }
        
    }
    return self;
}

@end
