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
- (NSMutableDictionary<NSString *, TBCResColorBlock> *)resColors
{
    NSMutableDictionary<NSString *, TBCResColorBlock> *resColors = objc_getAssociatedObject(self, @selector(resColors));
    if (!resColors)
    {
        resColors = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, @selector(resColors), resColors, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resoureManagerDelegate) name:@"TBCResColor" object:nil];
    }
    
    return resColors;
}

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

- (void)resoureManagerDelegate
{
    [self.resColors enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, TBCResColorBlock  _Nonnull obj, BOOL * _Nonnull stop) {
        NSArray *keyArray = [key componentsSeparatedByString:@"_"];
        NSAttributedStringKey stringKey = [keyArray firstObject];
        NSString *rangeString = [keyArray lastObject];
        NSRange range = NSRangeFromString(rangeString);
        
        [self addAttribute:stringKey value:obj() range:range];
    }];
}
@end


