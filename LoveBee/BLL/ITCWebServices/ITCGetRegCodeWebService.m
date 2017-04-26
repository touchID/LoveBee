//
//  ITCGetRegCodeWebService.m
//  SDK040801登录注册
//
//  Created by admin.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCGetRegCodeWebService.h"

@implementation ITCGetRegCodeWebService

// 制作验证字符串API
- (NSString *)authContent {
    return self.mobile;
}

// 返回具体参数
- (NSDictionary *)params {
    return @{
             @"a":@"get_reg_idcode",
             @"mobile":self.mobile
             };
}

@end
