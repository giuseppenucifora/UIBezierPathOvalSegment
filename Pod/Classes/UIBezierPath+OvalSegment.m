//
//  UIBezierPath+OvalSegment.m
//
//  Created by Giuseppe Nucifora on 19/01/16.
//  Copyright © 2016 Giuseppe Nucifora All rights reserved.
//

#import "UIBezierPath+OvalSegment.h"

@implementation UIBezierPath (OvalSegment)

+ (UIBezierPath *)bezierPathWithOvalInRect:(CGRect)rect startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle angleStep:(CGFloat)angleStep {
    CGPoint center = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect));
    CGFloat xRadius = CGRectGetWidth(rect)/2.0f;
    CGFloat yRadius = CGRectGetHeight(rect)/2.0f;
    
    UIBezierPath *ellipseSegment = [UIBezierPath new];
    
    CGPoint firstEllipsePoint = [self ellipsePointForAngle:startAngle withCenter:center xRadius:xRadius yRadius:yRadius];
    [ellipseSegment moveToPoint:firstEllipsePoint];
    
    for (CGFloat angle = startAngle + angleStep; angle < endAngle; angle += angleStep) {
        CGPoint ellipsePoint = [self ellipsePointForAngle:angle withCenter:center xRadius:xRadius yRadius:yRadius];
        [ellipseSegment addLineToPoint:ellipsePoint];
    }
    
    CGPoint lastEllipsePoint = [self ellipsePointForAngle:endAngle withCenter:center xRadius:xRadius yRadius:yRadius];
    [ellipseSegment addLineToPoint:lastEllipsePoint];
    
    return ellipseSegment;
}

+ (UIBezierPath *)bezierPathWithOvalInRect:(CGRect)rect startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle {
    return [UIBezierPath bezierPathWithOvalInRect:rect startAngle:startAngle endAngle:endAngle angleStep:M_PI/20.0f];
}

+ (CGPoint)ellipsePointForAngle:(CGFloat)angle withCenter:(CGPoint)center xRadius:(CGFloat)xRadius yRadius:(CGFloat)yRadius {
    CGFloat x = center.x + xRadius * cosf(angle);
    CGFloat y = center.y - yRadius * sinf(angle);
    return CGPointMake(x, y);
}

@end
