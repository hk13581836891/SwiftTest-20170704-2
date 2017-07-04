//
//  testobject.m
//  sdftextdebug
//
//  Created by houke on 2017/3/14.
//  Copyright © 2017年 TT. All rights reserved.
//

#import "testobject.h"

@implementation testobject

static id instance = nil;
+(void)load
{
    NSLog(@"sfdsdf");
    [self shareInstance];
}
+(instancetype)shareInstance
{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        instance = [[self alloc] init];
        
    });
    return instance;
}

-(instancetype)init{
    self = [super init];
    if (self) {
        NSLog(@"dfg");
    }
    return self;
}
//-(instancetype)init
//{
//    self = [super init];
//    
//    if (self) {
//        NSLog(@"init");
//    }
//    return self;
//    
//}
@end
