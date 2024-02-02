//
//  JFViewUtils.h
//  JFUtils
//
//  Created by mac on 2024/2/2.
//

//对View操作工具

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    TopToBottom,
    BottomToTop,
    LeftToRight,
    RightToLeft,
    TopLeftToBottomRight,
    TopRightToBottomLeft,
    BottomLeftToTopRight,
    BottomRightToTopLeft
} JFGradientDirectionEnumerator;
@interface JFViewUtils : NSObject

/// 切圆角
/// - Parameters:
///   - view: 需要切圆角的view
///   - corners: 哪边的角
///   - radius: 这个角要切多少
+ (void)setupRoundedCornersSetView:(UIView *)view roundingCorners:(UIRectCorner)corners withRadius:(CGFloat)radius;


/// 指定某个角为圆角，要设置的圆角 使用“|”来组合
/// - Parameters:
///   - object: 需要切圆角的view
///   - corners: 哪边的角
///   - cornerRadius: 这个角要切多少
+ (void)view:(UIView *_Nonnull)object byRoundingCorners:(UIRectCorner)corners radius:(CGFloat)cornerRadius;

/// 渐变图层添加
/// - Parameters:
///   - gradientView: 把图层添加在这里
///   - colors: 渐变的颜色，注意需要使用CGColor
///   - locations: 渐变的层次（0,1）之间
///   - direction: 八个方向（上-下；下-上；左-右；右-左；左上-右下；左下-右上；右上-左下；右下-左上）
+ (void)addGradientLayerWithView:(UIView *)gradientView
                          colors:(NSArray *)colors
                       locations:(NSArray *)locations
                       direction:(JFGradientDirectionEnumerator)direction;


@end

NS_ASSUME_NONNULL_END
