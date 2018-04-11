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
#import "NSAttributedString+YYText.h"


@interface NSMutableAttributedString (TBCResColor)
#ifdef USE_BLOCK
- (void)addForegroundColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)addBackgroundColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)addStrokeColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)addUnderlineColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)addStrikethroughColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;


// YYText
@property (nullable, nonatomic, copy) TBCResColorBlock res_yy_color;
@property (nullable, nonatomic, copy) TBCResColorBlock res_yy_backgroundColor;
@property (nullable, nonatomic, copy) TBCResColorBlock res_yy_strokeColor;
@property (nullable, nonatomic, copy) TBCResColorBlock res_yy_strikethroughColor;
@property (nullable, nonatomic, copy) TBCResColorBlock res_yy_underlineColor;
- (void)res_yy_setColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)res_yy_setBackgroundColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)res_yy_setStrokeColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)res_yy_setStrikethroughColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
- (void)res_yy_setUnderlineColorBlock:(TBCResColorBlock)colorBlock range:(NSRange)range;
#endif
@end
