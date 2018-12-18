//
//  PolygonAttributeView.h
//  PolygonAttributeView
//
//  Created by 刘鹏i on 2018/12/18.
//  Copyright © 2018 wuhan.musjoy. All rights reserved.
//  多边形属性视图

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

IB_DESIGNABLE
@interface PolygonAttributeView : UIView
@property (nonatomic, strong) IBInspectable UIColor *lineColor; ///< 线的颜色
@property (nonatomic, strong) IBInspectable UIColor *fillColor; ///< 填充色

@property (nonatomic, assign) IBInspectable NSInteger maxScore; ///< 单个属性最大分数（默认 5）
@property (nonatomic, strong) NSArray<NSNumber *> *arrSocre;    ///< 各属性分数（1.传几个分数就是几边形 2.从-90°开始顺指针方向）

@end

NS_ASSUME_NONNULL_END
