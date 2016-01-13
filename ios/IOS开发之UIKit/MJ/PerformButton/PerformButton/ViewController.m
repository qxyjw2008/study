//
//  ViewController.m
//  PerformButton
//
//  Created by Benjamin on 12/26/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    originFrame = _btn.frame;
}

#pragma mark 按钮点击动画公共方法
- (void)btnClickWithBlock:(void (^)())block
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration: 1.0];
    
    block();
    
    [UIView commitAnimations];
}

#pragma mark 改变方向
- (void)controlDirection:(UIButton *)sender {
    [self btnClickWithBlock:^{
        CGRect tempFrame = _btn.frame;
        switch (sender.tag) {
            case 1:
                tempFrame.origin.y -= directionDistance;
                break;
            case 2:
                tempFrame.origin.y += directionDistance;
                break;
            case 3:
                tempFrame.origin.x -= directionDistance;
                break;
            case 4:
                tempFrame.origin.x += directionDistance;
                break;
            default:
            break;
        }
        _btn.frame = tempFrame;
    }];
}

#pragma mark 旋转
- (void)rotateButton:(UIButton *)sender {
    
    [self btnClickWithBlock:^{
        CGFloat angle = sender.tag == 11 ? (-rotateAngle) : rotateAngle;
        _btn.transform = CGAffineTransformRotate(_btn.transform, angle);
    }];
    
}

#pragma mark 缩放
- (void)scaleButton:(UIButton *)sender {
    
    [self btnClickWithBlock:^{
        CGFloat scaleMultiple = sender.tag == 21 ? enlargementMultiple : reductionMultiple;
        _btn.transform = CGAffineTransformScale(_btn.transform, scaleMultiple, scaleMultiple);
    }];
    
}

- (IBAction)reset:(UIButton *)sender {
    
    _btn.frame = originFrame;
    [self btnClickWithBlock:^{
        _btn.transform = CGAffineTransformIdentity;
    }];
}

@end
