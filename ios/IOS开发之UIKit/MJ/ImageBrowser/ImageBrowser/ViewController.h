//
//  ViewController.h
//  ImageBrowser
//
//  Created by Benjamin on 12/26/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define iconName @"icon"
#define descName @"title"
#define resources [NSArray arrayWithContentsOfFile: [[NSBundle mainBundle] pathForResource: @"imageData" ofType: @"plist"]]

@interface ViewController : UIViewController

- (IBAction)settingControl;

- (IBAction)sliderChanged:(UISlider *)sender;

- (IBAction)nightMode:(UISwitch *)sender;

- (IBAction)changeImageSize:(UISlider *)sender;

@property (weak, nonatomic) IBOutlet UIView *settingView;

@property (weak, nonatomic) IBOutlet UILabel *imageNO;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UILabel *imageDesc;

@end

