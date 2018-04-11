//
//  NSObject+DeallocBlock.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "NSObject+DeallocBlock.h"
#import "TBCDeallocBlockExecutor.h"
#import <objc/runtime.h>

static void *kNSObject_DeallocBlocks;

@implementation NSObject (DeallocBlock)

- (id)addDeallocBlock:(void (^)(void))deallocBlock
{
    if (deallocBlock == nil)
    {
        return nil;
    }
    
    NSMutableArray *deallocBlocks = objc_getAssociatedObject(self, &kNSObject_DeallocBlocks);
    if (deallocBlocks == nil)
    {
        deallocBlocks = [NSMutableArray array];
        objc_setAssociatedObject(self, &kNSObject_DeallocBlocks, deallocBlocks, OBJC_ASSOCIATION_RETAIN);
    }
    // 如果已经设置过该Block
    for (TBCDeallocBlockExecutor *executor in deallocBlocks)
    {
        if (executor.deallocBlock == deallocBlock)
        {
            return nil;
        }
    }
    
    TBCDeallocBlockExecutor *executor = [TBCDeallocBlockExecutor executorWithDeallocBlock:deallocBlock];
    [deallocBlocks addObject:executor];
    return executor;
}

@end
