//
//  WebHost.m
//  ipaBuildExample
//
//  Created by czm on 16/3/14.
//  Copyright © 2016年 czm. All rights reserved.
//

#import "WebHost.h"

@interface WebHost ()
@property (nonatomic, strong) NSString *webHost;
@end

@implementation WebHost

+ (instancetype)sharedInstance
{
    static WebHost *_sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[WebHost alloc] init];
    });
    
    return _sharedInstance;
}

- (instancetype)init
{
    
    self = [super init];
    if (self)
    {
        NSDictionary *plistDic = [[NSBundle mainBundle] infoDictionary];
        /*
         1、使用xcode打包：手动修改该文件的serverTag
         2、使用ipa_build.sh打包：serverTagDic中key和ipa_build_config.sh中配置的一致
         */
        NSString *serverTag = [plistDic objectForKey:@"ServerTag"];
        if (!serverTag)
        {
            serverTag = @"百度环境";
//            serverTag = @"新浪环境";
//            serverTag = @"京东环境";
        }
        
        NSDictionary *serverTagDic = @{
                                       @"百度环境":@"https://www.baidu.com",
                                       @"新浪环境":@"http://www.sina.com.cn/",
                                       @"京东环境":@"https://www.jd.com",};
        _webHost = serverTagDic[serverTag];
    }
    
    return self;
}

- (NSString *)webHost
{
    return _webHost;
}

@end
