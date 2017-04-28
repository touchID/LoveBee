//
//  ITCHomeWebServices.h
//  LoveBee
//
//  Created by admin on 2017/4/26.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ITCHomeWebServices : NSObject

// 返回具体参数
- (NSDictionary *)params;

/**
 发起网络请求
 
 @param succBlock 成功回调
 @param failBlock 失败回调
 */
- (void)execRequestWithSuccBlock:(void(^)(id responseData))succBlock
                       failBlock:(void(^)(NSError *error))failBlock;

@end
