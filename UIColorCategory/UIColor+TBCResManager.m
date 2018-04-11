//
//  UIColor+TBCResManager.m
//  TBSResManager
//
//  Created by 振超 王 on 14/11/10.
//  Copyright (c) 2014年 振超 王. All rights reserved.
//

#import "ESThemeManager.h"
#import "UIColor+TBCColor.h"

#import "UIColor+TBCResManager.h"
#import "UIColor+IDPExtension.h"

static NSDictionary *cacheColorDic = nil;
static NSString * const faultTolerantColor = @"0xffffff";
static NSString *plistPath = nil;

#define kCPCONT @"CP_CONT"
#define kCPBGLINE @"CP_BG_LINE"
#define kCPLINKTIP @"CP_LINK_TIP"
#define kCPOTHER @"CP_OTHER"

static NSString * const CONFIG_COLOR_PATH = @"normalColor";

@implementation UIColor (TBCResManager)

+ (NSString *)contColorHexForKey:(NSString *)key
{
    return [self colorHexForKey:key
                      colorType:TBC_COLOR_CONT
                     bundleName:[NSBundle mainBundle].bundlePath];
}

+ (NSString *)bgLineColorHexForKey:(NSString *)key
{
    return [self colorHexForKey:key
                      colorType:TBC_COLOR_BGLINE
                     bundleName:[NSBundle mainBundle].bundlePath];
}

+ (NSString *)linkTipColorHexForKey:(NSString *)key
{
    return [self colorHexForKey:key
                      colorType:TBC_COLOR_LINKTIP
                     bundleName:[NSBundle mainBundle].bundlePath];
}

+ (NSString *)otherColorHexForKey:(NSString *)key
{
    return [self colorHexForKey:key
                      colorType:TBC_COLOR_OTHER
                     bundleName:[NSBundle mainBundle].bundlePath];
}

+ (NSString *)colorHexForKey:(NSString *)key
                   colorType:(TBCColorType)colorType
                  bundleName:(NSString *)bundleName
{
    if(!key || key.length <= 0)
    {
        return faultTolerantColor;
    }
    
    if(!bundleName || bundleName.length <= 0)
    {
        return faultTolerantColor;
    }
    
    NSString *colorHex = nil;
    NSBundle *bundle = [NSBundle mainBundle];
    
    
    if(bundle)
    {
        colorHex = [self colorHexForKey:key
                              colorType:colorType
                               inBundle:bundle];
    }
    if (!colorHex)
    {
        NSBundle *defaultBundle = [NSBundle mainBundle];
        colorHex = [self colorHexForKey:key
                              colorType:colorType
                               inBundle:defaultBundle];
        if (colorHex == nil) {
            colorHex = [self colorHexInDefaultForKey:key
                                           colorType:colorType];
        }
    }
    if (!colorHex)
    {
        colorHex = faultTolerantColor;
    }
    return colorHex;

}

+ (NSString *)colorHexInDefaultForKey:(NSString *)key
                            colorType:(TBCColorType)colorType
{
    NSString *colorHex = nil;
    
    NSString *colorFile = nil;
    if ([ESThemeManager sharedInstance].isNight)
    {
        colorFile = @"nightColor";
    }
    else
    {
        colorFile = @"normalColor";
    }
    
    NSString *path = [[NSBundle mainBundle] pathForResource:colorFile ofType:@"plist"];
    NSDictionary *colorDic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSDictionary *colorPool = [self colorsInDic:colorDic type:colorType];
    
    if (colorPool && colorPool.count > 0)
    {
        colorHex = [colorPool objectForKey:key];
    }
    
   return colorHex;
}

+ (NSString *)colorHexForKey:(NSString *)key
                   colorType:(TBCColorType)colorType
                    inBundle:(NSBundle *)bundle
{
    NSDictionary *colorDic = [self getColorDicFromBundle:bundle];
    
    NSDictionary *colorPool = [self colorsInDic:colorDic type:colorType];
    
    if (colorPool && colorPool.count > 0)
    {
        NSString *colorHex = [colorPool objectForKey:key];
        return colorHex;
    }
    return nil;
}

+ (NSDictionary *)colorsInDic:(NSDictionary *)colorDic type:(TBCColorType)colorType
{
    NSDictionary *colorPool = nil;
    switch (colorType)
    {
        case TBC_COLOR_CONT:
        {
            colorPool = [colorDic objectForKey:kCPCONT];
            break;
        }
        case TBC_COLOR_BGLINE:
        {
            colorPool = [colorDic objectForKey:kCPBGLINE];
            break;
        }
        case TBC_COLOR_LINKTIP:
        {
            colorPool = [colorDic objectForKey:kCPLINKTIP];
            break;
        }
        case TBC_COLOR_OTHER:
        {
            colorPool = [colorDic objectForKey:kCPOTHER];
            break;
        }
        default:
            break;
    }
    return colorPool;
}

//================   以上为HexString区域 =================//

