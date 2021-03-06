//
//  CTPasswordView.m
//  CYPWDDemo
//
//  Created by jxrs on 2021/8/12.
//

#import "CTPasswordView.h"

#import "CTPasswordInputView.h"
#import "CTRandomKeyBoard.h"
#import "UIView+CTPasswordView.h"
#import "UIImage+CTPasswordView.h"
#import "UIColor+CTPasswordView.h"

#define kPasswordLenght 6

@interface CTPasswordView ()<CTRandomKeyBoardDelegate , CTPasswordInputViewDelegate , UIAlertViewDelegate>

/**
 *  背景视图
 */
@property (nonatomic , strong) UIView *backgroundView;
/**
 *  密码输入视图容器视图
 */
@property (nonatomic , strong) UIView  *inputContainerView;
/**
 *  密码输入视图
 */
@property (nonatomic , strong) CTPasswordInputView  *passwordInputView;
/**
 *  随机键盘
 */
@property (nonatomic , strong) CTRandomKeyBoard  *randomKeyboard;
/**
 *  输入的密码
 */
@property (nonatomic , strong) NSString  *password;
/**
 *  密码数组
 */
@property (nonatomic , strong) NSMutableArray  *passwordNumberS;
/**
 *  忘记密码label
 */
@property (nonatomic , weak) UILabel *forgetPasswordLabel;
@property (nonatomic , assign ) CTPasswordViewKeyboardType keyboardType;

@end


@implementation CTPasswordView

#pragma mark    -   set / get

/**
 *  懒加载成员属性
 */
- (NSMutableArray *)passwordNumberS
{
    if (_passwordNumberS == nil) {
        _passwordNumberS = [NSMutableArray array];
    }
    
    return _passwordNumberS;
}

- (void)setKeyboardType:(CTPasswordViewKeyboardType)keyboardType
{
    _keyboardType = keyboardType;
    switch (keyboardType) {
        case CTPasswordViewKeyboardTypeRandom:
        {
            self.randomKeyboard.hidden = NO;
            [self.passwordInputView resignFirstResponder];
            self.passwordInputView.userInteractionEnabled = NO;
        }
            break;
        case CTPasswordViewKeyboardTypeSystem:
        {
            self.randomKeyboard.hidden = YES;
            [self.passwordInputView becomeFirstResponder];
            self.passwordInputView.userInteractionEnabled = YES;
        }
            break;
            
        default:
            break;
    }
}

#pragma mark    -   initial

- (void)awakeFromNib
{
    [super awakeFromNib];
    [self initial];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initial];
    }
    return self;
}

- (instancetype)initWithKeyboardType:(CTPasswordViewKeyboardType)keyboardType
{
    if (self = [super init]) {
        self.keyboardType = keyboardType;
        [self initial];
    }
    return self;
}

/**
 *  初始化
 */
