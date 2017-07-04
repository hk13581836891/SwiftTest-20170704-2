//
//  HttpTool.m
//  Tian_IOS
//
//  Created by 杨锐 on 16/9/14.
//  Copyright © 2016年 RichyLeo. All rights reserved.
//

#import "HttpTool.h"
#import "AFNetworking.h"

@implementation HttpTool
+ (void)httpGet:(NSString *)baseUrl params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    NSLog(@"111111%@",baseUrl);
    [self http:@"GET" baseUrl:baseUrl params:params success:success failure:failure];
}

+ (void)httpPost:(NSString *)baseUrl params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    [self http:@"POST" baseUrl:baseUrl params:params success:success failure:failure];
}


+ (void)http:(NSString *)type baseUrl:(NSString *)baseUrl params:(NSDictionary *)params success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure {
    
    if(!baseUrl)
    {
        baseUrl = @"";
    }
    NSLog(@"22222222%@",baseUrl);
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    if ([type isEqualToString:@"POST"]) {
        
        [manager POST:baseUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            if (success) {
                success(responseObject);
                
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
    }
    else {
        
        [manager GET:baseUrl parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
            if (success) {
                success(responseObject);
            }
            
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            if (failure) {
                failure(error);
            }
        }];
    }
}
@end
