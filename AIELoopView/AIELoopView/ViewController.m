//
//  ViewController.m
//  AIELoopView
//
//  Created by 王新伟 on 2017/6/21.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "ViewController.h"
#import "AIELoopView.h"
#import  <Masonry.h>
@interface ViewController ()
/**网络图片URL数组*/
@property (nonatomic, strong) NSMutableArray <NSString *> * urlArrays;
/**本地图片名称数组*/
@property (nonatomic, strong) NSMutableArray <NSString *> * imageArrays;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //初始化数据
    for (int i = 0; i < 4; i++) {
        [self.imageArrays addObject:[NSString stringWithFormat:@"link_page%d",i + 1]];
    }
    
    [self.urlArrays addObject:@"http://ww1.sinaimg.cn/large/61b69811gw1f6bqb1bfd2j20b4095dfy.jpg"];
    [self.urlArrays addObject:@"http://ww2.sinaimg.cn/large/9c2b5f31jw1f6bqtinmpyj20dw0ae76e.jpg"];
    [self.urlArrays addObject:@"http://ww3.sinaimg.cn/large/006ka0Iygw1f6bqm7zukpj30g60kzdi2.jpg"];
    [self.urlArrays addObject:@"http://ww4.sinaimg.cn/bmiddle/406ef017jw1ec40av2nscj20ip4p0b29.jpg"];
    
    //创建本地图片轮播器
    AIELoopView * urlLoopView = [[AIELoopView alloc]initWithURLs:self.imageArrays didSelected:^(NSInteger index) {
        
    }];
    
    [self.view addSubview:urlLoopView];
    [urlLoopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view.mas_top).offset(64);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.height.mas_equalTo(120);
    }];
    
    //创建网络图片轮播器
    AIELoopView * imageLoopView = [[AIELoopView alloc]initWithURLs:self.urlArrays didSelected:^(NSInteger index) {
        
    }];
    
    [self.view addSubview:imageLoopView];
    [imageLoopView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(urlLoopView.mas_bottom).offset(64);
        make.left.equalTo(self.view.mas_left).offset(30);
        make.right.equalTo(self.view.mas_right).offset(-30);
        make.height.mas_equalTo(120);
    }];
    
    
}

#pragma mark --- lazy
-(NSMutableArray *)urlArrays{
    if (!_urlArrays) {
        _urlArrays = [NSMutableArray array];
    }
    return _urlArrays;
}

-(NSMutableArray *)imageArrays{
    if (!_imageArrays) {
        _imageArrays = [NSMutableArray array];
    }
    return _imageArrays;
}

@end
