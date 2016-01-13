//
//  ViewController.m
//  TomCat
//
//  Created by Benjamin on 12/29/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

#import "ViewController.h"

#define path [[NSBundle mainBundle] pathForResource: @"tomAnimations" ofType: @"plist"]

@interface ViewController () {
    
    NSDictionary *animationDic;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    animationDic = [NSDictionary dictionaryWithContentsOfFile: path];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)playAnimation: (int)imageCount imageNamePrefix: (NSString *)prefix {
    NSMutableArray *images = [NSMutableArray array];
    
    for (int i = 0; i < imageCount; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%@%04d.jpg", prefix, i];
        // 内存不会被释放，如果只使用一次尽量不要使用
//        UIImage *image = [UIImage imageNamed: imageName];
        // release后立即释放，一般用在封面等图比较大的地方。
//        UIImage *image = [[UIImage alloc] initWithContentsOfFile: imageName];
        NSString *fullPath = [[NSBundle mainBundle] pathForResource: imageName ofType:nil];
        UIImage *image = [UIImage imageWithContentsOfFile: fullPath];
        [images addObject: image];
    }
    
    [_tom setAnimationImages: images];
    [_tom setAnimationDuration: 0.1 * imageCount];
    _tom.animationRepeatCount = 1;
    [_tom startAnimating];
}

- (IBAction)play:(UIButton *)sender {
    NSString *title = [sender titleForState: UIControlStateNormal];
    int imageCount = [animationDic[title] intValue];
    NSString *prefix = [NSString stringWithFormat: @"cat_%@", title];
    
    [self playAnimation: imageCount imageNamePrefix: prefix];
}

@end
