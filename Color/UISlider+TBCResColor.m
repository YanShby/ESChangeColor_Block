//
//  UISlider+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UISlider+TBCResColor.h"
#import <objc/runtime.h>
@interface UISlider ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UISlider (TBCResColor)
#ifdef USE_BLOCK
- (TBCResColorBlock)res_minimumTrackTintColor
{
    return objc_getAssociatedObject(self, @selector(res_minimumTrackTintColor));
}

- (void)setRes_minimumTrackTintColor:(TBCResColorBlock)res_minimumTrackTintColor
{
    if (res_minimumTrackTintColor)
    {
        self.minimumTrackTintColor = res_minimumTrackTintColor();
        objc_setAssociatedObject(self, @selector(res_minimumTrackTintColor), res_minimumTrackTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_minimumTrackTintColor copy] forKey:NSStringFromSelector(@selector(setMinimumTrackTintColor:))];
    }
}

- (TBCResColorBlock)res_maximumTrackTintColor
{
    return objc_getAssociatedObject(self, @selector(res_maximumTrackTintColor));
}

- (void)setRes_maximumTrackTintColor:(TBCResColorBlock)res_maximumTrackTintColor
{
    if (res_maximumTrackTintColor)
    {
        self.maximumTrackTintColor = res_maximumTrackTintColor();
        objc_setAssociatedObject(self, @selector(res_maximumTrackTintColor), res_maximumTrackTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_maximumTrackTintColor copy] forKey:NSStringFromSelector(@selector(setMaximumTrackTintColor:))];
    }
}

- (TBCResColorBlock)res_thumbTintColor
{
    return objc_getAssociatedObject(self, @selector(res_thumbTintColor));
}

- (void)setRes_thumbTintColor:(TBCResColorBlock)res_thumbTintColor
{
    if (res_thumbTintColor)
    {
        self.thumbTintColor = res_thumbTintColor();
        objc_setAssociatedObject(self, @selector(res_thumbTintColor), res_thumbTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_thumbTintColor copy] forKey:NSStringFromSelector(@selector(setThumbTintColor:))];
    }
}
#else
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method Method1 = class_getInstanceMethod([UISlider class], @selector(setMinimumTrackTintColor:));
        Method newMethod1 = class_getInstanceMethod([UISlider class], @selector(tbc_setMinimumTrackTintColor:));
        
        Method Method2 = class_getInstanceMethod([UISlider class], @selector(setMaximumTrackTintColor:));
        Method newMethod2 = class_getInstanceMethod([UISlider class], @selector(tbc_setMaximumTrackTintColor:));
        
        Method Method3 = class_getInstanceMethod([UISlider class], @selector(setThumbTintColor:));
        Method newMethod3 = class_getInstanceMethod([UISlider class], @selector(tbc_setThumbTintColor:));
        
        method_exchangeImplementations(Method1, newMethod1);
        method_exchangeImplementations(Method2, newMethod2);
        method_exchangeImplementations(Method3, newMethod3);
    });
}


- (void)tbc_setMinimumTrackTintColor:(UIColor *)color
{
    if (color) {
        [self tbc_setMinimumTrackTintColor:color];
        [self.resColors setObject:color forKey:NSStringFromSelector(@selector(setMinimumTrackTintColor:))];
    }
}

- (void)tbc_setMaximumTrackTintColor:(UIColor *)color
{
    if (color) {
        [self tbc_setMaximumTrackTintColor:color];
        [self.resColors setObject:color forKey:NSStringFromSelector(@selector(setMaximumTrackTintColor:))];
    }
}

- (void)tbc_setThumbTintColor:(UIColor *)color
{
    if (color) {
        [self setThumbTintColor:color];
        [self.resColors setObject:color forKey:NSStringFromSelector(@selector(setThumbTintColor:))];
    }
}
#endif
@end
