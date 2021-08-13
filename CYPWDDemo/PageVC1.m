//
//  PageVC1.m
//  CYPWDDemo
//
//  Created by jxrs on 2021/8/12.
//

#import "PageVC1.h"
#import "CTPasswordView.h"
#import "CTPasswordViewTypeDefine.h"
@interface PageVC1 ()<CTPasswordViewDelegate>
@property(nonatomic,strong)CTPasswordView * pwView;
@property(nonatomic,strong)UILabel * titleL;
@end

@implementation PageVC1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addPWV];
}
-(void)addPWV{
    
    UIButton *closebtn = [UIButton buttonWithType:UIButtonTypeClose];
    
    closebtn.frame = CGRectMake(0, 100, 80, 30);
    [self.view addSubview:closebtn];
    [closebtn addTarget:self action:@selector(closebtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.titleL = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, CTScreenW, 30)];
    self.titleL.textColor = [UIColor blackColor];
    self.titleL.text = @"密码是：";
    [self.view addSubview:self.titleL];
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"开始输入密码" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(clickInputBtn) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 200, CTScreenW, 30);
    [self.view addSubview:btn];

}

-(void)closebtn{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)clickInputBtn{
    self.pwView = [CTPasswordView passwordViewWithKeyboardType:CTPasswordViewKeyboardTypeSystem];
    self.pwView.delegate = self;
    [self.pwView showPasswordInView:self.view];
}

- (void)passwordView:(nonnull CTPasswordView *)passwordView didFinishInput:(nonnull NSString *)password {
    NSLog(@"didFinishInput---password=====%@",password);
    self.titleL.text = [NSString stringWithFormat:@"密码是：%@",password];
}

- (void)passwordView:(nonnull CTPasswordView *)passwordView passwordTextDidChange:(nonnull NSString *)password {
    NSLog(@"passwordTextDidChange--password=====%@",password);
    self.titleL.text = [NSString stringWithFormat:@"密码是：%@",password];
}

- (void)passwordViewClickForgetPassword:(CTPasswordView *)passwordView{
//    [self.pwView hidePasswordView];
}

-(void)clickCloseBtn{
    [self.pwView hidePasswordView];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