+ (UIColor *)contColorForKey:(NSString *)key
{
    UIColor *color = [self colorForKey:key
                             colorType:TBC_COLOR_CONT
                            bundleName:[NSBundle mainBundle].bundlePath];
    color.needColorChange = YES;
    color.colorKey = key;
    color.colorType = TBC_COLOR_CONT;
    color.colorAlpha = 1.f;
    return color;
}

+ (UIColor *)contColorForKey:(NSString *)key needsNightMode:(BOOL)need {
    NSString *bundleName = [NSBundle mainBundle].bundlePath;
    UIColor *color = [self colorForKey:key
                             colorType:TBC_COLOR_CONT
                            bundleName:bundleName];
    color.needColorChange = need;
    color.colorKey = key;
    color.colorType = TBC_COLOR_CONT;
    color.colorAlpha = 1.f;
    return color;
}

+ (UIColor *)contColorForKeyWithAlpha:(NSString *)key dayModelAlpha:(CGFloat)dayAlpha nightModelAlpha:(CGFloat)nightAlpha
{
    NSString *bundleName = [NSBundle mainBundle].bundlePath;
    NSString *colorHex = [self colorHexForKey:key
                                    colorType:TBC_COLOR_CONT
                                   bundleName:bundleName];
    
    if ([@"DefaultRes" isEqualToString:bundleName])
    {
        return [UIColor colourWithHexString:colorHex alpha:dayAlpha];
    }
    else
    {
        return [UIColor colourWithHexString:colorHex alpha:nightAlpha];
    }
}

+ (UIColor *)bgLineColorForKeyWithAlpha:(NSString *)key dayModelAlpha:(CGFloat)dayAlpha nightModelAlpha:(CGFloat)nightAlpha
{
    NSString *bundleName = [NSBundle mainBundle].bundlePath;
    NSString *colorHex = [self colorHexForKey:key
                                    colorType:TBC_COLOR_BGLINE
                                   bundleName:bundleName];
    
    if ([@"DefaultRes" isEqualToString:bundleName])
    {
        return [UIColor colourWithHexString:colorHex alpha:dayAlpha];
    }
    else
    {
        return [UIColor colourWithHexString:colorHex alpha:nightAlpha];
    }
}

+ (UIColor *)bgLineColorForKey:(NSString *)key
{
    UIColor *color = [self colorForKey:key
                             colorType:TBC_COLOR_BGLINE
                            bundleName:[NSBundle mainBundle].bundlePath];
    color.needColorChange = YES;
    color.colorKey = key;
    color.colorType = TBC_COLOR_BGLINE;
    color.colorAlpha = 1.f;
    return color;
}
+ (UIColor *)bgLineColorForKey:(NSString *)key needsNightMode:(BOOL)need {
    NSString *bundleName = [NSBundle mainBundle].bundlePath;
    return [self colorForKey:key
                   colorType:TBC_COLOR_BGLINE
                  bundleName:bundleName];
}

+ (UIColor *)linkTipColorForKey:(NSString *)key
{
    UIColor *color = [self colorForKey:key
                             colorType:TBC_COLOR_LINKTIP
                            bundleName:[NSBundle mainBundle].bundlePath];
    color.needColorChange = YES;
    color.colorKey = key;
    color.colorType = TBC_COLOR_LINKTIP;
    color.colorAlpha = 1.f;
    return color;
}
+ (UIColor *)linkTipColorForKey:(NSString *)key needsNightMode:(BOOL)need {
    NSString *bundleName = [NSBundle mainBundle].bundlePath;
    return [self colorForKey:key
                   colorType:TBC_COLOR_LINKTIP
                  bundleName:bundleName];
}

+ (UIColor *)otherColorForKey:(NSString *)key
{
    UIColor *color = [self colorForKey:key
                             colorType:TBC_COLOR_OTHER
                            bundleName:[NSBundle mainBundle].bundlePath];
    color.needColorChange = YES;
    color.colorKey = key;
    color.colorType = TBC_COLOR_OTHER;
    color.colorAlpha = 1.f;
    return color;
}
+ (UIColor *)otherColorForKey:(NSString *)key needsNightMode:(BOOL)need {
    NSString *bundleName = [NSBundle mainBundle].bundlePath;
    return [self colorForKey:key
                   colorType:TBC_COLOR_OTHER
                  bundleName:bundleName];
}

+ (UIColor *)colorForKey:(NSString *)key
               colorType:(TBCColorType)colorType
                   alpha:(CGFloat)alpha
{
    UIColor *color = [self colorForKey:key
                             colorType:colorType
                                 alpha:alpha
                          isUseDefault:NO];
    color.needColorChange = YES;
    color.colorKey = key;
    color.colorType = colorType;
    color.colorAlpha = alpha;
    return color;
}

+ (UIColor *)colorForKey:(NSString *)key
               colorType:(TBCColorType)colorType
                   alpha:(CGFloat)alpha
            isUseDefault:(BOOL)isUseDefault
{
    NSString *colorHex = nil;
    if (isUseDefault)
    {
        colorHex = [self colorHexForKey:key
                              colorType:colorType
                             bundleName:[NSBundle mainBundle].bundlePath];
    }
    else
    {
        colorHex = [self colorHexForKey:key
                              colorType:colorType
                             bundleName:[NSBundle mainBundle].bundlePath];
    }
    return [UIColor colourWithHexString:colorHex alpha:alpha];
}

