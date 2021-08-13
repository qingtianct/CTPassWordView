//
//  UIColor+CTPasswordView.h
//  CYPWDDemo
//
//  Created by jxrs on 2021/8/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (CTPasswordView)

/**
 *
 *  @param color 从十六进制字符串获取颜色，color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 */
+ (UIColor *)colorWithHexString:(NSString *)color;
/**
 *  从十六进制字符串获取颜色，color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
 *
 *  @param color 十六进制字符串
 *  @param alpha 透明度
 *
 *  @return 返回的颜色
 */
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

/**
 *  返回一个随机颜色 , 透明度是1
 */
+ (UIColor *)ct_randomColor;
@end

NS_ASSUME_NONNULL_END
