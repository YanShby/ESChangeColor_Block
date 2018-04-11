//
//  TBCDeallocBlockExecutor
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TBCDeallocBlockExecutor : NSObject

+ (instancetype)executorWithDeallocBlock:(void (^)(void))deallocBlock;

@property (nonatomic, copy) void (^deallocBlock)(void);

@end
