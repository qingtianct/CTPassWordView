//
//  CTPasswordInputView.h
//  CYPWDDemo
//
//  Created by jxrs on 2021/8/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class CTPasswordInputView;

@protocol CTPasswordInputViewDelegate <NSObject>

@optional

/**
 *  可以获取用户输入的密码
 */
- (void)passwordInputView:(CTPasswordInputView *)passwordInputView inputPassword:(NSString *)password;


@end


@interface CTPasswordInputView : UIView
/**
 *  密码长度 默认6
 */
@property (nonatomic , assign ) NSUInteger passwordLength;
/**
 *  grid line color 默认紫色
 */
@property (nonatomic , strong) UIColor  *gridLineColor;
/**
 *  grid line width 默认1.0f
 */
@property (nonatomic , assign) CGFloat  gridLineWidth;
/**
 *  dot color 默认紫色
 */
@property (nonatomic , strong) UIColor  *dotColor;
/**
 *  dot width 默认12.0f
 */
@property (nonatomic , assign) CGFloat  dotWidth;
/**
 *  label text color 默认 黑色
 */
@property (nonatomic , strong) UIColor  *textColor;
/**
 *  label text font 默认 15
 */
@property (nonatomic , strong) UIFont *font;
/**
 *  明文 / 密文 , 默认密文(YES)
 */
@property(nonatomic, getter=isSecureTextEntry) BOOL secureTextEntry;
/**
 *  用户当前输入的密码个数 , 设置这个值,可以修改圆点显示
 */
@property (nonatomic , assign) NSInteger inputCount;
/**
 *  传递到外界用户输入的字符串
 */
@property (nonatomic, copy) void(^passwordBlock)(NSString *password);
/**
 *  用户输入的密码
 */
@property (nonatomic , strong , readonly) NSString  *password;
/**
 *  delegate
 */
@property (nonatomic , weak) id <CTPasswordInputViewDelegate>delegate;

/**
 *  快速创建对象,
 *
 *  @param passwordLength 密码长度,默认6位
 *
 *  @return XLPasswordInputView实例对象
 */
+ (instancetype)passwordInputViewWithPasswordLength:(NSInteger)passwordLength;
/**
 *  清空密码,重置
 */
- (void)clearPassword;


- (BOOL)becomeFirstResponder;
- (BOOL)resignFirstResponder;

@end

NS_ASSUME_NONNULL_END
