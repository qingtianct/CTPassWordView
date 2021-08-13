//
//  ViewController.m
//  CYPWDDemo
//
//  Created by jxrs on 2021/8/12.
//

#import "ViewController.h"
#import "PageVC1.h"
#import "PageVC2.h"
@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)gotoPage1:(id)sender {
    
    PageVC1 *vc1 = [[PageVC1 alloc] init];
    vc1.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc1 animated:YES completion:nil];
}

- (IBAction)gotoPage2:(id)sender {
    PageVC2 *vc2 = [[PageVC2 alloc] init];
    vc2.hidesBottomBarWhenPushed = YES;
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc2];
    
    navi.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:navi animated:YES completion:nil];
}


@end
