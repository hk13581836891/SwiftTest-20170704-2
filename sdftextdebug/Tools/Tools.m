//
//  Tools.m
//  CCTVNews
//
//  Created by Richy Leo on 14-8-27.
//  Copyright (c) 2014年 Richy Leo. All rights reserved.
//

#import "Tools.h"

@implementation Tools

//时间格式转换 long型转字符串
+(NSString *)changeTimeStyle:(id)newsTime;
{
    long long newstime;
    if (newsTime != [NSNull null] ) {
        newstime = [newsTime longLongValue];
    }
    
    NSDate *date= [NSDate dateWithTimeIntervalSince1970:newstime/1000];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit | NSHourCalendarUnit |NSMinuteCalendarUnit fromDate:date];
    NSInteger day = [components day];
    NSInteger month= [components month];
    NSInteger hour = [components hour];
    NSInteger minute = [components minute];
    NSString * time = [NSString stringWithFormat:@"%02ld-%02ld %02ld:%02ld", (long)month,(long)day,(long)hour,(long)minute];
    
    return time;
}



@end
