//
//  FxPayPlugin.h
//  Uber
//
//  Created by Benjamin on 1/9/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UPPaymentControl.h"

@interface FxPayPlugin : NSObject

+ (BOOL)startPayFx: (NSString *)tn fromSchema:(NSString *)schemaStr
              mode:(NSString *)mode viewController:(UIViewController *)viewController;

@end