- (void)initial
{
    self.password = [NSString string];
    self.backgroundView = ({
        UIView *tempView = [[UIView alloc] init];
        tempView.backgroundColor = [UIColor blackColor];
        tempView.alpha = 0.0;
        [self addSubview:tempView];
        [tempView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickCloseButton)]];
        tempView;
    });
    
    self.inputContainerView = ({
        UIView *tempView = [[UIView alloc] init];
        tempView.backgroundColor = [UIColor colorWithHexString:@"f3f3f5"];
        [self addSubview:tempView];
        tempView.frame = CGRectMake(0, CTScreenH, CTScreenW, CTScreenW * 0.6 + 224 * ct_autoSizeScaleY);
        tempView;
    });
    
    UILabel *titleLabel = ({
        UILabel *tempLabel = [[UILabel alloc] init];
        tempLabel.backgroundColor = [UIColor clearColor];
        tempLabel.text = @"输入密码";
        tempLabel.numberOfLines = 1;
        tempLabel.textColor = [UIColor blackColor];
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.font = [UIFont systemFontOfSize:18];
        [tempLabel sizeToFit];
        tempLabel.ct_centerX = CTScreenW * 0.5;
        tempLabel.ct_centerY = 45 * ct_autoSizeScaleY * 0.5;
        tempLabel;
    });
    [self.inputContainerView addSubview:titleLabel];
    
    UIView *separateView = ({
        UIView *tempView = [[UIView alloc] init];
        tempView.backgroundColor = [UIColor clearColor];
        tempView.frame = CGRectMake(0, 45 * ct_autoSizeScaleY, CTScreenW, 0.5);
        tempView.backgroundColor = [UIColor colorWithHexString:@"ccccce"];
        tempView;
    });
    [self.inputContainerView addSubview:separateView];
    
    UIButton *closeButton = ({
        UIButton *button = [[UIButton alloc] init];
        
        NSString *bundlePath = [[NSBundle bundleForClass:[self class]].resourcePath
                                stringByAppendingPathComponent:@"/CTPassword.bundle"];
        NSBundle *resource_bundle = [NSBundle bundleWithPath:bundlePath];
        UIImage *image = [UIImage imageNamed:@"payment_shutdown"
                                    inBundle:resource_bundle
               compatibleWithTraitCollection:nil];
        
       
        
//        UIImage *image = [UIImage imageNamed:@"payment_shutdown"];
        [button setImage:image forState:UIControlStateNormal];
        
        button.ct_x = 0;
        button.ct_y = 0;
        button.ct_width = 50;
        button.ct_height = 45 * ct_autoSizeScaleY;
        [button addTarget:self action:@selector(clickCloseButton) forControlEvents:UIControlEventTouchUpInside];
        button;
    });
    [self.inputContainerView addSubview:closeButton];

    self.passwordInputView = ({
        CTPasswordInputView *passwordInputView = [CTPasswordInputView passwordInputViewWithPasswordLength:kPasswordLenght];
        passwordInputView.userInteractionEnabled = NO;
        passwordInputView.gridLineColor = [UIColor colorWithHexString:@"ccccce"];
        passwordInputView.gridLineWidth = 1;
        passwordInputView.dotColor = [UIColor colorWithHexString:@"ccccce"];
        passwordInputView.dotWidth = 12;
        CGFloat gridWidth = 54 * ct_autoSizeScaleX;
        passwordInputView.ct_width = kPasswordLenght * gridWidth;
        passwordInputView.ct_height = gridWidth;
        passwordInputView.ct_centerX = CTScreenW * 0.5;
        passwordInputView.ct_y = 72 * ct_autoSizeScaleY;
        passwordInputView.delegate = self;
        passwordInputView;
    });
    [self.inputContainerView addSubview:self.passwordInputView];
    
    UILabel *forgetPasswordLabel = ({
        UILabel *tempLabel = [[UILabel alloc] init];
        tempLabel.backgroundColor = [UIColor clearColor];
        tempLabel.text = @"忘记密码?";
        tempLabel.userInteractionEnabled = YES;
        tempLabel.numberOfLines = 1;
        tempLabel.textColor = [UIColor colorWithHexString:@"55d5fa"];
        tempLabel.textAlignment = NSTextAlignmentCenter;
        tempLabel.font = [UIFont systemFontOfSize:13];
        tempLabel.ct_height = 40;
        tempLabel.ct_width = 96;
    
        tempLabel.ct_y = CGRectGetMaxY(self.passwordInputView.frame) + 3;
        tempLabel.ct_x = (CTScreenW - tempLabel.ct_width)/2.0;
        [tempLabel addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickForgetPasswordLabel)]];
        tempLabel;
    });
    self.forgetPasswordLabel = forgetPasswordLabel;
    [self.inputContainerView addSubview:forgetPasswordLabel];
    
    self.randomKeyboard = ({
        CTRandomKeyBoard *randomKeyboard = [[CTRandomKeyBoard alloc] init];
        randomKeyboard.delegate = self;
        randomKeyboard.ct_width = CTScreenW;
        randomKeyboard.ct_height = CTScreenW * 0.6;
        randomKeyboard.ct_x = 0;
        randomKeyboard.ct_y = 224 * ct_autoSizeScaleY;
        [self.inputContainerView addSubview:randomKeyboard];
        randomKeyboard;
    });
    
    self.keyboardType = self.keyboardType;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundView.frame = self.bounds;
}

#pragma mark    -   private method

/**
 *  退出
 */
- (void)clickCloseButton
{
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:@"是否确定退出" delegate:self cancelButtonTitle:@"否" otherButtonTitles:@"是", nil];
//
//    [alertView show];
    if ([self.delegate respondsToSelector:@selector(clickCloseBtn)]) {
        [self.delegate clickCloseBtn];
    }
    
}

/**
 *  点击忘记密码
 */
