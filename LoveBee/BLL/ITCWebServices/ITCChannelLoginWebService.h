//
//  ITCChannelLoginWebService.h
//  SDK040801登录注册
//
//  Created by admin.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCWebService.h"

typedef NS_ENUM(NSUInteger, ITCChannelLoginType) {
    ITCChannelLoginTypeNormal = 1,
    ITCChannelLoginTypeWeibo,
    ITCChannelLoginTypeWeChat
};
@interface ITCChannelLoginWebService : ITCWebService

@property (nonatomic,copy) NSString *openID;

@property (nonatomic,copy) NSString *accessToken;

@property (nonatomic,assign) ITCChannelLoginType type;

//制作验证字符串API
-(NSString *)authContent;

//返回具体参数
- (NSDictionary *)params;

@end
