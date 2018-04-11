//
//  UIButton+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UIButton+TBCResColor.h"



@interface UIButton ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, id> *resColors;
@end

@implementation UIButton (TBCResColor)
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

- (void)resoureManagerDelegate
{
    [self.resColors enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSDictionary class]])
        {
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
            
        }
        else
        {
            SEL sel = NSSelectorFromString(key);
            TBCResColorBlock colorBlock = (TBCResColorBlock)obj;
            UIColor *color = colorBlock();

            [UIView animateWithDuration:0.1f animations:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
                [self performSelector:sel withObject:color];
#pragma clang diagnostic pop
            }];
        }
    }];
}
@end
