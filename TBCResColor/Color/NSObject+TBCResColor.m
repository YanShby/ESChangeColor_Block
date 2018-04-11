//
//  NSObject+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+TBCResColor.h"
#import "NSObject+DeallocBlock.h"
#import <objc/runtime.h>

static void *TBCViewDeallocHelperKey;

@interface NSObject ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation NSObject (TBCResColor)
- (NSMutableDictionary<NSString *, TBCResColorBlock> *)resColors
{
    NSMutableDictionary<NSString *, TBCResColorBlock> *resColors = objc_getAssociatedObject(self, @selector(resColors));
    if (!resColors)
    {
        @autoreleasepool {
            if (objc_getAssociatedObject(self, &TBCViewDeallocHelperKey) == nil) {
                // weakSelf需要在dealloc中调用, 如果使用__weak会被设置为nil.
                __unsafe_unretained typeof(self) weakSelf = self;
                id deallocHelper = [self addDeallocBlock:^{
                    [[NSNotificationCenter defaultCenter] removeObserver:weakSelf];
                }];
                objc_setAssociatedObject(self, &TBCViewDeallocHelperKey, deallocHelper, OBJC_ASSOCIATION_ASSIGN);
            }
        }

        resColors = [[NSMutableDictionary alloc] init];
        objc_setAssociatedObject(self, @selector(resColors), resColors, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resoureManagerDelegate) name:@"TBCResColor" object:nil];
    }
    return resColors;
}

- (void)resoureManagerDelegate
{
    [self.resColors enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull selector, TBCResColorBlock  _Nonnull colorBlock, BOOL * _Nonnull stop) {
        SEL sel = NSSelectorFromString(selector);
        id  result = colorBlock();
        
        [UIView animateWithDuration:0.1f animations:^{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self performSelector:sel withObject:result];
#pragma clang diagnostic pop
        }];
    }];
}
@end
