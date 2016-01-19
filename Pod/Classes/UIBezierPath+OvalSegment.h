//
//  UIBezierPath+OvalSegment.h
//
//  Created by Giuseppe Nucifora on 19/01/16.
//  Copyright © 2016 Giuseppe Nucifora All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBezierPath (OvalSegment)

+ (UIBezierPath *)bezierPathWithOvalInRect:(CGRect)rect startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle;
+ (UIBezierPath *)bezierPathWithOvalInRect:(CGRect)rect startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle angleStep:(CGFloat)angleStep;


@end
