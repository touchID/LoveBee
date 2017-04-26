//
//  ITCLoginWebService.h
//  SDK040801登录注册
//
//  Created by admin.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCWebService.h"

@interface ITCLoginWebService : ITCWebService

@property (strong, nonatomic)   NSString    *mobile;

@property (strong, nonatomic)   NSString    *password;

// 制作验证字符串API
- (NSString *)authContent;

// 返回具体参数
- (NSDictionary *)params;

@end
