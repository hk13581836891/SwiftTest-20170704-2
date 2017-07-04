//
//  CommentParentModel.h
//  sdftextdebug
//
//  Created by houke on 2017/3/29.
//  Copyright © 2017年 TT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommentParentModel : NSObject

@property (strong,nonatomic) NSNumber *touserid;
@property (copy,nonatomic) NSString *source;
@property (strong,nonatomic) NSNumber *userid;
@property (copy,nonatomic) NSString *tousername;
@property (copy,nonatomic) NSString *content;
@property (strong,nonatomic) NSNumber *likenum;
@property (copy,nonatomic) NSString *news_id;
@property (strong,nonatomic) NSNumber *is_like;
@property (strong,nonatomic) NSNumber *ID;
@property (strong,nonatomic) NSNumber *time;
@property (copy,nonatomic) NSString *usericonurl;
@property (copy,nonatomic) NSString *username;
@property (strong,nonatomic) NSNumber *unlikenum;
@end
