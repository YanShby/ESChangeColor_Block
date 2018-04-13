//
//  UIColor+TBResColor.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/22.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>

#define USE_BLOCK 0

#ifdef USE_BLOCK
    typedef UIColor *(^TBCResColorBlock)(void);
    typedef UIImage *(^TBCResImageBlock)(void);
#else
    #define TBCResColorBlock id
    #define TBCResImageBlock id
#endif

@interface UIColor (TBResColor)
+ (TBCResColorBlock)normalColor:(UIColor *)color1 nightColor:(UIColor *)color2;
@end


@interface UIImage (TBResColor)
+ (TBCResImageBlock)normalImage:(UIImage *)image1 nightImage:(UIImage *)image2;
@end
