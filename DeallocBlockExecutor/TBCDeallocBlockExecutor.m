//
//  TBCDeallocBlockExecutor
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "TBCDeallocBlockExecutor.h"

@implementation TBCDeallocBlockExecutor

+ (instancetype)executorWithDeallocBlock:(void (^)(void))deallocBlock
{
    TBCDeallocBlockExecutor *o = [TBCDeallocBlockExecutor new];
    o.deallocBlock = deallocBlock;
    return o;
}

- (void)dealloc
{
    if (self.deallocBlock)
    {
        self.deallocBlock();
        self.deallocBlock = nil;
    }
}
@end
