//
//  DeomCommentViewController.m
//  sdftextdebug
//
//  Created by houke on 2017/3/28.
//  Copyright © 2017年 TT. All rights reserved.
//

#import "DeomCommentViewController.h"
#import "CommentModel.h"
#import "MJExtension.h"
#import "CommentCell.h"

@interface DeomCommentViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    UITableView * _tableView;
}

@end

@implementation DeomCommentViewController{
    NSArray *comModelArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    [self getCommentListData];
    [self initTableView];
}

-(void)getHotCommenListData{
    
    NSString *url = @"app.ttplus.cn:1102/v2/commpent/news/hot//46478/";
    [HttpTool httpGet:url params:nil success:^(id responseObject) {
        
        NSDictionary * dic = responseObject;
        
    } failure:^(NSError *error) {
        
    }];
    
}

-(void)getCommentListData{
    
    NSString * url = @"http://app.ttplus.cn:1102/v2/commpent/news//46478/0/";
    
    NSLog(@"111111%@",url);
    
    [HttpTool httpGet:url params:nil success:^(id responseObject) {
        NSDictionary * dic = responseObject;

        comModelArray = [CommentModel objectArrayWithKeyValuesArray:[dic objectForKey:@"comment"]];
        NSLog(@"yyyyy%@",comModelArray);
        
        [_tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
-(void)initTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark tableview datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return comModelArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommentCell * cell = [CommentCell commentCell:tableView];
    cell.model = comModelArray[indexPath.row];
    
    
    return cell;
}

#pragma mark tableview delegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger nRow = indexPath.row;
    CGFloat height;
    NSLog(@"666%@",comModelArray[nRow]);
    height =[_tableView cellHeightForIndexPath:indexPath model:comModelArray[nRow] keyPath:@"model" cellClass:[CommentCell class] contentViewWidth:SCREEN_WIDTH];
    
    return height;
}
@end
