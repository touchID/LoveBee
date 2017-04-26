//
//  ITCLoginWebService.m
//  SDK040801登录注册
//
//  Created by admin.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCLoginWebService.h"

@implementation ITCLoginWebService

// 制作验证字符串API
- (NSString *)authContent {
    return [NSString stringWithFormat:@"%@%@",self.mobile,self.password];
}

// 返回具体参数
- (NSDictionary *)params{
    return @{
             @"a":@"login",
             @"mobile":self.mobile,
             @"password":self.password
             };
}
@end
