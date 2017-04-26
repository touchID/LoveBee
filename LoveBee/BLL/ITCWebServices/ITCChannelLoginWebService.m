//
//  ITCChannelLoginWebService.m
//  SDK040801登录注册
//
//  Created by admin.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCChannelLoginWebService.h"

@implementation ITCChannelLoginWebService
//制作验证字符串API
-(NSString *)authContent{
    return [NSString stringWithFormat:@"%@%zd",self.openID,self.type];
}

//返回具体参数
- (NSDictionary *)params{
    return @{
             @"a":@"channel_login",
             @"openid":self.openID,
             @"access_token":self.accessToken,
             @"channel":@(self.type)
             };
}


@end
