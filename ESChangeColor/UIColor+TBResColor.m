//
//  UIColor+TBResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/22.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UIColor+TBResColor.h"
#import "ESThemeManager.h"

@implementation UIColor (TBResColor)
+ (TBCResColorBlock)normalColor:(UIColor *)color1 nightColor:(UIColor *)color2
{
    TBCResColorBlock colorBlock = ^(){
        if ([ESThemeManager sharedInstance].isNight)
        {
            return color2;
        }
        else
        {
            return color1;
        }
    };
    
    return [colorBlock copy];

}
@end

@implementation UIImage (TBResColor)

+ (TBCResImageBlock)normalImage:(UIImage *)image1 nightImage:(UIImage *)image2
{
    TBCResImageBlock imageBlock = ^(){
        if ([ESThemeManager sharedInstance].isNight)
        {
            return image2;
        }
        else
        {
            return image1;
        }
    };
    
    return [imageBlock copy];
}
@end
