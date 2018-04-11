//
//  UIImageView+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UIImageView+TBCResColor.h"
#import <objc/runtime.h>

@interface UIImageView ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResImageBlock> *resColors;
@end

@implementation UIImageView (TBCResColor)
#ifdef USE_BLOCK
- (instancetype)res_initWithImage:(TBCResImageBlock)imageBlock
{
    if (imageBlock)
    {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:imageBlock()];
        imageView.res_image = [imageBlock copy];
        return imageView;
    }
    return nil;
}

- (TBCResImageBlock)res_image
{
    return objc_getAssociatedObject(self, @selector(res_image));
}

- (void)setRes_image:(TBCResImageBlock)res_image
{
    if (res_image)
    {
        self.image = res_image();
        objc_setAssociatedObject(self, @selector(res_image), res_image, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_image copy] forKey:NSStringFromSelector(@selector(setImage:))];
    }
}
#else
//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Method Method1 = class_getInstanceMethod([UIImageView class], @selector(initWithImage:));
//        Method newMethod1 = class_getInstanceMethod([UIImageView class], @selector(tbc_initWithImage:));
//
//        Method Method2 = class_getInstanceMethod([UIImageView class], @selector(setImage:));
//        Method newMethod2 = class_getInstanceMethod([UIImageView class], @selector(tbc_setImage:));
//
//        method_exchangeImplementations(Method1, newMethod1);
//        method_exchangeImplementations(Method2, newMethod2);
//    });
//}
//
//- (instancetype)tbc_initWithImage:(UIImage *)image
//{
//    UIImageView *imageView = [[UIImageView alloc] tbc_initWithImage:image];
////    [imageView setImage:image];
//    return imageView;
//}
//
//- (void)tbc_setImage:(UIImage *)image
//{
//    [self tbc_setImage:image];
//    if (image)
//    {
//        [self.resColors setObject:image forKey:NSStringFromSelector(@selector(setImage:))];
//    }
//}
#endif
@end
