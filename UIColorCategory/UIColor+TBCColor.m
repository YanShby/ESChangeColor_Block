//
//  UIColor+TBCColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/4/10.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UIColor+TBCColor.h"
#import <objc/runtime.h>

@implementation UIColor (TBCColor)

- (BOOL)needColorChange {
    return [objc_getAssociatedObject(self, @selector(needColorChange)) boolValue];
}

- (void)setNeedColorChange:(BOOL)needColorChange {
    NSNumber *need = [NSNumber numberWithBool:needColorChange];
    objc_setAssociatedObject(self, @selector(needColorChange), need, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)colorKey {
    return objc_getAssociatedObject(self, @selector(colorKey));
}

- (void)setColorKey:(NSString *)colorKey {
    objc_setAssociatedObject(self, @selector(colorKey), colorKey, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TBCColorType)colorType {
    return [objc_getAssociatedObject(self, @selector(colorType)) integerValue];
}

- (void)setColorType:(TBCColorType)colorType {
    NSNumber *type = [NSNumber numberWithInteger:colorType];
    objc_setAssociatedObject(self, @selector(colorType), type, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGFloat)colorAlpha {
    return [objc_getAssociatedObject(self, @selector(colorAlpha)) floatValue];
}

- (void)setColorAlpha:(CGFloat)colorAlpha {
    
    colorAlpha = (colorAlpha > 1.f) ? 1.f : colorAlpha;
    colorAlpha = (colorAlpha < 0.f) ? 0.f : colorAlpha;
    
    NSNumber *alpha = [NSNumber numberWithFloat:colorAlpha];
    objc_setAssociatedObject(self, @selector(colorAlpha), alpha, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
@end
