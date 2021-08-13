//
//  CTRandomKeyBoard.h
//  CYPWDDemo
//
//  Created by jxrs on 2021/8/12.
//

#import <UIKit/UIKit.h>
#import "UIView+CTPasswordView.h"

NS_ASSUME_NONNULL_BEGIN

@class CTRandomKeyBoard;

static NSString *CTRandomKeyboardDeleteButtonClick = @"CTRandomKeyboardDeleteButtonClick";
static NSString *CTRandomKeyboardOkButtonClick = @"CTRandomKeyboardOkButtonClick";
static NSString *CTRandomKeyboardNumberButtonClick = @"CTRandomKeyboardNumberButtonClick";
static NSString *CTRandomKeyboardNumberKey = @"CTRandomKeyboardNumberKey";
@protocol CTRandomKeyBoardDelegate <NSObject>

@optional

/** 数字按钮点击 */
- (void)randomKeyboard:(CTRandomKeyBoard *)keyboard clickButtonNumber:(NSString *)number;
/** 删除按钮点击 */
- (void)randomKeyboardDeleteButtonClick:(CTRandomKeyBoard *)keyboard;
/** 确定按钮点击 */
- (void)randomKeyboardOKButtonClick:(CTRandomKeyBoard *)keyboard;

@end

@interface CTRandomKeyBoard : UIView
@property (nonatomic, weak) id<CTRandomKeyBoardDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
