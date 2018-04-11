//
//  ESThemeManager.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/22.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "ESThemeManager.h"

@interface ESThemeManager ()
@property (nonatomic, assign, readwrite) BOOL isNight;
@end

@implementation ESThemeManager

+ (instancetype)sharedInstance
{
    static ESThemeManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (manager == nil) {
            manager = [[self alloc] init];
            manager.isNight = NO;
        }
    });
    return manager;
}

- (void)changeStyle
{
    if (self.isNight)
    {
        self.isNight = NO;
    }
    else
    {
        self.isNight = YES;
    }
    
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:@"TBCResColor" object:nil];
    });
}

@end
