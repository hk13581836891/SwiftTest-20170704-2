//
//  ViewController.m
//  sdftextdebug
//
//  Created by houke on 2017/2/28.
//  Copyright © 2017年 TT. All rights reserved.
//

#import "ViewController.h"
#import "testobject.h"
#import "singleTon.h"
#import "DemoVC14.h"
#import "DeomCommentViewController.h"

@interface ViewController (){
    UIImageView * img;
}
@property (nonatomic, strong) UIImageView *img2;
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
//    [UIApplication sharedApplication]   
    self.view.backgroundColor = [UIColor whiteColor];
    img = [[UIImageView alloc] init];
    img.frame = CGRectMake(0, 0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    img.contentMode = UIViewContentModeScaleAspectFill;
    img.backgroundColor = [UIColor redColor];
    img.userInteractionEnabled = YES;
    [img setImage:[UIImage imageNamed:@"tt.jpg"]];
    [self.view addSubview:img];
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 50, 64);
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [img addSubview:button];
    
    
    
//    NSString *filePath = [NSString stringWithFormat:@"%s", __FILE__];
//    NSMutableString * mstring = [NSMutableString stringWithFormat:@"11"];
////    NSString * mstring = [NSString stringWithFormat:@"11"];
//    _strong = mstring;
//    _copyy = mstring;
////    _mstrong = mstring;
////    _mcopy = mstring;
//    
//    NSLog(@"%@  %@   %@  %@",self.strong,self.copyy,_mstrong,_mcopy);    [mstring appendString:@"22"];
////    mstring = [NSString stringWithFormat:@"%@22",mstring];
//    
//    NSLog(@"%@  %@   %@  %@",self.strong,self.copyy,_mstrong,_mcopy);
//
    
    

}

-(void)buttonClick:(UIButton *)sender
{
    NSLog(@"sdfs");
    self.img2 = [[UIImageView alloc] init];
    self.img2.frame = CGRectMake(0, 100, SCREEN_WIDTH, SCREEN_HEIGHT);
    [self.view insertSubview:self.img2 aboveSubview:img];
    NSMutableArray *picArr = [NSMutableArray arrayWithCapacity:14];
    for (int i = 0; i<13; i++) {
        NSString *picName = [NSString stringWithFormat:@"cymbal_%02d.jpg",i];
        NSString *path =[[NSBundle mainBundle] pathForResource:picName ofType:nil];
        
        UIImage *picImage = [UIImage imageWithContentsOfFile:path];
//        UIImage *picImage = [UIImage imageNamed:[NSString stringWithFormat:@"cymbal_%02d.jpg",i]];
        [picArr addObject:picImage];

    }
    
    self.img2.animationImages = picArr;
    
    self.img2.animationDuration = 13*0.12;
    
    self.img2.animationRepeatCount = 1;
    [self.img2 startAnimating];
    
   }




















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
