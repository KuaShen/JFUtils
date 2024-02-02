//
//  UIViewController+JFUtils.h
//  JFUtils
//
//  Created by mac on 2024/2/2.
//
// 控制器工具，通过UIViewController直接控制

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JFUtils)

/// 当前展示控制器
+ (UIViewController *)currentViewController;
/// 最合适的控制器
+ (UIViewController *)findBestViewController:(UIViewController *)vc;


@end

NS_ASSUME_NONNULL_END
