//
//  ITCHomeHeaderTypeServices.h
//  LoveBee
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

#define _HomeHeaderTypeServices   ([ITCHomeHeaderTypeServices sharedInstance])


@interface ITCHomeHeaderTypeServices : NSObject

@property (nonatomic,copy) NSString *imgUrl;//

@property (nonatomic,copy) NSString *typeName;//

//返回具体参数
- (NSDictionary *)params;

- (void)execRequestWithSuccBlock:(void(^)(id responseData))succBlock
                       failBlock:(void(^)(NSError *error))failBlock;


@end
