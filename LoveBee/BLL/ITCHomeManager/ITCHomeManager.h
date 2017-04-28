//
//  ITCHomeManager.h
//  LoveBee
//
//  Created by admin on 2017/4/27.
//  Copyright © 2017年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ITCHomeHeaderTypeServices.h"

@interface ITCHomeManager : NSObject
/**
 定义单例模式类    SH(类名)
 实现单例模式类    SM(类名)
 */
#define SH(__name) \
- (__name *)sharedInstance; \
+ (__name *)sharedInstance;

#define SM(__name) \
- (__name *)sharedInstance; \
{ \
return [__name sharedInstance]; \
} \
+ (__name *)sharedInstance \
{ \
static id _instance; \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
} \

SH(ITCHomeManager)//单例

@property (nonatomic,strong) NSArray<ITCHomeHeaderTypeServices *> *typeArray;//


@end
