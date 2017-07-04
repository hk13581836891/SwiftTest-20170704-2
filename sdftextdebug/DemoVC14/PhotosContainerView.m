//
//  PhotosContainerView.m
//  sdftextdebug
//
//  Created by houke on 2017/3/24.
//  Copyright © 2017年 TT. All rights reserved.
//

#import "PhotosContainerView.h"
#import "UIView+SDAutoLayout.h"

@implementation PhotosContainerView{
    NSMutableArray *_imageViewArray;
}


-(instancetype)initWithItemsCount:(NSInteger)count{
    if (self = [super init]) {
        maxItemsCount = count;
    }
    
    return self;
}

-(void)setPhotoNamesArray:(NSArray *)photoNamesArray{
    
    _photoNamesArray = photoNamesArray;
    
    if (!_imageViewArray) {
        _imageViewArray = [NSMutableArray new];
    }
    
    int needsToAddItemCount = (int)_photoNamesArray.count;
    if (needsToAddItemCount > 0) {
        for (int i = 0; i <needsToAddItemCount; i++) {
            UIImageView *imageView = [[UIImageView alloc] init];
            [self addSubview:imageView];
            [_imageViewArray addObject:imageView];
        }
    }
    
    NSMutableArray *temp = [NSMutableArray new];
    
    [_imageViewArray enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (idx < _photoNamesArray.count) {
            imageView.hidden = NO;
            imageView.sd_layout.autoHeightRatio(1);
            imageView.image = [UIImage imageNamed:_photoNamesArray[idx]];
            [temp addObject:imageView];
        } else {
            [imageView sd_clearAutoLayoutSettings];
            imageView.hidden = YES;
        }    }];
    
//    [self setupAutoWidthFlowItems:[temp copy] withPerRowItemsCount:3 verticalMargin:10 horizontalMargin:10 verticalEdgeInset:0 horizontalEdgeInset:0];
}


@end































