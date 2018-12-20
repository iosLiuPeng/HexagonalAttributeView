//
//  PolygonAttributeView.m
//  PolygonAttributeView
//
//  Created by 刘鹏i on 2018/12/18.
//  Copyright © 2018 wuhan.musjoy. All rights reserved.
//

#import "PolygonAttributeView.h"

@implementation PolygonAttributeView
 + (Class)layerClass
{
    return [CAShapeLayer class];
}

#pragma makr - Life Cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self viewConfg];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self viewConfg];
    }
    return self;
}


#pragma mark - Subjoin
- (void)viewConfg
{
    self.backgroundColor = [UIColor clearColor];
    
    if (_lineColor == nil) {
        _lineColor = [UIColor blackColor];
    }
    
    if (_fillColor == nil) {
        _fillColor = [UIColor blackColor];
    }
    
    if (_maxScore <= 0) {
        _maxScore = 5;
    }    
}

- (void)setArrSocre:(NSArray<NSNumber *> *)arrSocre
{
    _arrSocre = arrSocre;
    
    [self setNeedsDisplay];
}

#pragma mark - Private
/**
 圆上某点坐标

 @param center 圆心
 @param angle 角度，例30°
 @param radius 半径
 @return 该点坐标
 */
- (CGPoint)calcCircleCoordinateWithCenter:(CGPoint)center andWithAngle:(CGFloat)angle andWithRadius:(CGFloat)radius
{
    CGFloat x = radius * cosf(angle / 180 * M_PI);
    CGFloat y = radius * sinf(angle / 180 * M_PI);
    return CGPointMake(center.x + x, center.y - y);
}

#pragma mark - Subjoin
- (void)drawRect:(CGRect)rect
{
    CGFloat width = MIN(rect.size.width, rect.size.height);;
    CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0);
    
    // 曲线
    UIBezierPath *path = [UIBezierPath bezierPath];
    path.lineWidth = 1;
    
    // 绘制
    for (NSInteger i = 0; i < _arrSocre.count; i++) {
        // 角度
        CGFloat angle = -90 + 360.0 / _arrSocre.count * i;
        // 分数
        CGFloat socre = [_arrSocre[i] floatValue];
        if (socre < 0) {
            socre = 0;
        }
        if (socre > _maxScore) {
            socre = _maxScore;
        }
        // 边长
        CGFloat length = width / 2.0 * (socre / _maxScore);
        // 坐标 (在iOS中，正值表示逆时针旋转，负值表示顺时针旋转。)
        CGPoint point = [self calcCircleCoordinateWithCenter:center andWithAngle:-angle andWithRadius:length];
        
        if (i == 0) {
            [path moveToPoint:point];
        } else {
            [path addLineToPoint:point];
        }
    }

    [path closePath];
    
    [_lineColor set];
    [path stroke];
    
    [_fillColor set];
    [path fill];
}


@end
