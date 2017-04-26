//
//  ITCWebService.m
//  SDK040801登录注册
//
//  Created by admin.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCWebService.h"
#import <AFNetworking/AFNetworking.h>
#import <OpenUDID/OpenUDID.h>
#import "NSString+MD5.h"

#define SRV_DOMAIN      @"http://127.0.0.1/srv/"

#define APP_KEY         @"djo1218@7dsh@HD12@)830@*0"

#define PLATFORM        @"i"
#define UDID            ([OpenUDID value])
#define SOFTVERSION     ([NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"])
#define SYSTEMVERSION   ([UIDevice currentDevice].systemVersion)
static NSTimeInterval   SERVER_TIME = -1;
static NSTimeInterval SYSTEM_UP_TIME = -1;

@implementation ITCWebService

#pragma mark - 私有方法 -
// 需要子类具体提供验证规则
- (NSString *)authContent {
    return @"";
}

// 需要子类具体提供参数列表
- (NSDictionary *)params {
    return @{};
}
// 生成auth验证串
- (NSString *)auth {
    NSString *authContent = [self authContent];
    
    /*
     // 动态获取执行子类的方法
     if([self respondsToSelector:NSSelectorFromString(@"authContent")]) {
     authContent = [self performSelector:NSSelectorFromString(@"authContent")];
     }*/
    
    NSString *authString = [[NSString stringWithFormat:@"%@%@%@%@%@%@",APP_KEY,authContent,PLATFORM,UDID,SOFTVERSION,SYSTEMVERSION] md5];
    
    // 创建时间格式化
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateFormat = @"yyyyMMddHHmm";
    
    // 当前时间 注意当前时间不能用本地时间
    
    // 计算了当前本机经过了时间值
    NSTimeInterval offset = [NSProcessInfo new].systemUptime - SYSTEM_UP_TIME;
    
    NSDate *currentDate = [NSDate dateWithTimeIntervalSince1970:SERVER_TIME + offset];
    NSString *timeString = [fmt stringFromDate:currentDate];
    
    return [[NSString stringWithFormat:@"%@%@",authString,timeString] md5];
}
//生成请求的公共参数
- (NSDictionary *)commonParams {
    return @{
             @"m":@"srv",
             @"platform":PLATFORM,
             @"udid":UDID,
             @"softver":SOFTVERSION,
             @"sysver":SYSTEMVERSION,
             @"auth":[self auth]
             };
}
#pragma mark - 公共方法 -

- (void)toGetServerTimeWithSuccBlock:(void(^)())succBlock
                           failBlock:(void(^)(NSError *error))failBlock {
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    [mgr GET:[NSString stringWithFormat:@"%@%@",SRV_DOMAIN,@"time.php"]
  parameters:nil
    progress:nil
     success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
         //  记录服务器时间
         SERVER_TIME = [responseObject[@"time"] doubleValue];
         
         // 记录本地时间作为服务器的参考时间是不科学
         //         CURRENT_LOCAL_TIME = [[NSDate date] timeIntervalSince1970];
         // 可以采取获取当前手机的开机到秒数
         SYSTEM_UP_TIME = [NSProcessInfo new].systemUptime;
         
         
         
         if(succBlock) {
             succBlock();
         }
         
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
         if(failBlock) failBlock(error);
     }];
    
}

- (void)execLogicRequestWithSuccBlock:(void(^)(id responseData))succBlock
                            failBlock:(void(^)(NSError *error))failBlock {
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    mgr.requestSerializer = [AFHTTPRequestSerializer serializer];
    mgr.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // 准备参数
    // 获取公共参数
    NSDictionary *commonParams = [self commonParams];
    // 获取具体服务参数
    NSDictionary *params = [self params];
    
    // 把具体参数和公共参数进行合并
    NSMutableDictionary *mergedParams = [NSMutableDictionary dictionary];
    [mergedParams addEntriesFromDictionary:commonParams];
    [mergedParams addEntriesFromDictionary:params];
    
    // 发起具体网络请求
    [mgr POST:SRV_DOMAIN
   parameters:mergedParams
     progress:nil
      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
          NSInteger status = [responseObject[@"meta"][@"status"] integerValue];
          if(status == 1) {
              if(succBlock) succBlock(responseObject[@"data"]);
          } else {
              if(failBlock) failBlock([NSError errorWithDomain:@"" code:1 userInfo:@{@"msg":responseObject[@"meta"][@"message"]}]);
          }
          
      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
          if(failBlock) failBlock(error);
      }];
}

/**
 发起网络请求
 
 @param succBlock 成功回调
 @param failBlock 失败回调
 */
- (void)execRequestWithSuccBlock:(void(^)(id responseData))succBlock
                       failBlock:(void(^)(NSError *error))failBlock {
    
    // 具体发起请求之前获取服务器时间,后面的验证规则全部走服务器时间
    
    // 先服务器时间再发起请求
    if(SERVER_TIME == -1) {
        [self toGetServerTimeWithSuccBlock:^{
            [self execLogicRequestWithSuccBlock:succBlock failBlock:failBlock];
        } failBlock:failBlock];
    } else {
        [self execLogicRequestWithSuccBlock:succBlock failBlock:failBlock];
    }
    
    
    
    
    
    
    
}


@end
