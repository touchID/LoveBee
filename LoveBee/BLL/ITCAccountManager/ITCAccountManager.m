//
//  ITCAccountManager.m
//  SDK040801登录注册
//
//  Created by admin.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCAccountManager.h"
#import "ITCGetRegCodeWebService.h"
#import "ITCRegisterWebService.h"
#import <SMS_SDK/SMSSDK.h>

@implementation ITCAccountManager


+ (ITCAccountManager *)sharedInstance
{
    static ITCAccountManager *__instance__;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        __instance__ = [[self alloc] init];
    });
    
    return __instance__;
}
/**
 退出登录
 */
- (void)logout{
    
}

- (void)getRegCodeWithMobile:(NSString *)mobile succBlock:(void(^)())succBlock failBlock:(void(^)(NSError *error))failBlock {
    
    
    ITCGetRegCodeWebService *service = [ITCGetRegCodeWebService new];
    service.mobile = mobile;
    
    [service execRequestWithSuccBlock:^(id responseData) {
        NSInteger platform = [responseData[@"platform"] integerValue];
        
        if(platform == 1) {
            // 具体data数据进行解析
            if(succBlock) succBlock();
        } else if(platform == 2) {
            // 借助于第三方SDK发送短信
            // 短信发送每个手机号每天不能超过7-8次
            [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS
                                    phoneNumber:mobile
                                           zone:@"86"
                               customIdentifier:nil
                                         result:^(NSError *error){
                                             if (!error) {
                                                 if(succBlock) succBlock();
                                             } else {
                                                 if(failBlock) failBlock(error);
                                             }
                                         }
             ];
            
        } else {
            if(failBlock) failBlock([NSError errorWithDomain:@"" code:0 userInfo:nil]);
        }
        
        
        NSLog(@"responseData:%@",responseData);
        
        
    } failBlock:failBlock];

}
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
                 failBlock:(void(^)(NSError *error))failBlock {
    
    // 套路
    ITCRegisterWebService *service = [ITCRegisterWebService new];
    service.code = code;
    service.mobile = mobile;
    service.password = password;
    [service execRequestWithSuccBlock:^(id responseData) {
//        NSLog(@"responseData:%@",responseData);
        
        //保存用户名和密码
        self.mobile = mobile;
        self.password = password;
        if(succBlock) succBlock();
    } failBlock:failBlock];
}
-(void)loginWithType:(ITCAccountType)type
           succBlock:(void(^)())succBlock
           failBlock:(void(^)(NSError *error))failBlock{
    
    
    
    
}
- (void)loginWithMobile:(NSString *)mobile
               password:(NSString *)password
              succBlock:(void(^)())succBlock
              failBlock:(void(^)(NSError *error))failBlock{
    
}


@end
