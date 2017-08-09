//
//  UIImage+image.m
//  02runtime(交换方法)
//
//  Created by 陈武琦 on 16/7/29.
//  Copyright © 2016年 陈武琦. All rights reserved.
//

#import "UIImage+image.h"
#import <objc/message.h>


@implementation UIImage (image)

//把类加载进内存的时候调用，只会调用一次
+(void)load {
//获取imagenamed
    //获取那个类的方法
    //SEL:获取那个方法
    Method imageNameMethod = class_getClassMethod(self, @selector(imageNamed:));
    
    //获取cwq_ImageNamed
    Method cwq_ImageNamed = class_getClassMethod(self, @selector(cwq_ImageNamed:));

    //交换方法：runtime
    method_exchangeImplementations(imageNameMethod, cwq_ImageNamed);
}



+ (UIImage *)cwq_ImageNamed:(NSString *)name {

//此时两个方法已经交换
    UIImage *image = [UIImage cwq_ImageNamed:name];
    if (image) {
        NSLog(@"成功");
    }else {
    
    
        NSLog(@"失败");
    }
    return image;
}

@end
