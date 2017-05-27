//
//  ICEDebuger.h
//  ICEDebuger
//
//  Created by iOS on 27/5/17.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface ICEDebuger : NSObject
+ (instancetype)shareInstance;


/// 自定义要显示的信息
@property (nonatomic, copy)NSString * strTitle;

/// 显示信息标签
@property (nonatomic, strong, readonly)UILabel * lblNote;

@end
