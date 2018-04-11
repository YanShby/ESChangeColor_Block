//
//  UILabel+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UILabel+TBCResColor.h"
#import <objc/runtime.h>

@interface UILabel ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *resColors;
@end

@implementation UILabel (TBCResColor)
#ifdef USE_BLOCK
- (TBCResColorBlock)res_textColor
{
    return objc_getAssociatedObject(self, @selector(res_textColor));
}

- (void)setRes_textColor:(TBCResColorBlock)res_textColor
{
    if (res_textColor)
    {
        self.textColor = res_textColor();
        objc_setAssociatedObject(self, @selector(res_textColor), res_textColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_textColor copy] forKey:NSStringFromSelector(@selector(setTextColor:))];
    }
}

- (TBCResColorBlock)res_shadowColor
{
    return objc_getAssociatedObject(self, @selector(res_shadowColor));
}

- (void)setRes_shadowColor:(TBCResColorBlock)res_shadowColor
{
    if (res_shadowColor)
    {
        self.shadowColor = res_shadowColor();
        objc_setAssociatedObject(self, @selector(res_shadowColor), res_shadowColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_shadowColor copy] forKey:NSStringFromSelector(@selector(setShadowColor:))];
    }
}

- (TBCResColorBlock)res_highlightedTextColor
{
    return objc_getAssociatedObject(self, @selector(res_highlightedTextColor));
}

- (void)setRes_highlightedTextColor:(TBCResColorBlock)res_highlightedTextColor
{
    if (res_highlightedTextColor)
    {
        self.highlightedTextColor = res_highlightedTextColor();
        objc_setAssociatedObject(self, @selector(res_highlightedTextColor), res_highlightedTextColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_highlightedTextColor copy] forKey:NSStringFromSelector(@selector(setHighlightedTextColor:))];
    }
}

- (TBCResAttributedString)res_attributedText
{
    return objc_getAssociatedObject(self, @selector(res_attributedText));
}

- (void)setRes_attributedText:(TBCResAttributedString)res_attributedText
{
    if (res_attributedText)
    {
        self.attributedText = res_attributedText();
        objc_setAssociatedObject(self, @selector(res_attributedText), res_attributedText, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_attributedText copy] forKey:NSStringFromSelector(@selector(setAttributedText:))];
    }
}
#else
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method Method1 = class_getInstanceMethod([UILabel class], @selector(setTextColor:));
        Method newMethod1 = class_getInstanceMethod([UILabel class], @selector(tbc_setTextColor:));
        
        Method Method2 = class_getInstanceMethod([UILabel class], @selector(setShadowColor:));
        Method newMethod2 = class_getInstanceMethod([UILabel class], @selector(tbc_setShadowColor:));
        
        Method Method3 = class_getInstanceMethod([UILabel class], @selector(setHighlightedTextColor:));
        Method newMethod3 = class_getInstanceMethod([UILabel class], @selector(tbc_setHighlightedTextColor:));
        
        Method Method4 = class_getInstanceMethod([UILabel class], @selector(setAttributedText:));
        Method newMethod4 = class_getInstanceMethod([UILabel class], @selector(tbc_setAttributedText:));
        
        method_exchangeImplementations(Method1, newMethod1);
        method_exchangeImplementations(Method2, newMethod2);
        method_exchangeImplementations(Method3, newMethod3);
        method_exchangeImplementations(Method4, newMethod4);
    });
}

- (void)tbc_setTextColor:(UIColor *)textColor
{
    if (textColor)
    {
        [self tbc_setTextColor:textColor];
        [self.resColors setObject:textColor forKey:NSStringFromSelector(@selector(setTextColor:))];
    }
}

- (void)tbc_setShadowColor:(UIColor *)shadowColor
{
    if (shadowColor)
    {
        [self tbc_setShadowColor:shadowColor];
        [self.resColors setObject:shadowColor forKey:NSStringFromSelector(@selector(setShadowColor:))];
    }
}

- (void)tbc_setHighlightedTextColor:(UIColor *)highlightedTextColor
{
    if (highlightedTextColor)
    {
        [self tbc_setHighlightedTextColor:highlightedTextColor];
        [self.resColors setObject:highlightedTextColor forKey:NSStringFromSelector(@selector(setHighlightedTextColor:))];
    }
}

- (void)tbc_setAttributedText:(NSAttributedString *)attributedText
{
    if (attributedText)
    {
        [self tbc_setAttributedText:attributedText];
        [self.resColors setObject:attributedText forKey:NSStringFromSelector(@selector(setAttributedText:))];
    }
}
#endif
@end
