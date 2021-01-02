//
//  AIELoopPageControl.m
//  AIELoopView
//
//  Created by 王新伟 on 2017/8/31.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import "AIELoopPageControl.h"
#import <Masonry.h>

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width


@interface AIELoopPageControl (){
    CGFloat _pageControlWidth;//PageControl宽度
    CGFloat _pageControlHeight;//PageControl高度
    CGFloat _controlLabelWidth;//controlLabel宽度
    CGFloat _controlLabelHeight;//controlLabel高度
    CGFloat _leftMargin;//左边距
}

/***/
@property (nonatomic, assign) PageControlStyle style;
/**小圆点数量*/
@property (nonatomic, assign) NSInteger  pageNumber;
/**PageControl内部的圆点*/
@property (nonatomic, strong) UILabel * controlLabel;

@end

@implementation AIELoopPageControl

-(instancetype )initWithStyle:(PageControlStyle)style pageNumber:(NSInteger)pageNumber{
    self = [self init];
    if (self) {
        self.style = style;
        self.pageNumber = pageNumber;
        [self createUI];
    }
    return self;
}

-(instancetype )init{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


-(void)createUI{
    _controlLabelWidth = 8;
    _controlLabelHeight = 8;
    _leftMargin = (ScreenWidth - self.pageNumber * _controlLabelWidth - (self.pageNumber - 1) * _controlLabelWidth)/2;
    for (int i = 0; i < self.pageNumber; i++) {
        self.controlLabel = [[UILabel alloc]init];
        self.controlLabel.layer.cornerRadius = _controlLabelHeight/2;
        self.controlLabel.layer.masksToBounds = YES;;
        self.controlLabel.backgroundColor = [UIColor greenColor];
        self.controlLabel.tag = 1000 + i;
        [self addSubview:self.controlLabel];
        [self.controlLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self.mas_left).offset(_leftMargin + (2 *_controlLabelWidth)*i);
            make.size.mas_equalTo(CGSizeMake(_controlLabelWidth, _controlLabelHeight));
        }];
    }
}


-(void)setCurrentPageControl:(NSInteger)currentPageControl{
    _currentPageControl = currentPageControl;
    for (UIView * v in self.subviews) {
        if (v.tag - 1000 == currentPageControl) {
            if (self.style == PageControlStyle_Rectangle) {
                v.backgroundColor = [UIColor orangeColor];
                [v mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(13, 7));
                }];
                v.layer.cornerRadius = 3.5;
            }else if (self.style == PageControlStyle_Circle){
                v.backgroundColor = [UIColor orangeColor];
                [v mas_updateConstraints:^(MASConstraintMaker *make) {
                    make.size.mas_equalTo(CGSizeMake(11, 11));
                }];
                v.layer.cornerRadius = 5.5;
            }
        }else{
            v.backgroundColor = [UIColor blueColor];
            [v mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(8,8));
            }];
            v.layer.cornerRadius = 4;
        }
    }
}

@end
