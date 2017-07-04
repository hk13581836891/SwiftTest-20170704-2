//
//  CommentCell.h
//  sdftextdebug
//
//  Created by houke on 2017/3/29.
//  Copyright © 2017年 TT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommentModel.h"

@interface CommentCell : UITableViewCell
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UILabel *authorNameLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *commentZanBtn;
@property (nonatomic, strong) UIView *answerContentView;
@property (nonatomic, strong) UILabel *answerNameLabel;
@property (nonatomic, strong) UILabel *answerTextLabel;
@property (nonatomic, strong) UILabel *commentTextLabel;
@property (nonatomic, strong) UIView *bottomSepline;
@property (nonatomic, strong) CommentModel *model;
+(instancetype)commentCell:(UITableView *)tableview;

@end
