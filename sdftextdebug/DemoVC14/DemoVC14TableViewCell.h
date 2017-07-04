//
//  DemoVC14TableViewCell.h
//  sdftextdebug
//
//  Created by houke on 2017/3/23.
//  Copyright © 2017年 TT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DemoVC14Model.h"

@interface DemoVC14TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *contenLabel;


@property (nonatomic, strong) DemoVC14Model *model;
@end