+ (UIColor *)nightColorForKey:(NSString *)key
                    colorType:(TBCColorType)colorType
                        alpha:(CGFloat)alpha
{
    NSString *colorHex = [self colorHexForKey:key
                                    colorType:colorType
                                   bundleName:[NSBundle mainBundle].bundlePath];
    return [UIColor colourWithHexString:colorHex alpha:alpha];
}

+ (UIColor *)colorForKey:(NSString *)key
               colorType:(TBCColorType)colorType
              bundleName:(NSString *)bundleName
{
    NSString *colorHex = [self colorHexForKey:key
                                    colorType:colorType
                                   bundleName:bundleName];
    return [UIColor colourWithHexString:colorHex];
}

#pragma mark -
#pragma mark - full color

/**
 *  通过颜色库中全称获取相应的颜色
 *
 *  @param key 全称
 *
 *  @return 颜色
 */
+ (UIColor *)colorForFullKey:(NSString *)fullKey defaultColor:(UIColor *)defaultColor
{
    return [self colorForFullKey:fullKey defaultColor:defaultColor alpha:1.0f];
}

+ (UIColor *)colorForFullKey:(NSString *)fullKey defaultColor:(UIColor *)defaultColor alpha:(CGFloat)alpha
{
    if(!fullKey || fullKey.length <= 0)
    {
        return [self useDefaultColor:defaultColor alpha:alpha];   
    }
    
    fullKey = [fullKey uppercaseString];
    
    NSString *bundleName = [NSBundle mainBundle].bundlePath;
    
    if(!bundleName || bundleName.length <= 0)
    {
        return [self useDefaultColor:defaultColor alpha:alpha];
    }
    
    NSString *colorHex = nil;
    NSBundle *bundle = [NSBundle mainBundle];
    
    if(bundle)
    {
        colorHex = [self colorHexForFullKey:fullKey inBundle:bundle];
    }
    
    if (!colorHex)
    {
        NSBundle *defaultBundle = [NSBundle mainBundle];
        colorHex = [self colorHexForFullKey:fullKey inBundle:defaultBundle];
    }
    
    if (!colorHex)
    {
        return [self useDefaultColor:defaultColor alpha:alpha];
    }
    return [UIColor colourWithHexString:colorHex alpha:alpha];
}

+ (UIColor *)useDefaultColor:(UIColor *)defaultColor alpha:(CGFloat)alpha
{
    if (nil == defaultColor)
    {
        return  [UIColor colourWithHexString:faultTolerantColor alpha:alpha];
    }
    
    return defaultColor;
}

+ (NSString *)colorHexForFullKey:(NSString *)fullKey
                    inBundle:(NSBundle *)bundle
{
    NSDictionary *colorDic = [self getColorDicFromBundle:bundle];
    
    NSDictionary *colorPool = [self colorsInDic:colorDic colorKey:fullKey];
    
    if (colorPool && colorPool.count > 0)
    {
        NSString *colorKey = [[fullKey componentsSeparatedByString:@"_"] lastObject];
        
        NSString *colorHex = [colorPool objectForKey:colorKey];
        
        return colorHex;
    }
    return nil;
}

+ (NSDictionary *)colorsInDic:(NSDictionary *)colorDic colorKey:(NSString *)colorKey
{
    if ([colorKey hasPrefix:kCPCONT])
    {
        return [colorDic objectForKey:kCPCONT];
    }
    else if ([colorKey hasPrefix:kCPBGLINE])
    {
        return [colorDic objectForKey:kCPBGLINE];
    }
    else if ([colorKey hasPrefix:kCPLINKTIP])
    {
        return [colorDic objectForKey:kCPLINKTIP];
    }
    else if ([colorKey hasPrefix:kCPOTHER])
    {
        return [colorDic objectForKey:kCPOTHER];
    }
    else
    {
        return nil;
    }
}


#pragma mark -
+ (NSDictionary *)getColorDicFromBundle:(NSBundle *)bundle
{
    NSDictionary *colorDic = nil;
    
    NSString *colorFile = nil;
    if ([ESThemeManager sharedInstance].isNight)
    {
        colorFile = @"nightColor";
    }
    else
    {
        colorFile = @"normalColor";
    }

    plistPath = [[bundle pathForResource:colorFile ofType:@"plist"] copy];
    colorDic = [NSDictionary dictionaryWithContentsOfFile:plistPath];

    return colorDic;
}

+ (UIColor *)colorFromColor:(UIColor *)color withAlpha:(CGFloat)alpha
{
    CGFloat red = 0.0;
    CGFloat green = 0.0;
    CGFloat blue = 0.0;
    CGFloat oldAlpha = 0.0;
    [color getRed:&red green:&green blue:&blue alpha:&oldAlpha];
    UIColor *newColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    return newColor;
}
@end
