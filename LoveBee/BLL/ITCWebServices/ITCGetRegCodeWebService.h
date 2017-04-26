//
//  ITCGetRegCodeWebService.h
//  SDK040801登录注册
//
//  Created by admin.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCWebService.h"
/**
 获取注册验证码服务
 负责具体参数的组装
 */
@interface ITCGetRegCodeWebService : ITCWebService

// 手机号
@property (strong, nonatomic)   NSString    *mobile;

// 制作验证字符串API
- (NSString *)authContent;


// 返回具体参数
- (NSDictionary *)params;


@end
