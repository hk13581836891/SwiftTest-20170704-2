//
//  DemoVC14.m
//  sdftextdebug
//
//  Created by houke on 2017/3/22.
//  Copyright © 2017年 TT. All rights reserved.
//

#import "DemoVC14.h"
#import "DemoVC14Model.h"
#import "DemoVC14TableViewCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"

@interface DemoVC14 ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableView;
}

@property (nonatomic, strong) NSMutableArray * modelsArray;

@end

@implementation DemoVC14


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self creatModelsWithCount:30];
    
    _tableView = [[UITableView alloc] init];
    _tableView.frame = CGRectMake(0, 20, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor yellowColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"DemoVC14TableViewCell" bundle:nil] forCellReuseIdentifier:@"DemoVC14TableViewCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)creatModelsWithCount:(NSInteger)count
{
    if (!_modelsArray) {
        _modelsArray = [NSMutableArray array];
        
    }
    
    NSArray * iconImageNamesArray = @[@"icon0.jpg",
                                      @"icon1.jpg",
                                      @"icon2.jpg",
                                      @"icon3.jpg",
                                      @"icon4.jpg",
                                      @"icon0.jpg",
                                      @"icon1.jpg",
                                      @"icon2.jpg",
                                      @"icon3.jpg",];
    NSArray * textArray = @[@"你的 app 没有提供 3x 的LaunchImage 时。然后等比例拉伸屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任小。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                            @"然后等比例拉伸到大屏。屏幕宽度返回 320否则在大屏上会显得字大长期处于这种模式下，否则在大屏上会显得字大，内容少这种情况下对界面不会",
                            @"长期处于这种模式下，否则在大屏上会显得字大，内容少这种情况下对界面不会但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                            @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                            @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任小。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。"
                            ];
    
    for (int i = 0; i<count; i++){
        
        int nameRandomIndex = arc4random_uniform(5);
        
        DemoVC14Model *model = [DemoVC14Model new];
        model.title = textArray[nameRandomIndex];
        model.iconImagePath = iconImageNamesArray[arc4random_uniform(8)];
        
        //模拟“有或者无图片”
        NSMutableArray * temp = [NSMutableArray new];
        int randomImageCount = arc4random_uniform(8);
        for (int i = 0; i < randomImageCount; i++) {
            int randomIndex = arc4random_uniform(8);
            NSString *text = iconImageNamesArray[randomIndex];
            [temp addObject:text];
        }
        model.imagePathsArray = temp;
        [self.modelsArray addObject:model];
        
    }
    
    
    
    
    
    
    
    
    
    
}

#pragma mark tableview dataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelsArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoVC14TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemoVC14TableViewCell"];
    cell.model = self.modelsArray[indexPath.row];
    
    return cell;
}
#pragma mark tableview Delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DemoVC14Model * model = [self.modelsArray objectAtIndex:indexPath.row];
    CGFloat height = [_tableView cellHeightForIndexPath:indexPath model:model keyPath:@"model" cellClass:[DemoVC14TableViewCell class] contentViewWidth:[UIScreen mainScreen].bounds.size.width];
    
    return height;
}
@end



































