//
//  ViewController.m
//  TestProgressMeTwo
//
//  Created by John on 2016/10/20.
//  Copyright © 2016年 lingda. All rights reserved.
//

#import "ViewController.h"
#import "DLProgressView.h"
@interface ViewController ()
{
    DLProgressView *_progressView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _progressView = [DLProgressView addToView:self.view alertText:@"麻辣隔壁" animationType:HudAnimationTypeImageSwitch];
//    [self testTwo];
    [self testThree];
    [self performSelector:@selector(hiddenProgress) withObject:nil afterDelay:70];
}

- (void)testTwo{
    _progressView.spinImage = [UIImage imageNamed:@"2"];
}

- (void)testThree{
    NSMutableArray *images = [NSMutableArray array];
    for (int i = 0; i < 20; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%d", i];
        UIImage *image = [UIImage imageNamed:imageName];
        [images addObject:image];
    }
    _progressView.switchImages = images;
}

- (void)hiddenProgress
{
    [_progressView hide];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
