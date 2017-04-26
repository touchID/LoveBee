//
//  ITCAccountManager.h
//  SDK040801登录注册
//
//  Created by admin.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ITCAccountType) {
    ITCAccountTypeNormal,
    ITCAccountTypeWeibo,
    ITCAccountTypeWechat
};

@interface ITCAccountManager : NSObject

+ (ITCAccountManager *)sharedInstance;

/**
 是否登录
 */
@property (nonatomic,assign) Boolean isLogin;

/**
 用户昵称
 */
@property (copy, nonatomic)     NSString    *nickName;

/**
 手机号
 */
@property (copy, nonatomic)     NSString    *mobile;

/**
 密码
 */
@property (nonatomic,copy)  NSString *password;

#pragma mark - 方法 -
/**
 获取验证码
 
 @param mobile 手机号
 @param succBlock 成功回调
 @param failBlock 失败回调
 */
- (void)getRegCodeWithMobile:(NSString *)mobile
                   succBlock:(void(^)())succBlock
                   failBlock:(void(^)(NSError *error))failBlock;

/**
 注册逻辑
 
 @param mobile 手机号
 @param password 密码
 @param code 验证码
 @param succBlock 成功后回调
 @param failBlock 失败后回调
 */
- (void)registerWithMobile:(NSString *)mobile
                  password:(NSString *)password
                      code:(NSString *)code
                 succBlock:(void(^)())succBlock
                 failBlock:(void(^)(NSError *error))failBlock;

/**
 登录逻辑
 
 @param mobile 手机号
 @param password 密码
 @param succBlock 成功后回调
 @param failBlock 失败后回调
 */
- (void)loginWithMobile:(NSString *)mobile
               password:(NSString *)password
              succBlock:(void(^)())succBlock
              failBlock:(void(^)(NSError *error))failBlock;



-(void)loginWithType:(ITCAccountType)type
               succBlock:(void(^)())succBlock
failBlock:(void(^)(NSError *error))failBlock;

/**
 退出登录
 */
- (void)logout;

@end
