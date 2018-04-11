//
//  UISlider+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UISlider+TBCResColor.h"
#import <objc/runtime.h>
@interface UISlider ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UISlider (TBCResColor)

- (TBCResColorBlock)res_minimumTrackTintColor
{
    return objc_getAssociatedObject(self, @selector(res_minimumTrackTintColor));
}

- (void)setRes_minimumTrackTintColor:(TBCResColorBlock)res_minimumTrackTintColor
{
    if (res_minimumTrackTintColor)
    {
        self.minimumTrackTintColor = res_minimumTrackTintColor();
        objc_setAssociatedObject(self, @selector(res_minimumTrackTintColor), res_minimumTrackTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_minimumTrackTintColor copy] forKey:NSStringFromSelector(@selector(setMinimumTrackTintColor:))];
    }
}

- (TBCResColorBlock)res_maximumTrackTintColor
{
    return objc_getAssociatedObject(self, @selector(res_maximumTrackTintColor));
}

- (void)setRes_maximumTrackTintColor:(TBCResColorBlock)res_maximumTrackTintColor
{
    if (res_maximumTrackTintColor)
    {
        self.maximumTrackTintColor = res_maximumTrackTintColor();
        objc_setAssociatedObject(self, @selector(res_maximumTrackTintColor), res_maximumTrackTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_maximumTrackTintColor copy] forKey:NSStringFromSelector(@selector(setMaximumTrackTintColor:))];
    }
}

- (TBCResColorBlock)res_thumbTintColor
{
    return objc_getAssociatedObject(self, @selector(res_thumbTintColor));
}

- (void)setRes_thumbTintColor:(TBCResColorBlock)res_thumbTintColor
{
    if (res_thumbTintColor)
    {
        self.thumbTintColor = res_thumbTintColor();
        objc_setAssociatedObject(self, @selector(res_thumbTintColor), res_thumbTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_thumbTintColor copy] forKey:NSStringFromSelector(@selector(setThumbTintColor:))];
    }
}
@end
