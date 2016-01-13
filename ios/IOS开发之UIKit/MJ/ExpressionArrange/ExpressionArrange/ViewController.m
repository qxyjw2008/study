//
//  ViewController.m
//  ExpressionArrange
//
//  Created by Benjamin on 12/27/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

#import "ViewController.h"

#define imageWH 50
#define imageNumber 20

@interface ViewController ()

- (int)getImageViewCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustImagePosition:2];
}

#pragma mark click segement
- (IBAction)changeImageArrange:(UISegmentedControl *)sender {
    
    int column = (int)sender.selectedSegmentIndex + 2;
    [self adjustImagePosition:column];
}

-(void)adjustImagePosition:(int)numOfColumn {
    int column = numOfColumn;
    CGFloat margin = (self.view.frame.size.width - column * imageWH) / (column + 1);
    
    int oneX = margin;
    int oneY = 100;
    NSString *imageName;
    
    int imageViewNums = [self getImageViewCount];
    for (int i = 0; i < imageNumber; i++) {
        // 所在第几列
        int col = i % column;
        // 所在第几行
        int row = i / column ;
        
        CGFloat x = oneX + col * (imageWH + margin);
        CGFloat y = oneY + row * (imageWH + margin);
        
        if (imageViewNums == imageNumber) {
            // change
            UIView *imageView = self.view.subviews[i + 3];
            NSLog(@"%@", imageView.class);
            CGRect tempFrame = imageView.frame;
            tempFrame.origin = CGPointMake(x, y);
            imageView.frame = tempFrame;
        } else {
            // add
            imageName = [NSString stringWithFormat: @"biaoqing_0%02d.png", i + 1];
            [self addImageView: imageName x:x y:y];
        }
    }
}

- (int)getImageViewCount {
    int imageViewNums = 0;
    for (int i = 0; i < self.view.subviews.count; i++) {
        if ([self.view.subviews[i] isKindOfClass: UIImageView.class]) {
            imageViewNums++;
        }
    }
    return imageViewNums;
}

/**
 *  添加表情到view中
 *
 *  @param iconName 图片名称
 *  @param x        所在的x位置
 *  @param y        所在的y位置
 */
- (void)addImageView:(NSString *)iconName x:(CGFloat)x y:(CGFloat)y {
    UIImageView *imageView = [[UIImageView alloc]initWithFrame: CGRectMake(x, y, imageWH, imageWH)];
    imageView.image = [UIImage imageNamed: iconName];
    [self.view addSubview: imageView];
}

@end
