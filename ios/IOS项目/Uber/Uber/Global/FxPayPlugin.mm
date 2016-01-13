//
//  FxPayPlugin.m
//  Uber
//
//  Created by Benjamin on 1/9/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

#import "FxPayPlugin.h"

@implementation FxPayPlugin

+ (BOOL)startPayFx:(NSString *)tn fromSchema:(NSString *)schemaStr mode:(NSString *)mode viewController:(UIViewController *)viewController {
    return [[UPPaymentControl defaultControl] startPay:tn fromScheme:schemaStr mode:mode viewController:viewController];
}

@end
