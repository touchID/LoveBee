//
//  ITCNetworkTool.h
//  LoveBee
//
//  Created by admin on 2017/4/26.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
@interface ITCNetworkTool : AFHTTPSessionManager
/**
 定义单例模式类    SH(类名)
 实现单例模式类    SM(类名)
 */
#define SH(__name) \
- (__name *)sharedInstance; \
+ (__name *)sharedInstance;

#define SM(__name) \
- (__name *)sharedInstance; \
{ \
return [__name sharedInstance]; \
} \
+ (__name *)sharedInstance \
{ \
static id _instance; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \

SH(ITCNetworkTool)

//- (void)GETWithUrlString:(NSString *)urlString parameters:(id)parameters success:(void(^)(id responseObject))successBlock failure:(void(^)(NSError *error))failureBlock;


@end
