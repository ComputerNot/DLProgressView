//
//  DLProgressView.m
//  TestMeProgress
//
//  Created by John on 2016/10/20.
//  Copyright © 2016年 lingda. All rights reserved.
//

#import "DLProgressView.h"
#import "UIImage+JHUD.h"

#define MAIN_VIEW_WIDTH   130

#define VERTICAL_MARGIN      5
#define HORIZONTAL_MARGIN  7.5

@implementation DLProgressView
{
    NSTimer *_timer;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Get
- (UIView *)mainView
{
    if (!_mainView) {
        _mainView = [[UIView alloc] initWithFrame:CGRectMake(self.center.x - MAIN_VIEW_WIDTH / 2, self.center.y - MAIN_VIEW_WIDTH / 2, MAIN_VIEW_WIDTH, MAIN_VIEW_WIDTH)];
        _mainView.backgroundColor = [[UIColor alloc] initWithWhite:.5 alpha:.5];
        _mainView.backgroundColor = [UIColor clearColor];
        [_mainView addSubview:self.hudImageView];
        [_mainView addSubview:self.alertLabel];
    }
    return _mainView;
}
- (UIImageView *)hudImageView
{
    if (!_hudImageView) {
        _hudImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 5, MAIN_VIEW_WIDTH-30, MAIN_VIEW_WIDTH-30)];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"loadinggif4" ofType:@"gif"];
        NSData *data = [NSData dataWithContentsOfFile:path];
        _hudImageView.image = [UIImage jHUDImageWithSmallGIFData:data scale:1];
    }
    return _hudImageView;
}

- (UILabel *)alertLabel
{
    if (!_alertLabel) {
        _alertLabel = [[UILabel alloc] initWithFrame:CGRectMake(HORIZONTAL_MARGIN, MAIN_VIEW_WIDTH-30, MAIN_VIEW_WIDTH-HORIZONTAL_MARGIN*2, 25)];
        _alertLabel.textAlignment = NSTextAlignmentCenter;
//        _alertLabel.textColor = [UIColor whiteColor];
    }
    return _alertLabel;
}

#pragma mark - Set
//- (void)setAnimationType:(HudAnimationType)animationType
//{
//    
//}

- (void)setSpinImage:(UIImage *)spinImage
{
    _spinImage = spinImage;
    if (self.animationType == HudAnimationTypeImageSpin) {
        self.hudImageView.image = spinImage;
        self.hudImageView.bounds = CGRectMake(0, 0, 50, 50);
//        if (!_timer) {
            _timer = [NSTimer scheduledTimerWithTimeInterval:.008 target:self selector:@selector(hudImageSpin) userInfo:nil repeats:YES];
//        }

    }
}

- (void)setSwitchImages:(NSArray *)switchImages
{
    _switchImages = switchImages;
    if (self.animationType == HudAnimationTypeImageSwitch) {
        self.hudImageView.bounds = CGRectMake(0, 0, 50, 50);
        _timer = [NSTimer scheduledTimerWithTimeInterval:.02 target:self selector:@selector(hudImageSwitch) userInfo:nil repeats:YES];
    }
}
#pragma mark - Control
- (void)show
{
    [self addSubview:self.mainView];
}

- (void)hide
{
    if (_timer.isValid) {
        [_timer invalidate];
    }
    _timer = nil;
    [self removeFromSuperview];
}

/*
 *图片翻转
 */
- (void)hudImageSpin
{
    static float angle = 0;
    angle = angle + 0.06;//angle角度 double angle;
    if (angle > 6.28) {//大于 M_PI*2(360度) 角度再次从0开始
        angle = 0;
    }
    CGAffineTransform transForm = CGAffineTransformMakeRotation(angle);
    self.hudImageView.transform = transForm;
}

/*
 * 图片切换
 */
- (void)hudImageSwitch
{
    static float index = 0;
    if (index == self.switchImages.count) {
        index = 0;
    }
//    [UIView animateWithDuration:0.019 animations:^{
        self.hudImageView.image = [self.switchImages objectAtIndex:index];
//    }];
    index = index + 1;//angle角度 double angle;
}

#pragma mark - + Method
+ (instancetype)addToView:(UIView *)view alertText:(NSString *)title animationType:(HudAnimationType)animationType
{
    //添加progressView到view上
    DLProgressView *progressView = [[DLProgressView alloc] initWithFrame:view.frame];
    progressView.backgroundColor = [UIColor clearColor];
    [view addSubview:progressView];
    [progressView show];

    //设置progressView属性
    progressView.alertLabel.text = title;
    progressView.animationType = animationType;
    return progressView;
}

@end
