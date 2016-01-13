//
//  ViewController.m
//  ImageBrowser
//
//  Created by Benjamin on 12/26/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

// 图片的名称
@property(nonatomic) NSString *imageName;

//图片的描述
@property(nonatomic) NSString *imageText;

@end

@implementation CALayer(Additions)

-(void)setBorderColorFromUIColor: (UIColor *)color {
    self.borderColor = color.CGColor;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setImageToIB: 0];
}

#pragma mark 更改layout后的页面布局
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self moveSettingView:NO animateDuration: 0.0];
}

/**
 *  移动settingView
 *
 *  @param isUp     是否弹出，消失设置为NO即可
 *  @param duration 弹出动画的时间间隔
 */
- (void)moveSettingView:(BOOL)isUp animateDuration:(float)duration {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: duration];
    CGPoint settingCenter = self.settingView.center;
    if (isUp) {
        settingCenter.y -= self.settingView.frame.size.height;
    } else {
        settingCenter.y += self.settingView.frame.size.height;
    }
    self.settingView.center = settingCenter;
    [UIView commitAnimations];
}

- (void)settingControl {
    if (self.settingView.frame.origin.y == self.view.frame.size.height) {
        [self moveSettingView: YES animateDuration: 0.5];
    } else {
        [self moveSettingView: NO animateDuration: 0.5];
    }
}

#pragma mark slider滑动时候调用
- (IBAction)sliderChanged:(UISlider *)sender {
    
    NSString *no = [NSString stringWithFormat:@"%.f", sender.value];
    
    [self setImageToIB:no.intValue];
    
}

#pragma mark 调节是否是夜间模式
- (void)nightMode:(UISwitch *)sender {
    if (sender.on) {
        [self.view setBackgroundColor: [UIColor grayColor]];
    } else {
        [self.view setBackgroundColor: [UIColor whiteColor]];
    }
}

#pragma mark 调节image的大小
- (IBAction)changeImageSize:(UISlider *)sender {
    self.imageView.transform = CGAffineTransformMakeScale(sender.value, sender.value);
}

#pragma mark 通过index设置图片到IB上
- (void)setImageToIB:(int)index {
    NSDictionary *dic = (NSDictionary *)[resources objectAtIndex: index];
    
    // 取得plist的名称和描述
    _imageName = [dic objectForKey: iconName];
    _imageText = [dic objectForKey: descName];
    
    // 设置图片
    UIImage *image = [UIImage imageNamed: _imageName];
    _imageView.image = image;
    
    // 设置图片编号
    NSString *imageNo = [NSString stringWithFormat:@"%d/16", index + 1];
    _imageNO.text = imageNo;
    
    // 设置图片描述
    _imageDesc.text = _imageText;
    
}

@end
