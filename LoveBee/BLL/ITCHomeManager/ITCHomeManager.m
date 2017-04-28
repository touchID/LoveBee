//
//  ITCHomeManager.m
//  LoveBee
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import "ITCHomeManager.h"

@implementation ITCHomeManager

SM(ITCHomeManager)

- (void)getTypeWithSuccBlock:(void(^)())succBlock failBlock:(void(^)(NSError *error))failBlock{
    ITCHomeHeaderTypeServices *homeHeaderTypeServices = [[ITCHomeHeaderTypeServices alloc] init];
    [homeHeaderTypeServices execRequestWithSuccBlock:^(id responseData) {
        NSLog(@"responseData = %@", responseData);
//        responseData[@""];
//        for (<#type *object#> in <#collection#>) {
//            <#statements#>
//        }
        
        if (succBlock) {
            succBlock();
        }
    } failBlock:failBlock];
    
}

@end
