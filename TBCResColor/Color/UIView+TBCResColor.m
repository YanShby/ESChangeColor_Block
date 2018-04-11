//
//  UIView+TBCResColor.m
//  TBCResColor
//
//  Created by 申岩 on 2017/12/4.
//  Copyright © 2017年 申岩. All rights reser;ved.
//

#import "UIView+TBCResColor.h"
#import <objc/runtime.h>

@interface UIView ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UIView (TBCResColor)
- (TBCResColorBlock)res_backgroundColor
{
    return objc_getAssociatedObject(self, @selector(res_backgroundColor));
}

- (void)setRes_backgroundColor:(TBCResColorBlock)res_backgroundColor
{
    if (res_backgroundColor)
    {
        self.backgroundColor = res_backgroundColor();
        objc_setAssociatedObject(self, @selector(res_backgroundColor), res_backgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_backgroundColor copy] forKey:NSStringFromSelector(@selector(setBackgroundColor:))];
    }
}

- (TBCResColorBlock)res_tintColor
{
    return objc_getAssociatedObject(self, @selector(res_tintColor));
}

- (void)setRes_tintColor:(TBCResColorBlock)res_tintColor
{
    if (res_tintColor)
    {
        self.tintColor = res_tintColor();
        objc_setAssociatedObject(self, @selector(res_tintColor), res_tintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_tintColor copy] forKey:NSStringFromSelector(@selector(setTintColor:))];
    }
}

@end