- (void)clickForgetPasswordLabel
{
    if ([self.delegate respondsToSelector:@selector(passwordViewClickForgetPassword:)]) {
        [self.delegate passwordViewClickForgetPassword:self];
    }
}

#pragma mark    -   XLRandomKeyboardDelegate method

/** 数字按钮点击 */
- (void)randomKeyboard:(CTRandomKeyBoard *)keyboard clickButtonNumber:(NSString *)number
{
    if (self.passwordNumberS.count < kPasswordLenght) {
        [self.passwordNumberS addObject:number];
        NSMutableString *password = [NSMutableString string];
        for ( int i = 0 ; i < self.passwordNumberS.count; i ++) {
            [password appendString:self.passwordNumberS[i]];
        }
        if ([self.delegate respondsToSelector:@selector(passwordView:passwordTextDidChange:)]) {
            [self.delegate passwordView:self passwordTextDidChange:password];
        }
        
        if (self.passwordNumberS.count == kPasswordLenght) {
            if ([self.delegate respondsToSelector:@selector(passwordView:didFinishInput:)]) {
                [self.delegate passwordView:self didFinishInput:password];
            }
        }
    }
    self.passwordInputView.inputCount = self.passwordNumberS.count;
}

/** 删除按钮点击 */
- (void)randomKeyboardDeleteButtonClick:(CTRandomKeyBoard *)keyboard
{
    [self.passwordNumberS removeLastObject];
    self.passwordInputView.inputCount = self.passwordNumberS.count;
}

/** 确定按钮点击 */
- (void)randomKeyboardOKButtonClick:(CTRandomKeyBoard *)keyboard
{
    [self hidePasswordView];
}

#pragma mark    -   UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
        {
        }
            break;
        case 1:
        {
            [self hidePasswordView];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark    -   XLPasswordInputViewDelegate

- (void)passwordInputView:(CTPasswordInputView *)passwordInputView inputPassword:(NSString *)password
{
    if (password.length <= kPasswordLenght) {
        if ([self.delegate respondsToSelector:@selector(passwordView:passwordTextDidChange:)]) {
            [self.delegate passwordView:self passwordTextDidChange:password];
        }
    }
    if (password.length  == kPasswordLenght) {
        if ([self.delegate respondsToSelector:@selector(passwordView:didFinishInput:)]) {
            [self.delegate passwordView:self didFinishInput:password];
        }
    }
}


#pragma mark    -   public method

+ (instancetype)passwordView
{
    return [self passwordViewWithKeyboardType:CTPasswordViewKeyboardTypeRandom];
}

+ (instancetype)passwordViewWithKeyboardType:(CTPasswordViewKeyboardType)keyboardType
{
    CTPasswordView *password = [[self alloc] initWithKeyboardType:keyboardType];
    return password;
}

/**
 *  展示
 *
 *  @param view 添加到的目的视图
 */
- (void)showPasswordInView:(UIView *)view
{
    self.frame = CTKeyWindow.bounds;
    if (view == nil) {
        [CTKeyWindow addSubview:self];
    } else {
        [view addSubview:self];
    }
    
    [self.passwordInputView becomeFirstResponder];
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundView.alpha = 0.4;
        self.inputContainerView.ct_y = CTScreenH - self.inputContainerView.ct_height;
    } completion:^(BOOL finished) {
        
    }];
}

- (void)showPasswordWithNaviInView:(UIView *)view withNaviHeight:(CGFloat)height
{
    self.frame = CTKeyWindow.bounds;
    if (view == nil) {
        [CTKeyWindow addSubview:self];
    } else {
        self.frame = view.bounds;
        [view addSubview:self];
    }
    [self.passwordInputView becomeFirstResponder];
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundView.alpha = 0.4;
        self.inputContainerView.ct_y = CTScreenH - height - self.inputContainerView.ct_height;
    } completion:^(BOOL finished) {
        
    }];
}

/**
 *  隐藏
 */
- (void)hidePasswordView
{
    [self.passwordInputView resignFirstResponder];
    [UIView animateWithDuration:0.25 animations:^{
        self.backgroundView.alpha = 0.0;
        self.inputContainerView.ct_y = CTScreenH;
    } completion:^(BOOL finished) {
        self.backgroundView = nil;
        [self removeFromSuperview];
    }];
}

/**
 *  清除
 */
- (void)clearPassword
{
    [self.passwordInputView clearPassword];
}


@end
