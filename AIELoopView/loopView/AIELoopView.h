//
//  AIELoopView.h
//  图片轮播器
//
//  Created by 王新伟 on 16/4/7.
//  Copyright © 2016年 王新伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIELoopView : UICollectionView

/**
 构建轮播器

 @param urls 图片URL数组
 @param didSelected 选择的index回调
 */

- (instancetype)initWithURLs:(NSArray <NSString *> *)urls didSelected:(void (^)(NSInteger index))didSelected;

@end
