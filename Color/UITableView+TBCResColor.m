//
//  UITableView+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UITableView+TBCResColor.h"
#import <objc/runtime.h>

@interface UITableView ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UITableView (TBCResColor)
#ifdef USE_BLOCK
- (TBCResColorBlock)res_separatorColor
{
    return objc_getAssociatedObject(self, @selector(res_separatorColor));
}

- (void)setRes_separatorColor:(TBCResColorBlock)res_separatorColor
{
    if (res_separatorColor)
    {
        self.separatorColor = res_separatorColor();
        objc_setAssociatedObject(self, @selector(res_separatorColor), res_separatorColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_separatorColor copy] forKey:NSStringFromSelector(@selector(setSeparatorColor:))];
    }
}

- (TBCResColorBlock)res_sectionIndexColor
{
    return objc_getAssociatedObject(self, @selector(res_sectionIndexColor));
}

- (void)setRes_sectionIndexColor:(TBCResColorBlock)res_sectionIndexColor
{
    if (res_sectionIndexColor)
    {
        self.sectionIndexColor = res_sectionIndexColor();
        objc_setAssociatedObject(self, @selector(res_sectionIndexColor), res_sectionIndexColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_sectionIndexColor copy] forKey:NSStringFromSelector(@selector(setSectionIndexColor:))];
    }
}

- (TBCResColorBlock)res_sectionIndexBackgroundColor
{
    return objc_getAssociatedObject(self, @selector(res_sectionIndexBackgroundColor));
}

- (void)setRes_sectionIndexBackgroundColor:(TBCResColorBlock)res_sectionIndexBackgroundColor
{
    if (res_sectionIndexBackgroundColor)
    {
        self.sectionIndexBackgroundColor = res_sectionIndexBackgroundColor();
        objc_setAssociatedObject(self, @selector(res_sectionIndexBackgroundColor), res_sectionIndexBackgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_sectionIndexBackgroundColor copy] forKey:NSStringFromSelector(@selector(setSectionIndexBackgroundColor:))];
    }
}

- (TBCResColorBlock)res_sectionIndexTrackingBackgroundColor
{
    return objc_getAssociatedObject(self, @selector(res_sectionIndexTrackingBackgroundColor));
}

- (void)setRes_sectionIndexTrackingBackgroundColor:(TBCResColorBlock)res_sectionIndexTrackingBackgroundColor
{
    if (res_sectionIndexTrackingBackgroundColor)
    {
        self.sectionIndexTrackingBackgroundColor = res_sectionIndexTrackingBackgroundColor();
        objc_setAssociatedObject(self, @selector(res_sectionIndexTrackingBackgroundColor), res_sectionIndexTrackingBackgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_sectionIndexTrackingBackgroundColor copy] forKey:NSStringFromSelector(@selector(setSectionIndexTrackingBackgroundColor:))];
    }
}
#else
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method Method1 = class_getInstanceMethod([UITableView class], @selector(setSeparatorColor:));
        Method newMethod1 = class_getInstanceMethod([UITableView class], @selector(tbc_setSeparatorColor:));
        
        Method Method2 = class_getInstanceMethod([UITableView class], @selector(setSectionIndexColor:));
        Method newMethod2 = class_getInstanceMethod([UITableView class], @selector(tbc_setSectionIndexColor:));
        
        Method Method3 = class_getInstanceMethod([UITableView class], @selector(setSectionIndexBackgroundColor:));
        Method newMethod3 = class_getInstanceMethod([UITableView class], @selector(tbc_setSectionIndexBackgroundColor:));
        
        Method Method4 = class_getInstanceMethod([UITableView class], @selector(setSectionIndexTrackingBackgroundColor:));
        Method newMethod4 = class_getInstanceMethod([UITableView class], @selector(tbc_setSectionIndexTrackingBackgroundColor:));
        
        method_exchangeImplementations(Method1, newMethod1);
        method_exchangeImplementations(Method2, newMethod2);
        method_exchangeImplementations(Method3, newMethod3);
        method_exchangeImplementations(Method4, newMethod4);
    });
}

- (void)tbc_setSeparatorColor:(UIColor *)color
{
    if (color)
    {
        [self tbc_setSeparatorColor:color];
        [self.resColors setObject:color forKey:NSStringFromSelector(@selector(setSeparatorColor:))];
    }
}

- (void)tbc_setSectionIndexColor:(UIColor *)color
{
    if (color)
    {
        [self tbc_setSectionIndexColor:color];
        [self.resColors setObject:color forKey:NSStringFromSelector(@selector(setSectionIndexColor:))];
    }
}

- (void)tbc_setSectionIndexBackgroundColor:(UIColor *)color
{
    if (color)
    {
        [self tbc_setSectionIndexBackgroundColor:color];
        [self.resColors setObject:color forKey:NSStringFromSelector(@selector(setSectionIndexBackgroundColor:))];
    }
}

- (void)tbc_setSectionIndexTrackingBackgroundColor:(UIColor *)color
{
    if (color)
    {
        [self tbc_setSectionIndexTrackingBackgroundColor:color];
        [self.resColors setObject:color forKey:NSStringFromSelector(@selector(setSectionIndexTrackingBackgroundColor:))];
    }
}
#endif
@end

