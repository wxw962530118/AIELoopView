//
//  AIELoopPageControl.h
//  AIELoopView
//
//  Created by 王新伟 on 2017/8/31.
//  Copyright © 2017年 王新伟. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef  NS_ENUM(NSInteger,PageControlStyle){
    PageControlStyle_Circle,//圆点形式 最基本
    PageControlStyle_Rectangle,//长条形形式
};

@interface AIELoopPageControl : UIView

/**
 构建PageControl
 @param style 外界执行需要传入需要创建的PageControl类型 及 数量 即可
 */
-(instancetype)initWithStyle:(PageControlStyle )style pageNumber:(NSInteger )pageNumber;

/**当前选中的PageControl*/
@property (nonatomic, assign) NSInteger currentPageControl;

@end
