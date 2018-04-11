//
//  UITextField+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UITextField+TBCResColor.h"
#import <objc/runtime.h>

@interface UITextField ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UITextField (TBCResColor)
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
#else
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method Method1 = class_getInstanceMethod([UITextField class], @selector(setTextColor:));
        Method newMethod1 = class_getInstanceMethod([UITextField class], @selector(tbc_setTextColor:));
        
        method_exchangeImplementations(Method1, newMethod1);
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
#endif
@end
