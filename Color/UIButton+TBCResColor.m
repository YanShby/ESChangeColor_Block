//
//  UIButton+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UIButton+TBCResColor.h"
#import <objc/runtime.h>

#import "UIColor+TBCColor.h"


@interface UIButton ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *resColors;
@end

@implementation UIButton (TBCResColor)

- (void)resoureManagerDelegate
{
    [self.resColors enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]])
        {
#ifdef USE_BLOCK
            NSDictionary<NSString *, TBCResColorBlock> *dictionary = (NSDictionary *)obj;
            [dictionary enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull selector, TBCResColorBlock  _Nonnull block, BOOL * _Nonnull stop) {
                NSArray *keyArray = [key componentsSeparatedByString:@"_"];
                UIControlState state = [[keyArray firstObject] integerValue];
                [UIView animateWithDuration:0.1f animations:^{
                    if ([selector isEqualToString:NSStringFromSelector(@selector(setTitleColor:forState:))]) {
                        UIColor *resultColor = block();
                        [self setTitleColor:resultColor forState:state];
                    } else if ([selector isEqualToString:NSStringFromSelector(@selector(setBackgroundImage:forState:))]) {
                        UIImage *resultImage = ((TBCResImageBlock)block)();
                        [self setBackgroundImage:resultImage forState:state];
                    } else if ([selector isEqualToString:NSStringFromSelector(@selector(setImage:forState:))]) {
                        UIImage *resultImage = ((TBCResImageBlock)block)();
                        [self setImage:resultImage forState:state];
                    }
                }];
            }];
#else
            [obj enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull selector, id _Nonnull object, BOOL * _Nonnull stop) {
                NSArray *keyArray = [key componentsSeparatedByString:@"_"];
                UIControlState state = [[keyArray firstObject] integerValue];
                [UIView animateWithDuration:0.1f animations:^{
                    if ([selector isEqualToString:NSStringFromSelector(@selector(setTitleColor:forState:))]) {
                        UIColor *resultColor = nil;
                        if (((UIColor *)object).needColorChange) {
                            resultColor = [UIColor colorForKey:((UIColor *)object).colorKey colorType:((UIColor *)object).colorType alpha:((UIColor *)object).colorAlpha];
                            [self setTitleColor:resultColor forState:state];
                        }
                    } else if ([selector isEqualToString:NSStringFromSelector(@selector(setBackgroundImage:forState:))]) {
                        UIImage *resultImage = object;
                        [self setBackgroundImage:resultImage forState:state];
                    } else if ([selector isEqualToString:NSStringFromSelector(@selector(setImage:forState:))]) {
                        UIImage *resultImage = object;
                        [self setImage:resultImage forState:state];
                    }
                }];
            }];
#endif
        }
        else
        {
            
#ifdef USE_BLOCK
            SEL sel = NSSelectorFromString(key);
            TBCResColorBlock colorBlock = (TBCResColorBlock)obj;
            UIColor *result = colorBlock();
#else
            SEL sel = NSSelectorFromString(key);
            UIColor *result = ((UIColor *)obj);
            if (result.needColorChange == YES) {
                result = [UIColor colorForKey:result.colorKey colorType:result.colorType alpha:result.colorAlpha];
            }
#endif
            
            [UIView animateWithDuration:0.1f animations:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [self performSelector:sel withObject:result];
#pragma clang diagnostic pop
            }];
        }
    }];
}



#ifdef USE_BLOCK
- (void)res_setTitleColor:(TBCResColorBlock)colorBlock forState:(UIControlState)state
{
    if (colorBlock)
    {
        [self setTitleColor:colorBlock() forState:state];
        NSString *key = [NSString stringWithFormat:@"%@_%@", @(state),NSStringFromSelector(@selector(setTitleColor:forState:))];
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        [dictionary setObject:[colorBlock copy] forKey:NSStringFromSelector(@selector(setTitleColor:forState:))];
        [self.resColors setObject:dictionary forKey:key];
    }
}

- (void)res_setBackgroundImage:(TBCResImageBlock)imageBlock forState:(UIControlState)state
{
    if (imageBlock)
    {
        [self setBackgroundImage:imageBlock() forState:state];
        NSString *key = [NSString stringWithFormat:@"%@_%@", @(state),NSStringFromSelector(@selector(setBackgroundImage:forState:))];
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        [dictionary setObject:[imageBlock copy] forKey:NSStringFromSelector(@selector(setBackgroundImage:forState:))];
        [self.resColors setObject:dictionary forKey:key];
    }
}

- (void)res_setImage:(TBCResImageBlock)imageBlock forState:(UIControlState)state
{
    if (imageBlock)
    {
        [self setImage:imageBlock() forState:state];
        NSString *key = [NSString stringWithFormat:@"%@_%@", @(state),NSStringFromSelector(@selector(setImage:forState:))];
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        [dictionary setObject:[imageBlock copy] forKey:NSStringFromSelector(@selector(setImage:forState:))];
        [self.resColors setObject:dictionary forKey:key];
    }
}
#else
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method Method1 = class_getInstanceMethod([UIButton class], @selector(setTitleColor:forState:));
        Method newMethod1 = class_getInstanceMethod([UIButton class], @selector(tbc_setTitleColor:forState:));
        
        Method Method2 = class_getInstanceMethod([UIButton class], @selector(setBackgroundImage:forState:));
        Method newMethod2 = class_getInstanceMethod([UIButton class], @selector(tbc_setBackgroundImage:forState:));
        
        Method Method3 = class_getInstanceMethod([UIButton class], @selector(setImage:forState:));
        Method newMethod3 = class_getInstanceMethod([UIButton class], @selector(tbc_setImage:forState:));
        
        method_exchangeImplementations(Method1, newMethod1);
        method_exchangeImplementations(Method2, newMethod2);
        method_exchangeImplementations(Method3, newMethod3);
    });
}

- (void)tbc_setTitleColor:(UIColor *)titleColor forState:(UIControlState)state
{
    [self tbc_setTitleColor:titleColor forState:state];
    if (titleColor) {
        NSString *key = [NSString stringWithFormat:@"%@_%@", @(state),NSStringFromSelector(@selector(setTitleColor:forState:))];
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        [dictionary setObject:titleColor forKey:NSStringFromSelector(@selector(setTitleColor:forState:))];
        [self.resColors setObject:dictionary forKey:key];
    }
}

- (void)tbc_setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state
{
    [self tbc_setBackgroundImage:backgroundImage forState:state];
    if (backgroundImage) {
        NSString *key = [NSString stringWithFormat:@"%@_%@", @(state),NSStringFromSelector(@selector(setBackgroundImage:forState:))];
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        [dictionary setObject:backgroundImage forKey:NSStringFromSelector(@selector(setBackgroundImage:forState:))];
        [self.resColors setObject:dictionary forKey:key];
    }
}

- (void)tbc_setImage:(UIImage *)image forState:(UIControlState)state
{
    [self tbc_setImage:image forState:state];
    if (image) {
        NSString *key = [NSString stringWithFormat:@"%@_%@", @(state),NSStringFromSelector(@selector(setImage:forState:))];
        NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
        [dictionary setObject:image forKey:NSStringFromSelector(@selector(setImage:forState:))];
        [self.resColors setObject:dictionary forKey:key];
    }
}
#endif

@end
