//
//  ICEDebuger.m
//  ICEDebuger
//
//  Created by iOS on 27/5/17.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "ICEDebuger.h"

@interface ICEDebuger ()
@property (nonatomic, strong) UILabel *lblNote;
@end

@implementation ICEDebuger
+ (instancetype)shareInstance {
    static ICEDebuger *debuger = nil;
    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        debuger = ICEDebuger.new;
    });
    return debuger;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.strTitle = @"控制器:";
    }
    return self;
}

- (UILabel *)lblNote {
    if (!_lblNote) {
        _lblNote                           = UILabel.new;
        _lblNote.frame                     = CGRectMake(0, 16, UIScreen.mainScreen.bounds.size.width, 20);
        _lblNote.textColor                 = [UIColor whiteColor];
        _lblNote.adjustsFontSizeToFitWidth = YES;
        _lblNote.font                      = [UIFont systemFontOfSize:14];
        _lblNote.backgroundColor           = [UIColor blackColor];
    }
    if (!_lblNote.superview) {
        UIWindow * window = [[[UIApplication sharedApplication] delegate] window];
        if (window) {
            [window addSubview:_lblNote];
        }
    }
    return _lblNote;
}
@end
