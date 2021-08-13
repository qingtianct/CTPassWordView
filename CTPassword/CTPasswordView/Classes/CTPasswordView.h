//
//  CTPasswordView.h
//  CYPWDDemo
//
//  Created by jxrs on 2021/8/12.
//

#import <UIKit/UIKit.h>
#import "CTPasswordViewTypeDefine.h"
NS_ASSUME_NONNULL_BEGIN

@class CTPasswordView;

@protocol CTPasswordViewDelegate <NSObject>

/**
 *  用户输入密码时调用
 *
 *  @param passwordView 视图
 *  @param password     输入的密码文本
 */
- (void)passwordView:(CTPasswordView *)passwordView passwordTextDidChange:(NSString *)password;
/**
 *  输入密码位数已满时调用
 */
- (void)passwordView:(CTPasswordView *)passwordView didFinishInput:(NSString *)password;

@optional
/**
 *  点击了忘记密码时调用
 */
- (void)passwordViewClickForgetPassword:(CTPasswordView *)passwordView;

- (void)clickCloseBtn;

@end

@interface CTPasswordView : UIView

/**
 *  delegate
 */
@property (nonatomic , weak) id <CTPasswordViewDelegate>delegate;
/** 键盘类型 */
@property (nonatomic , assign , readonly) CTPasswordViewKeyboardType keyboardType;

/**
 *  快速创建方法
 */
+ (instancetype)passwordView;
+ (instancetype)passwordViewWithKeyboardType:(CTPasswordViewKeyboardType)keyboardType;

/**
 *  展示
 *
 *  @param view 添加到的目的视图,如果为空就添加到窗口上面
 */
- (void)showPasswordInView:(UIView *)view;


- (void)showPasswordWithNaviInView:(UIView *)view withNaviHeight:(CGFloat)height;

/**
 *  隐藏
 */
- (void)hidePasswordView;
/**
 *  清除
 */
- (void)clearPassword;
@end

NS_ASSUME_NONNULL_END
