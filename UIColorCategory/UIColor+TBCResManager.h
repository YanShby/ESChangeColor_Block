//
//  UIColor+TBCResManager.h
//  TBSResManager
//
//  Created by 振超 王 on 14/11/10.
//  Copyright (c) 2014年 振超 王. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, TBCColorType) {
    TBC_COLOR_CONT      = 0,    //cont类型颜色
    TBC_COLOR_BGLINE    = 1,    //bgline类型颜色
    TBC_COLOR_LINKTIP   = 2,    //linktip类型颜色
    TBC_COLOR_OTHER     = 3     //other类型颜色
};

@interface UIColor (TBCResManager)

//获取cont类型色值
+ (NSString *)contColorHexForKey:(NSString *)key;
//获取bgLine类型色值
+ (NSString *)bgLineColorHexForKey:(NSString *)key;
//获取linkTip类型色值
+ (NSString *)linkTipColorHexForKey:(NSString *)key;
//获取other类型色值
+ (NSString *)otherColorHexForKey:(NSString *)key;

//调用cont类型颜色
+ (UIColor *)contColorForKey:(NSString *)key;
+ (UIColor *)contColorForKey:(NSString *)key needsNightMode:(BOOL)need;
//调用bgLine类型颜色
+ (UIColor *)bgLineColorForKey:(NSString *)key;
+ (UIColor *)bgLineColorForKey:(NSString *)key needsNightMode:(BOOL)need;
//调用linkTip类型颜色
+ (UIColor *)linkTipColorForKey:(NSString *)key;
+ (UIColor *)linkTipColorForKey:(NSString *)key needsNightMode:(BOOL)need;
//调用other类型颜色
+ (UIColor *)otherColorForKey:(NSString *)key;
+ (UIColor *)otherColorForKey:(NSString *)key needsNightMode:(BOOL)need;

//调用cont类型颜色，并设置alpha值
+ (UIColor *)contColorForKeyWithAlpha:(NSString *)key dayModelAlpha:(CGFloat)dayAlpha nightModelAlpha:(CGFloat)nightAlpha;

//调用bgLine类型颜色，并设置alpha值
+ (UIColor *)bgLineColorForKeyWithAlpha:(NSString *)key dayModelAlpha:(CGFloat)dayAlpha nightModelAlpha:(CGFloat)nightAlpha;

//调用某类型的颜色，并传入alpha值
+ (UIColor *)colorForKey:(NSString *)key
               colorType:(TBCColorType)colorType
                   alpha:(CGFloat)alpha;
//isisUseDefault 是否只使用默认配色
+ (UIColor *)colorForKey:(NSString *)key
               colorType:(TBCColorType)colorType
                   alpha:(CGFloat)alpha
            isUseDefault:(BOOL)isUseDefault;

//只使用夜间模式配色
+ (UIColor *)nightColorForKey:(NSString *)key
                    colorType:(TBCColorType)colorType
                        alpha:(CGFloat)alpha;

+ (void)clearColorCache;

/**
 *  通过颜色库中全称获取相应的颜色
 *
 *  @param key 全称
 *
 *  @return 颜色
 */
+ (UIColor *)colorForFullKey:(NSString *)fullKey defaultColor:(UIColor *)defaultColor;

/**
 *  通过颜色库中全称获取相应的颜色
 *
 *  @param fullKey 全称
 *  @param alpha   透明度
 *
 *  @return 颜色
 */
+ (UIColor *)colorForFullKey:(NSString *)fullKey defaultColor:(UIColor *)defaultColor alpha:(CGFloat)alpha;
/*
 *根据已知颜色获取其不同透明度的颜色
 */
+ (UIColor *)colorFromColor:(UIColor *)color withAlpha:(CGFloat)alpha;

@end
