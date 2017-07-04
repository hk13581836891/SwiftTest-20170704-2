//
//  singleTon.m
//  sdftextdebug
//
//  Created by houke on 2017/3/20.
//  Copyright © 2017年 TT. All rights reserved.
//

#import "singleTon.h"

@implementation singleTon

static singleTon * instance = nil;

+(void)load
{
    [self getInstance];
}
+(singleTon*)getInstance{
    
    static dispatch_once_t onceTake;
    NSLog(@"222222222222");
    dispatch_once(&onceTake, ^{
        instance = [[singleTon alloc] init];
        NSLog(@"iiiiiiii");
    });
    
    return instance;
}


@end
