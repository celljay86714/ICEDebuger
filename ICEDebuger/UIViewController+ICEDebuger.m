//
//  UIViewController+ICEDebuger.m
//  ICEDebuger
//
//  Created by iOS on 27/5/17.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "UIViewController+ICEDebuger.h"
#import <objc/runtime.h>
#import "ICEDebuger.h"

@implementation UIViewController (ICEDebuger)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method iceViewDidAppear = class_getInstanceMethod(self, @selector(iceViewDidAppear:));
        Method viewDidAppear    = class_getInstanceMethod(self, @selector(viewDidAppear:));
        method_exchangeImplementations(viewDidAppear, iceViewDidAppear);
        
        Method iceDealloc = class_getInstanceMethod(self, @selector(iceDealloc));
        Method dealloc    = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
        method_exchangeImplementations(dealloc, iceDealloc);
    });

}

- (void)iceViewDidAppear:(BOOL)animated {
    if(![self isPrivateVC]) {
        UILabel *label = (UILabel *)[ICEDebuger shareInstance].lblNote;
        if (label.superview) {
            [label.superview bringSubviewToFront:label];
        }
        if ([ICEDebuger shareInstance].strTitle == nil) {
            [ICEDebuger shareInstance].strTitle = @" ";
        }
        label.text = [NSString stringWithFormat:@"%@%@",[ICEDebuger shareInstance].strTitle,[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject];
    }
    [self iceViewDidAppear:animated];
}

- (void)iceDealloc {
    NSLog(@">>>>>>>>>>%@ 已经释放了<<<<<<<<<<",[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject);
    [self iceDealloc];
}

- (BOOL)isPrivateVC {
    NSString * selfClass = NSStringFromClass(self.class);
    return [selfClass isEqualToString:@"UIAlertController"] ||
    [selfClass isEqualToString:@"_UIAlertControllerTextFieldViewController"] ||
    [selfClass isEqualToString:@"UIApplicationRotationFollowingController"] ||
    [selfClass isEqualToString:@"UIInputWindowController"];
}

@end
