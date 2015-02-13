//
//  ViewController.m
//  CustomScrollView
//
//  Created by BraveMatch on 15/2/4.
//  Copyright (c) 2015年 BraveMatch. All rights reserved.
//

#import "ViewController.h"
#import "SimpleCustomScrollView.h"

@interface ViewController ()

@property (nonatomic, strong) SimpleCustomScrollView *customScroll;

@end

@implementation ViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.customScroll = [[SimpleCustomScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.customScroll];

    // 跟系统的一样, 在这我们也必须要设置contentSize的大小, 否则无法滚动
    self.customScroll.contentSize = CGSizeMake(0, 800);
    
    [self p_setupSubviews];

}


// 创建视图
- (void)p_setupSubviews
{
    // 因为老喝橙汁么, 所以就报答一下橙色了
    UIView *orangeView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    orangeView.backgroundColor = [UIColor orangeColor];
    
    [self.customScroll addSubview:orangeView];
}





@end