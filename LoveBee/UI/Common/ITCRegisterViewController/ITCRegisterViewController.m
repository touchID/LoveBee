//
//  ITCRegisterViewController.m
//  SDK040801登录注册
//
//  Created by admin on 2017/4/8.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCRegisterViewController.h"
#import <SVProgressHUD.h>
#import "ITCAccountManager.h"

@interface ITCRegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *mobileTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *regCodeTextField;
@property (weak, nonatomic) IBOutlet UIButton *codeButton;

@end

@implementation ITCRegisterViewController{
    
    NSTimer         *_timer;
    NSInteger       _count;
}

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)dealloc{
    [self clearTimer];

}

- (void)clearTimer {
    if(_timer) {
        if([_timer isValid]) [_timer invalidate];
    }
    _timer = nil;
}

- (void)doTimer {
    _count --;
    
    if(_count > 0) {
        [self.codeButton setTitle:[NSString stringWithFormat:@"%zd后重新获取",_count] forState:UIControlStateNormal];
        [self.codeButton setEnabled:NO];
    } else {
        [self clearTimer];
        [self.codeButton setTitle:@"重新获取" forState:UIControlStateNormal];
        [self.codeButton setEnabled:YES];
    }
    
    
}

- (void)beginCodeTick {
    
    [self clearTimer];
    
    _count = 60;
    _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(doTimer) userInfo:nil repeats:YES];
}

#pragma mark - action方法 -
- (IBAction)actionGetRegCode:(UIButton *)sender {
    [SVProgressHUD showWithStatus:@"正在获取验证码"];
    __weak typeof (self) weakself = self;
    
    [[ITCAccountManager sharedInstance] getRegCodeWithMobile:self.mobileTextField.text
                                                   succBlock:^{
                                                       [SVProgressHUD showSuccessWithStatus:@"获取验证码成功"];
                                                       [weakself beginCodeTick];
                                                   } failBlock:^(NSError *error) {
                                                       [SVProgressHUD showErrorWithStatus:@"获取验证码失败"];
                                                   }];
    
}

- (IBAction)actionRegister:(UIButton *)sender {
    [SVProgressHUD showWithStatus:@"正在注册中"];
    __weak typeof (self) weakself = self;
    
    [[ITCAccountManager sharedInstance] registerWithMobile:self.mobileTextField.text
                                                 password:self.passwordTextField.text
                                                     code:self.regCodeTextField.text
                                                succBlock:^{
                                                    [SVProgressHUD showSuccessWithStatus:@"注册成功"];
                                                    [weakself.navigationController popViewControllerAnimated:YES];
                                                }
                                                failBlock:^(NSError *error) {
                                                    [SVProgressHUD showSuccessWithStatus:error.userInfo[@"msg"]];
                                                }];


    
    
}



@end
