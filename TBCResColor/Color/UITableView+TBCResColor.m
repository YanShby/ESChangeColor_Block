//
//  UITableView+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UITableView+TBCResColor.h"
#import <objc/runtime.h>

@interface UITableView ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UITableView (TBCResColor)

- (TBCResColorBlock)res_separatorColor
{
    return objc_getAssociatedObject(self, @selector(res_separatorColor));
}

- (void)setRes_separatorColor:(TBCResColorBlock)res_separatorColor
{
    if (res_separatorColor)
    {
        self.separatorColor = res_separatorColor();
        objc_setAssociatedObject(self, @selector(res_separatorColor), res_separatorColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_separatorColor copy] forKey:NSStringFromSelector(@selector(setSeparatorColor:))];
    }
}

- (TBCResColorBlock)res_sectionIndexColor
{
    return objc_getAssociatedObject(self, @selector(res_sectionIndexColor));
}

- (void)setRes_sectionIndexColor:(TBCResColorBlock)res_sectionIndexColor
{
    if (res_sectionIndexColor)
    {
        self.sectionIndexColor = res_sectionIndexColor();
        objc_setAssociatedObject(self, @selector(res_sectionIndexColor), res_sectionIndexColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_sectionIndexColor copy] forKey:NSStringFromSelector(@selector(setSectionIndexColor:))];
    }
}

- (TBCResColorBlock)res_sectionIndexBackgroundColor
{
    return objc_getAssociatedObject(self, @selector(res_sectionIndexBackgroundColor));
}

- (void)setRes_sectionIndexBackgroundColor:(TBCResColorBlock)res_sectionIndexBackgroundColor
{
    if (res_sectionIndexBackgroundColor)
    {
        self.sectionIndexBackgroundColor = res_sectionIndexBackgroundColor();
        objc_setAssociatedObject(self, @selector(res_sectionIndexBackgroundColor), res_sectionIndexBackgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_sectionIndexBackgroundColor copy] forKey:NSStringFromSelector(@selector(setSectionIndexBackgroundColor:))];
    }
}

- (TBCResColorBlock)res_sectionIndexTrackingBackgroundColor
{
    return objc_getAssociatedObject(self, @selector(res_sectionIndexTrackingBackgroundColor));
}

- (void)setRes_sectionIndexTrackingBackgroundColor:(TBCResColorBlock)res_sectionIndexTrackingBackgroundColor
{
    if (res_sectionIndexTrackingBackgroundColor)
    {
        self.sectionIndexTrackingBackgroundColor = res_sectionIndexTrackingBackgroundColor();
        objc_setAssociatedObject(self, @selector(res_sectionIndexTrackingBackgroundColor), res_sectionIndexTrackingBackgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_sectionIndexTrackingBackgroundColor copy] forKey:NSStringFromSelector(@selector(setSectionIndexTrackingBackgroundColor:))];
    }
}
@end

