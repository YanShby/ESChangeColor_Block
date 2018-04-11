//
//  NSMutableAttributedString+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "NSMutableAttributedString+TBCResColor.h"
#import <objc/runtime.h>

@interface NSMutableAttributedString ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation NSMutableAttributedString (TBCResColor)
#ifdef USE_BLOCK
- (void)addForegroundColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range
{
    if (colorBlock)
    {
        [self addAttribute:NSForegroundColorAttributeName value:colorBlock() range:range];
        NSString *key = [NSString stringWithFormat:@"%@_%@",NSForegroundColorAttributeName,NSStringFromRange(range)];
        [self.resColors setObject:[colorBlock copy] forKey:key];
    }
}

- (void)addBackgroundColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range
{
    if (colorBlock)
    {
        [self addAttribute:NSBackgroundColorAttributeName value:colorBlock() range:range];
        NSString *key = [NSString stringWithFormat:@"%@_%@",NSBackgroundColorAttributeName,NSStringFromRange(range)];
        [self.resColors setObject:[colorBlock copy] forKey:key];
    }
}

- (void)addStrokeColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range
{
    if (colorBlock)
    {
        [self addAttribute:NSStrokeColorAttributeName value:colorBlock() range:range];
        NSString *key = [NSString stringWithFormat:@"%@_%@",NSStrokeColorAttributeName,NSStringFromRange(range)];
        [self.resColors setObject:[colorBlock copy] forKey:key];
    }
}

- (void)addUnderlineColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range
{
    if (colorBlock)
    {
        [self addAttribute:NSUnderlineColorAttributeName value:colorBlock() range:range];
        NSString *key = [NSString stringWithFormat:@"%@_%@",NSUnderlineColorAttributeName,NSStringFromRange(range)];
        [self.resColors setObject:[colorBlock copy] forKey:key];
    }
}

- (void)addStrikethroughColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range
{
    if (colorBlock)
    {
        [self addAttribute:NSStrikethroughColorAttributeName value:colorBlock() range:range];
        NSString *key = [NSString stringWithFormat:@"%@_%@",NSStrikethroughColorAttributeName,NSStringFromRange(range)];
        [self.resColors setObject:[colorBlock copy] forKey:key];
    }
}


// YYText
#pragma mark - property setter and getter
-(void)setRes_yy_color:(TBCResColorBlock)res_yy_color
{
    if (!res_yy_color) return;
    objc_setAssociatedObject(self, @selector(res_yy_color), res_yy_color, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self res_yy_setColorBlock:res_yy_color range:NSMakeRange(0, self.length)];
}

- (TBCResColorBlock)res_yy_color
{
    return objc_getAssociatedObject(self, @selector(res_yy_color));
}

- (void)setRes_yy_backgroundColor:(TBCResColorBlock)res_yy_backgroundColor
{
    if (!res_yy_backgroundColor) return;
    objc_setAssociatedObject(self, @selector(res_yy_backgroundColor), res_yy_backgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self res_yy_setBackgroundColorBlock:res_yy_backgroundColor range:NSMakeRange(0, self.length)];
}

- (TBCResColorBlock)res_yy_backgroundColor
{
    return objc_getAssociatedObject(self, @selector(res_yy_backgroundColor));
}

- (void)setRes_yy_strokeColor:(TBCResColorBlock)res_yy_strokeColor
{
    if (!res_yy_strokeColor) return;
    objc_setAssociatedObject(self, @selector(res_yy_strokeColor), res_yy_strokeColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self res_yy_setStrokeColorBlock:res_yy_strokeColor range:NSMakeRange(0, self.length)];
}

- (TBCResColorBlock)res_yy_strokeColor
{
    return objc_getAssociatedObject(self, @selector(res_yy_strokeColor));
}

- (void)setRes_yy_strikethroughColor:(TBCResColorBlock)res_yy_strikethroughColor
{
    if (!res_yy_strikethroughColor) return;
    objc_setAssociatedObject(self, @selector(res_yy_strikethroughColor), res_yy_strikethroughColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self res_yy_setStrikethroughColorBlock:res_yy_strikethroughColor range:NSMakeRange(0, self.length)];
}

