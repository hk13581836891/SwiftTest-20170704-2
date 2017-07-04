//
//  NavigationViewController.m
//  sdftextdebug
//
//  Created by houke on 2017/3/27.
//  Copyright © 2017年 TT. All rights reserved.
//

#import "NavigationViewController.h"
#import "DemoVC14.h"
#import "ViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationBar.hidden = YES;
    ViewController * vc = [[ViewController alloc] init];
    [self setViewControllers:@[vc]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
