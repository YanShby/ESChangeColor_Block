//
//  UITextView+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UITextView+TBCResColor.h"
#import <objc/runtime.h>

@interface UITextView ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UITextView (TBCResColor)

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
@end
