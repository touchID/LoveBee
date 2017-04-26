//
//  ITCRegisterWebService.m
//  SDK040801登录注册
//
//  Created by admin.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCRegisterWebService.h"
#import "NSString+MD5.h"

@implementation ITCRegisterWebService

// 制作验证字符串API
- (NSString *)authContent {
    return self.mobile;
}

// 返回具体参数
- (NSDictionary *)params {
    return @{
             @"a":@"register",
             @"code":self.code,
             @"mobile":self.mobile,
             @"password":[[NSString stringWithFormat:@"e%@12def",[self.password md5]] md5]
             };
}
@end
