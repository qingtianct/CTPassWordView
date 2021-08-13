//
//  UIView+CTPasswordView.m
//  CYPWDDemo
//
//  Created by jxrs on 2021/8/12.
//

#import "UIView+CTPasswordView.h"

@implementation UIView (CTPasswordView)

- (CGSize)ct_size
{
    return self.frame.size;
}

- (void)setCt_size:(CGSize)ct_size
{
    CGRect frame = self.frame;
    frame.size = ct_size;
    self.frame = frame;
}

- (CGFloat)ct_width
{
    return self.frame.size.width;
}

- (void)setCt_width:(CGFloat)ct_width
{
    CGRect rect = self.frame;
    rect.size.width = ct_width;
    self.frame = rect;
}

- (CGFloat)ct_height
{
    return self.frame.size.height;
}

- (void)setCt_height:(CGFloat)ct_height
{
    CGRect rect = self.frame;
    rect.size.height = ct_height;
    self.frame = rect;
}

- (CGFloat)ct_x
{
    return self.frame.origin.x;
}

- (void)setCt_x:(CGFloat)ct_x
{
    CGRect rect = self.frame;
    rect.origin.x = ct_x;
    self.frame = rect;
}

- (CGFloat)ct_y
{
    return self.frame.origin.y;
}

- (void)setCt_y:(CGFloat)ct_y
{
    CGRect rect = self.frame;
    rect.origin.y = ct_y;
    self.frame = rect;
}

- (CGFloat)ct_centerX
{
    return self.center.x;
}

- (void)setCt_centerX:(CGFloat)ct_centerX
{
    CGPoint point = self.center;
    point.x = ct_centerX;
    self.center = point;
}

- (CGFloat)ct_centerY
{
    return self.center.y;
}

- (void)setCt_centerY:(CGFloat)ct_centerY
{
    CGPoint point = self.center;
    point.y = ct_centerY;
    self.center = point;
}
@end