- (TBCResColorBlock)res_yy_strikethroughColor
{
    return objc_getAssociatedObject(self, @selector(res_yy_strikethroughColor));
}

- (void)setRes_yy_underlineColor:(TBCResColorBlock)res_yy_underlineColor
{
    if (!res_yy_underlineColor) return;
    objc_setAssociatedObject(self, @selector(res_yy_underlineColor), res_yy_underlineColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self res_yy_setUnderlineColorBlock:res_yy_underlineColor range:NSMakeRange(0, self.length)];
}

- (TBCResColorBlock)res_yy_underlineColor
{
    return objc_getAssociatedObject(self, @selector(res_yy_underlineColor));
}

#pragma mark - some functions
- (void)res_yy_setColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range
{
    if (colorBlock)
    {
        [self yy_setColor:colorBlock() range:range];
        NSString *key = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(@selector(yy_setColor:range:)),NSStringFromRange(range)];
        [self.resColors setObject:[colorBlock copy] forKey:key];
    }
}

- (void)res_yy_setBackgroundColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range
{
    if (colorBlock)
    {
        [self yy_setBackgroundColor:colorBlock() range:range];
        NSString *key = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(@selector(yy_setBackgroundColor:range:)),NSStringFromRange(range)];
        [self.resColors setObject:[colorBlock copy] forKey:key];
    }
}

- (void)res_yy_setStrokeColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range
{
    if (colorBlock)
    {
        [self yy_setStrokeColor:colorBlock() range:range];
        NSString *key = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(@selector(yy_setStrokeColor:range:)),NSStringFromRange(range)];
        [self.resColors setObject:[colorBlock copy] forKey:key];
    }
}

- (void)res_yy_setStrikethroughColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range
{
    if (colorBlock)
    {
        [self yy_setStrikethroughColor:colorBlock() range:range];
        NSString *key = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(@selector(yy_setStrikethroughColor:range:)),NSStringFromRange(range)];
        [self.resColors setObject:[colorBlock copy] forKey:key];
    }
}

- (void)res_yy_setUnderlineColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range
{
    if (colorBlock)
    {
        [self yy_setUnderlineColor:colorBlock() range:range];
        NSString *key = [NSString stringWithFormat:@"%@-%@",NSStringFromSelector(@selector(yy_setUnderlineColor:range:)),NSStringFromRange(range)];
        [self.resColors setObject:[colorBlock copy] forKey:key];
    }
}


- (void)resoureManagerDelegate
{
    [self.resColors enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, TBCResColorBlock  _Nonnull obj, BOOL * _Nonnull stop) {
        // 系统方法用'_'区分， YYText用'-'区分
        NSArray *keyArray = [key componentsSeparatedByString:@"-"];
        
        if (keyArray.count == 1) {
            keyArray = [key componentsSeparatedByString:@"_"];
            
            NSAttributedStringKey stringKey = [keyArray firstObject];
            NSString *rangeString = [keyArray lastObject];
            NSRange range = NSRangeFromString(rangeString);
            
            [self addAttribute:stringKey value:obj() range:range];
        } else {
            NSString *selectorString = [keyArray firstObject];
            NSString *rangeString = [keyArray lastObject];
            NSRange range = NSRangeFromString(rangeString);
            
            if ([selectorString isEqualToString:NSStringFromSelector(@selector(yy_setColor:range:))]) {
                [self yy_setColor:obj() range:range];
            } else if ([selectorString isEqualToString:NSStringFromSelector(@selector(yy_setBackgroundColor:range:))]) {
                [self yy_setBackgroundColor:obj() range:range];
            } else if ([selectorString isEqualToString:NSStringFromSelector(@selector(yy_setStrokeColor:range:))]) {
                [self yy_setStrokeColor:obj() range:range];
            } else if ([selectorString isEqualToString:NSStringFromSelector(@selector(yy_setStrikethroughColor:range:))]) {
                [self yy_setStrikethroughColor:obj() range:range];
            } else if ([selectorString isEqualToString:NSStringFromSelector(@selector(yy_setUnderlineColor:range:))]) {
                [self yy_setUnderlineColor:obj() range:range];
            }
        }
    }];
}
#else

#endif
@end


