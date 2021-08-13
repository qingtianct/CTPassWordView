//
//  CTPasswordViewTypeDefine.h
//  CYPWDDemo
//
//  Created by jxrs on 2021/8/12.
//

#ifndef CTPasswordViewTypeDefine_h
#define CTPasswordViewTypeDefine_h

#define CTScreenBounds [UIScreen mainScreen].bounds
#define CTScreenSize [UIScreen mainScreen].bounds.size
#define CTScreenW [UIScreen mainScreen].bounds.size.width
#define CTScreenH [UIScreen mainScreen].bounds.size.height
#define ct_autoSizeScaleX ([UIScreen mainScreen].bounds.size.width / 375)
#define ct_autoSizeScaleY ([UIScreen mainScreen].bounds.size.height / 667)
#define CTKeyWindow [UIApplication sharedApplication].windows.firstObject

typedef NS_ENUM(NSUInteger, CTPasswordViewKeyboardType){
    /**
     *  自定义随机键盘
     */
    CTPasswordViewKeyboardTypeRandom                  = 1,
    /**
     *  系统键盘
     */
    CTPasswordViewKeyboardTypeSystem              = 2
};

#endif /* CTPasswordViewTypeDefine_h */
