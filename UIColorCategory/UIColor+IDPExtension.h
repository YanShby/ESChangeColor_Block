//
//
//  UIColor+IDPExtension.h
//  IDP
//
//  Created by douj on 13-3-6.
//  Copyright (c) 2012年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
/*!
 @brief 扩充UIColor方法
 */
@interface UIColor (IDPExtension)
/*!
 @brief The model of a color space.
 */
@property (nonatomic, readonly) CGColorSpaceModel colorSpaceModel;
/*!
 @brief can Provide RGB Components, if not assert!
 */
@property (nonatomic, readonly) BOOL canProvideRGBComponents;
/*!
 @brief red color value
 @attention Only valid if canProvideRGBComponents is YES
 */
@property (nonatomic, readonly) CGFloat red;
/*!
 @brief green color value
 @attention Only valid if canProvideRGBComponents is YES
 */
@property (nonatomic, readonly) CGFloat green;
/*!
 @brief blue color value
 @attention Only valid if canProvideRGBComponents is YES
 */
@property (nonatomic, readonly) CGFloat blue;
/*!
 @brief white color value
 @attention Only valid if colorSpaceModel == kCGColorSpaceModelMonochrome
 */
@property (nonatomic, readonly) CGFloat white;
/*!
 @brief alpha value
 */
@property (nonatomic, readonly) CGFloat alpha;
/*!
 @brief rgbHex color value
 */
@property (nonatomic, readonly) UInt32 rgbHex;
/*!
 @brief get The model of a color space.
 */
- (NSString *)colorSpaceString;
/*!
 @brief get RGBA Components
 @attention Must be an RGB color to use -arrayFromRGBAComponents
 @return NSArray
 */
- (NSArray *)arrayFromRGBAComponents;

/*!
 @brief Set color
 
 @param r red
 @param g green
 @param b blue
 @param a alpha
 
 @return BOOL if success return YES
 */
- (BOOL)red:(CGFloat *)r green:(CGFloat *)g blue:(CGFloat *)b alpha:(CGFloat *)a;
/*!
 @brief 获取颜色亮度映射
 @attention Must be a RGB color to use arithmatic operations
 @discussion see http://en.wikipedia.org/wiki/Luma_(video)
 @code
 Y = 0.2126 R + 0.7152 G + 0.0722 B
 @endcode
 @return UIColor
 */
- (UIColor *)colorByLuminanceMapping;

/*!
 @brief 获取各个颜色分量乘积
 @discussion 颜色会变暗
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *)colorByMultiplyingByRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
/*!
 @brief 获取各个颜色分量之和之后的颜色
 @discussion 颜色会变亮
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *)       colorByAddingRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
/*!
 @brief 提亮各个颜色分量之后的颜色
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *) colorByLighteningToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
/*!
 @brief 暗化各个颜色分量之后的颜色
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *)  colorByDarkeningToRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;

/*!
 @brief 获取各个颜色分量与f乘积之后的颜色
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *)colorByMultiplyingBy:(CGFloat)f;
/*!
 @brief 获取各个颜色分量与f之和之后的颜色
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *)       colorByAdding:(CGFloat)f;
/*!
 @brief 提亮各个颜色分量之后的颜色
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *) colorByLighteningTo:(CGFloat)f;
/*!
 @brief 暗化各个颜色分量之后的颜色
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *)  colorByDarkeningTo:(CGFloat)f;
/*!
 @brief 获取两个颜色各个分量乘积的颜色值
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *)colorByMultiplyingByColor:(UIColor *)color;
/*!
 @brief 获取两个颜色各个分量之和
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *)       colorByAddingColor:(UIColor *)color;
/*!
 @brief 提亮颜色至输入的颜色
 @discussion 颜色会变亮
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *) colorByLighteningToColor:(UIColor *)color;
/*!
 @brief 暗化各个颜色分量乘积至输入颜色
 @discussion 颜色会变暗
 @attention Must be a RGB color to use arithmatic operations
 @return UIColor
 */
- (UIColor *)  colorByDarkeningToColor:(UIColor *)color;

/*!
 @brief 获取颜色值NSString描述
 @attention Must be an RGB color to use -stringFromColor

 @return NSString
 */
- (NSString *)stringFromColor;
/*!
 @brief 获取颜色值16进制描述
 
 @return NSString
 */
- (NSString *)hexStringFromColor;
/*!
 @brief 随机生成一种颜色
 
 @return UIColor
 */
+ (UIColor *)randomColor;
/*!
 @brief 根据16进制颜色值生成UIColor对象，alpha取1.0
 
 @param hex 色值 eg: 0xffffff
 
 @return UIColor
 */
+ (UIColor *)colorWithRGBHex:(UInt32)hex;
+ (UIColor *)colorWithRGBHex:(UInt32)hex alpha:(CGFloat)alpha;
//+ (UIColor *)colourWithHexString:(NSString *)stringToConvert;
//+ (UIColor *)colourWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;
/*!
 @brief 根据16进制颜色值, alpha生成UIColor对象
 
 @param hex   色值 eg: 0xffffff
 @param alpha [0, 1.0]
 
 @return UIColor
 */
+ (UIColor *)colourWithRGBHex:(UInt32)hex alpha:(CGFloat)alpha;
/*!
 @brief 根据NSString颜色值生成UIColor对象，alpha取1.0
 
 @param stringToConvert 色值 eg: 0xffffff
 
 @return UIColor
 */
+ (UIColor *)colourWithHexString:(NSString *)stringToConvert;
/*!
 @brief 根据NSString颜色值, alpha生成UIColor对象
 
 @param stringToConvert   色值 eg: 0xffffff
 @param alpha [0, 1.0]
 
 @return UIColor
 */
+ (UIColor *)colourWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;
@end
