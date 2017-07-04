//
//  CommentModel.h
//  sdftextdebug
//
//  Created by houke on 2017/3/29.
//  Copyright © 2017年 TT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CommentParentModel.h"

@interface CommentModel : NSObject


@property (nonatomic, strong) CommentParentModel *parent;
@property (nonatomic, copy) NSString *touserid;
@property (nonatomic, copy) NSString *source;
@property (nonatomic, strong) NSNumber *userid;
@property (nonatomic, copy) NSString *tousername;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, strong) NSNumber *likenum;
@property (nonatomic, strong) NSNumber *comId;
@property (nonatomic, strong) NSNumber *time;
@property (nonatomic, copy) NSString *usericonurl;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, strong) NSString *unlikenum;

@property (strong,nonatomic) NSNumber *is_like;
@end
