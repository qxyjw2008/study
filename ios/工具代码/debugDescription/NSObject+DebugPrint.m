//
//  NSObject+DebugPrint.m
//  testOC
//
//  Created by Benjamin on 1/5/16.
//  Copyright © 2016 Benjamin. All rights reserved.
//

#import "NSObject+DebugPrint.h"
#import <objc/runtime.h>
#import "Student.h"

@implementation NSObject (DebugPrint)

- (NSString *)debugDescription {
    if ([self isKindOfClass:[Student class]]) {
        return [self bc_debugDescription];
    }
    return [self debugDescription];
}

- (NSString *)bc_debugDescription {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    uint count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    for (int i = 0; i < count; i++) {
        objc_property_t property = properties[i];
        NSString *name = @(property_getName(property));
        id value = [self valueForKey:name]?:@"nil"; //默认为nil字符串
        [dictionary setValue:value forKey:name];    //装载到字典里
    }
    
    // 释放
    free(properties);
    return [NSString stringWithFormat:@"<%@: %p> -- %@", [self class], self, dictionary];
}

@end
