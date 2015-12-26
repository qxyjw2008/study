//
//  ViewController.h
//  PerformButton
//
//  Created by Benjamin on 12/26/15.
//  Copyright © 2015 Benjamin. All rights reserved.
//

#import <UIKit/UIKit.h>

#define directionDistance 100
#define rotateAngle M_PI_4
#define enlargementMultiple 1.2
#define reductionMultiple 0.8

@interface ViewController : UIViewController {
    CGRect originFrame;
}

@property (weak, nonatomic) IBOutlet UIButton *btn;

- (IBAction)controlDirection:(UIButton *)sender;

- (IBAction)rotateButton:(UIButton *)sender;

-(IBAction)scaleButton:(UIButton *)sender;

- (IBAction)reset:(UIButton *)sender;

@end

