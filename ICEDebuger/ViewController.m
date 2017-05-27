//
//  ViewController.m
//  ICEDebuger
//
//  Created by iOS on 27/5/17.
//  Copyright © 2017年 iOS. All rights reserved.
//

#import "ViewController.h"

@interface ICEViewController ()
@end

@implementation ICEViewController

@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [NSTimer scheduledTimerWithTimeInterval:5 repeats:NO block:^(NSTimer * _Nonnull timer) {
        ICEViewController *vc = [[ICEViewController alloc]init];
        vc.view.backgroundColor = [UIColor whiteColor];
        [self presentViewController:vc animated:YES completion:nil];
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
