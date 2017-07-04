//
//  PhotosContainerView.h
//  sdftextdebug
//
//  Created by houke on 2017/3/24.
//  Copyright © 2017年 TT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotosContainerView : UIView{
    NSInteger maxItemsCount;
}

- (instancetype)initWithItemsCount:(NSInteger)count;

@property (nonatomic, strong) NSArray *photoNamesArray;


@end
