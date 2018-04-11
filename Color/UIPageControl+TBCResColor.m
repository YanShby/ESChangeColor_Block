//
//  UIPageControl+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UIPageControl+TBCResColor.h"
#import <objc/runtime.h>

@interface UIPageControl ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UIPageControl (TBCResColor)
#ifdef USE_BLOCK
- (TBCResColorBlock)res_pageIndicatorTintColor
{
    return objc_getAssociatedObject(self, @selector(res_pageIndicatorTintColor));
}

- (void)setRes_pageIndicatorTintColor:(TBCResColorBlock)res_pageIndicatorTintColor
{
    if (res_pageIndicatorTintColor)
    {
        self.pageIndicatorTintColor = res_pageIndicatorTintColor();
        objc_setAssociatedObject(self, @selector(res_pageIndicatorTintColor), res_pageIndicatorTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_pageIndicatorTintColor copy] forKey:NSStringFromSelector(@selector(setPageIndicatorTintColor:))];
    }
}

- (TBCResColorBlock)res_currentPageIndicatorTintColor
{
    return objc_getAssociatedObject(self, @selector(res_currentPageIndicatorTintColor));
}

- (void)setRes_currentPageIndicatorTintColor:(TBCResColorBlock)res_currentPageIndicatorTintColor
{
    if (res_currentPageIndicatorTintColor)
    {
        self.currentPageIndicatorTintColor = res_currentPageIndicatorTintColor();
        objc_setAssociatedObject(self, @selector(res_currentPageIndicatorTintColor), res_currentPageIndicatorTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_currentPageIndicatorTintColor copy] forKey:NSStringFromSelector(@selector(setCurrentPageIndicatorTintColor:))];
    }
}
#else
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method Method1 = class_getInstanceMethod([UIPageControl class], @selector(setPageIndicatorTintColor:));
        Method newMethod1 = class_getInstanceMethod([UIPageControl class], @selector(tbc_setPageIndicatorTintColor:));
        
        Method Method2 = class_getInstanceMethod([UIPageControl class], @selector(setCurrentPageIndicatorTintColor:));
        Method newMethod2 = class_getInstanceMethod([UIPageControl class], @selector(tbc_setCurrentPageIndicatorTintColor:));
        
        method_exchangeImplementations(Method1, newMethod1);
        method_exchangeImplementations(Method2, newMethod2);
    });
}

- (void)tbc_setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor
{
    if (pageIndicatorTintColor) {
        [self tbc_setPageIndicatorTintColor:pageIndicatorTintColor];
        [self.resColors setObject:pageIndicatorTintColor forKey:NSStringFromSelector(@selector(setPageIndicatorTintColor:))];
    }
}

- (void)tbc_setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor
{
    if (currentPageIndicatorTintColor) {
        [self tbc_setCurrentPageIndicatorTintColor:currentPageIndicatorTintColor];
        [self.resColors setObject:currentPageIndicatorTintColor forKey:NSStringFromSelector(@selector(setCurrentPageIndicatorTintColor:))];
    }
}
#endif
@end

