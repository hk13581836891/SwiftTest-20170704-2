//
//  DemoVC14TableViewCell.m
//  sdftextdebug
//
//  Created by houke on 2017/3/23.
//  Copyright © 2017年 TT. All rights reserved.
//

#import "DemoVC14TableViewCell.h"
#import "UIView+SDAutoLayout.h"
#import "PhotosContainerView.h"

@implementation DemoVC14TableViewCell{
    PhotosContainerView * photoContainer;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.contentView.backgroundColor = [UIColor yellowColor];
    photoContainer = [[PhotosContainerView alloc] initWithItemsCount:9];
    [self.contentView addSubview:photoContainer];
    
    self.contenLabel.font = [UIFont systemFontOfSize:15];
    self.contenLabel.textColor = [UIColor grayColor];
    
    self.iconView.sd_layout.leftSpaceToView(self.contentView, 10).topSpaceToView(self.contentView, 10).widthIs(50).heightEqualToWidth();
    
    self.contenLabel.sd_layout.leftSpaceToView(self.iconView, 10).topEqualToView(self.iconView).rightSpaceToView(self.contentView, 10).autoHeightRatio(0);
    //label限制最多显示几行
//    [self.contenLabel setMaxNumberOfLinesToShow:3];
    
    photoContainer.sd_layout.leftEqualToView(self.contenLabel).topSpaceToView(self.contenLabel, 10).rightEqualToView(self.contenLabel);
    
    
    // Initialization code
}

-(void)setModel:(DemoVC14Model *)model
{
    _model = model;
    
    _contenLabel.text = model.title;
    _iconView.image = [UIImage imageNamed:model.iconImagePath];
    
    UIView *bottomView = _contenLabel;
    photoContainer.photoNamesArray = model.imagePathsArray;
    if (model.imagePathsArray.count > 0) {
        photoContainer.hidden = NO;
    }else{
        photoContainer.hidden = YES;
    }
    
    [self setupAutoHeightWithBottomView:photoContainer bottomMargin:10];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end









































































