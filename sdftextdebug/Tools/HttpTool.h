//
//  HttpTool.h
//  Tian_IOS
//
//  Created by 杨锐 on 16/9/14.
//  Copyright © 2016年 RichyLeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface HttpTool : NSObject
+ (void)httpGet:(NSString *)baseUrl params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;

+ (void)httpPost:(NSString *)baseUrl params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;
@end
