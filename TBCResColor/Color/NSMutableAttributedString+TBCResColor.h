//
//  NSMutableAttributedString+TBCResColor.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "NSObject+TBCResColor.h"

@interface NSMutableAttributedString (TBCResColor)
- (void)addForegroundColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)addBackgroundColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)addStrokeColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)addUnderlineColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)addStrikethroughColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
@end
