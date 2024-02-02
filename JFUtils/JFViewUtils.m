//
//  JFViewUtils.m
//  JFUtils
//
//  Created by mac on 2024/2/2.
//

#import "JFViewUtils.h"

@implementation JFViewUtils


// corners(枚举类型，可组合使用)：UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft | UIRectCornerBottomRight | UIRectCornerAllCorners
+ (void)setupRoundedCornersSetView:(UIView *)view roundingCorners:(UIRectCorner)corners withRadius:(CGFloat)radius {
    @synchronized (view) {
        UIBezierPath *rounded = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *shape = [[CAShapeLayer alloc]init];
        [shape setPath:rounded.CGPath];
        view.layer.mask = shape;
    }
    
}

+ (void)view:(UIView *)object byRoundingCorners:(UIRectCorner)corners radius:(CGFloat)cornerRadius
{
    if (cornerRadius == 0) {
        cornerRadius = 5;
    }
    //绘制圆角 要设置的圆角 使用“|”来组合
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:object.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    //设置大小
    maskLayer.frame = object.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    object.layer.mask = maskLayer;
}


+ (void)addGradientLayerWithView:(UIView *)gradientView
                          colors:(NSArray *)colors
                       locations:(NSArray *)locations
                       direction:(JFGradientDirectionEnumerator)direction{
    [gradientView layoutIfNeeded];
    CAGradientLayer *colorLayer = [CAGradientLayer layer];
    [gradientView.layer addSublayer:colorLayer];
    [gradientView.layer insertSublayer:colorLayer atIndex:0];
    colorLayer.masksToBounds = YES;
    colorLayer.colors = colors;
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(0, 0);
    switch (direction) {
        case TopToBottom:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(0, 1);
            break;
        case BottomToTop:
            startPoint = CGPointMake(0, 1);
            endPoint = CGPointMake(0, 0);
            break;
        case LeftToRight:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1, 0);
            break;
        case RightToLeft:
            startPoint = CGPointMake(1, 0);
            endPoint = CGPointMake(0, 0);
            break;
        case TopLeftToBottomRight:
            startPoint = CGPointMake(0, 0);
            endPoint = CGPointMake(1, 1);
            break;
        case TopRightToBottomLeft:
            startPoint = CGPointMake(1, 0);
            endPoint = CGPointMake(0, 1);
            break;
        case BottomLeftToTopRight:
            startPoint = CGPointMake(0, 1);
            endPoint = CGPointMake(1, 0);
            break;
        case BottomRightToTopLeft:
            startPoint = CGPointMake(1, 1);
            endPoint = CGPointMake(0, 0);
            break;
        default:
            break;
    }
    colorLayer.startPoint = startPoint;
    colorLayer.endPoint = endPoint;
    colorLayer.locations = locations;
    colorLayer.frame = gradientView.bounds;
}




@end
