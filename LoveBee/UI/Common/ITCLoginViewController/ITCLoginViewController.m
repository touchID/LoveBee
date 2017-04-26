//
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.


#import "ITCLoginViewController.h"
#import "ITCAccountManager.h"
#import "AppDelegate.h"

@interface ITCLoginViewController ()
{}
@property (nonatomic,weak) IBOutlet UITextField *mobileTextField;

@property (nonatomic,weak) IBOutlet UITextField *passwordTextField;

@end

@implementation ITCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.mobileTextField.text = [ITCAccountManager sharedInstance].mobile;
    self.passwordTextField.text = [ITCAccountManager sharedInstance].password;
    
}

- (IBAction)actionLogin:(UIButton *)sender {
    
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [_AppDelegate enterMain];
    }
    
}


@end
