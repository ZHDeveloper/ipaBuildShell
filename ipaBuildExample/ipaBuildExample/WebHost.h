//
//  WebHost.h
//  ipaBuildExample
//
//  Created by czm on 16/3/14.
//  Copyright © 2016年 czm. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WebHost : NSObject
@property (nonatomic, readonly) NSString *webHost;
+ (instancetype)sharedInstance;

@end
