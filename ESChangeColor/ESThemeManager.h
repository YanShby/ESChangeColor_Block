//
//  ESThemeManager.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/22.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol ESThemeManagerDelegate <NSObject>

@optional

- (void)resoureManagerDelegate;

@end

@interface ESThemeManager : NSObject

@property (nonatomic, assign, readonly) BOOL isNight;

+ (instancetype)sharedInstance;

- (void)changeStyle;
@end
