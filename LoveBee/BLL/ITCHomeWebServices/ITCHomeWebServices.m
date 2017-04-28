//
//  ITCHomeWebServices.m
//  LoveBee
//
//  Created by admin on 2017/4/26.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCHomeWebServices.h"
#import "ITCNetworkTool.h"

@implementation ITCHomeWebServices

//生成请求的公共参数
- (NSDictionary *)commonParams {
    return @{
             @"call":@1
             };
}
-(NSDictionary *)params{
    return @{};
}

- (void)execRequestWithSuccBlock:(void(^)(id responseData))succBlock
                       failBlock:(void(^)(NSError *error))failBlock{
    
    ITCNetworkTool *networkTool = [[ITCNetworkTool alloc] init];
    
    // 准备参数
    // 获取公共参数
    NSDictionary *commonParams = [self commonParams];
    // 获取具体服务参数
    NSDictionary *params = [self params];
    
    NSMutableDictionary *mergedParams = [NSMutableDictionary dictionary];
    [mergedParams addEntriesFromDictionary:commonParams];
    [mergedParams addEntriesFromDictionary:params];
 
    networkTool.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain",nil];
//    networkTool.requestSerializer = [AFHTTPRequestSerializer serializer];
//    networkTool.responseSerializer = [AFJSONResponseSerializer serializer];
//    NSLog(@"mergedParams = %@", mergedParams);
    [networkTool POST:@"http://iosapi.itcast.cn/loveBee/focus.json.php" parameters:mergedParams progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (succBlock) succBlock(responseObject);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if(failBlock) failBlock(error);
    }];
    
}


@end
