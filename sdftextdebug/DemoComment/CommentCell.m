//
//  CommentCell.m
//  sdftextdebug
//
//  Created by houke on 2017/3/29.
//  Copyright © 2017年 TT. All rights reserved.
//

#import "CommentCell.h"

#define headerH 35
#define kAllCellMargin 10
@implementation CommentCell
{
}
+(instancetype)commentCell:(UITableView *)tableview
{
    static NSString *ID = @"commentCell";
    CommentCell *cell = [tableview dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[CommentCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:ID];
    }
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    return cell;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self makeUI];
    }
    return self;
}

-(void)makeUI
{
    _headImageView = [[UIImageView alloc]init];
    _headImageView.layer.masksToBounds = YES;
    _headImageView.layer.cornerRadius = headerH/2;
//    _headImageView.layer.transform=CATransform3DMakeRotation(M_PI_4, 1, 1, 0.5);
    [self.contentView addSubview:_headImageView];
    
    _authorNameLabel = [[UILabel alloc] init];
    _authorNameLabel.font = [UIFont systemFontOfSize:14];
    _authorNameLabel.textColor = [UIColor grayColor];
    _authorNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_authorNameLabel];
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.font = [UIFont systemFontOfSize:12];
    _timeLabel.textColor = [UIColor lightGrayColor];
    _timeLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_timeLabel];
    
    _commentZanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_commentZanBtn setImage:[UIImage imageNamed:@"news_like"] forState:UIControlStateNormal];
    [_commentZanBtn setImage:[UIImage imageNamed:@"news_liked"] forState:UIControlStateSelected];
    [_commentZanBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 10)];
    [_commentZanBtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_commentZanBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    _commentZanBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    [_commentZanBtn setTitleEdgeInsets:UIEdgeInsetsMake(10, 0, 0, 0)];
    [_commentZanBtn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    [self.contentView addSubview:_commentZanBtn];
    
    _answerContentView = [[UIView alloc] init];
    _answerContentView.backgroundColor = [UIColor lightGrayColor];
    [self.contentView addSubview:_answerContentView];
    
    _answerNameLabel = [[UILabel alloc] init];
    _answerNameLabel.font = [UIFont systemFontOfSize:12];
    _answerNameLabel.textColor = [UIColor greenColor];
    _answerNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_answerNameLabel];
    
    _answerTextLabel = [[UILabel alloc] init];
    _answerTextLabel.font = [UIFont systemFontOfSize:14];
    _answerTextLabel.textColor = [UIColor yellowColor];
    _answerTextLabel.textAlignment = NSTextAlignmentLeft;
    _answerTextLabel.numberOfLines = 0;
    [self.contentView addSubview:_answerTextLabel];
    
    _commentTextLabel = [[UILabel alloc] init];
    _commentTextLabel.numberOfLines = 0;
    _commentTextLabel.font = [UIFont systemFontOfSize:14];
    _commentTextLabel.textColor = [UIColor yellowColor];
    _commentTextLabel.textAlignment = NSTextAlignmentLeft;
    [self.contentView addSubview:_commentTextLabel];
    
    _bottomSepline = [[UIView alloc] init];
    _bottomSepline.backgroundColor = [UIColor grayColor];
    [self.contentView addSubview:_bottomSepline];
    
    
    [self setupAutoHeightWithBottomView:_bottomSepline bottomMargin:10];
    
}

-(void)setModel:(CommentModel *)model
{
    _model = model;
    
    // 重置frame，防止重用过程中出现问题（只有在cell布局变化非常大的情况下需要此步设置，一般cell的自动布局不需要这样处理）
    _headImageView.frame = CGRectZero;
    _authorNameLabel.frame = CGRectZero;
    _timeLabel.frame = CGRectZero;
    _commentZanBtn.frame = CGRectZero;
    _answerContentView.frame = CGRectZero;
    _answerNameLabel.frame = CGRectZero;
    _answerContentView.frame = CGRectZero;
    _commentTextLabel.frame = CGRectZero;
    _bottomSepline.frame = CGRectZero;
  
    // 清空之前的约束（只有在cell布局非常大的情况下需要此步设置，一般cell的自动布局不需要这样处理）
    [_headImageView sd_clearAutoLayoutSettings];
    [_authorNameLabel sd_clearAutoLayoutSettings];
    [_timeLabel sd_clearAutoLayoutSettings];
    [_commentZanBtn sd_clearAutoLayoutSettings];
    [_answerContentView sd_clearAutoLayoutSettings];
    [_answerNameLabel sd_clearAutoLayoutSettings];
    [_answerTextLabel sd_clearAutoLayoutSettings];
    [_commentTextLabel sd_clearAutoLayoutSettings];
    [_bottomSepline sd_clearAutoLayoutSettings];
    
    
    
    
    [_headImageView sd_setImageWithURL:[NSURL URLWithString:_model.usericonurl] placeholderImage:nil];
    _authorNameLabel.text = _model.username;
    _timeLabel.text = [Tools changeTimeStyle:[model.time stringValue]];
    _commentZanBtn.selected = [model.is_like intValue] ==1;
    [_commentZanBtn setTitle:[model.likenum stringValue] forState:UIControlStateNormal];
    _authorNameLabel.text = model.parent.username;
    _answerTextLabel.text = model.parent.content;
    _commentTextLabel.text = model.content;
    
    
    
    _headImageView.sd_resetLayout
    .leftSpaceToView(self.contentView,10)
    .topSpaceToView(self.contentView,10)
    .widthIs(headerH)
    .heightIs(headerH);
    
    _authorNameLabel.sd_resetLayout
    .topEqualToView(_headImageView)
    .leftSpaceToView(_headImageView,10)
    .heightIs(14);
    [_authorNameLabel setSingleLineAutoResizeWithMaxWidth:180];
    _authorNameLabel.backgroundColor = [UIColor purpleColor];
    
    _commentZanBtn.sd_resetLayout
    .topEqualToView(_headImageView)
    .rightSpaceToView(self.contentView,10)
    .heightIs(20);
    
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
