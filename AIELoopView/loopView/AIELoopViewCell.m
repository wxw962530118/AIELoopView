//
//  AIELoopViewCell.m
//  图片轮播器
//
//  Created by 王新伟 on 16/4/7.
//  Copyright © 2016年 王新伟. All rights reserved.
//

#import "AIELoopViewCell.h"
#import <UIImageView+WebCache.h>
@implementation AIELoopViewCell {
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // 根据布局的cell大小初始化imageview大小
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_imageView];
    }
    return self;
}

- (void)setUrl:(NSString *)url {
    _url = url;
    if ([url hasPrefix:@"http:"] || [url hasPrefix:@"https:"]) {
        [_imageView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"Picture_Loading_Bg_375"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            if (error == nil && (cacheType == SDImageCacheTypeDisk || cacheType == SDImageCacheTypeNone)) {
                _imageView.alpha = 0;
                [UIView animateWithDuration:.5f animations:^{
                    _imageView.alpha = 1;
                }];
            }
        }];
    }else{
        _imageView.image = [UIImage imageNamed:url];
    }
}

@end
