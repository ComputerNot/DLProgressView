//
//  DLProgressView.h
//  TestMeProgress
//
//  Created by John on 2016/10/20.
//  Copyright © 2016年 lingda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DLProgressView : UIView
typedef NS_ENUM(NSInteger, HudAnimationType){
    HudAnimationTypeGif = 0,    //Gif格式
    HudAnimationTypeImageSpin,  //图片翻转
    HudAnimationTypeImageSwitch //图片切换
};

@property (strong, nonatomic) UIView *mainView;
@property (strong, nonatomic) UIImageView *hudImageView;
@property (strong, nonatomic) UILabel *alertLabel;
@property (nonatomic) HudAnimationType animationType;
@property (strong, nonatomic) UIImage *spinImage;
@property (strong, nonatomic) NSArray *switchImages;

- (void)show;
- (void)hide;

+ (instancetype)addToView:(UIView *)view alertText:(NSString *)title animationType:(HudAnimationType)animationType;
@end
