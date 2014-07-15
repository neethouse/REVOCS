//
//  RVXBinding+UIConvenienceFilter.m
//  Pods
//
//  Created by mtmta on 2014/04/06.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXBinding+UIConvenienceFilter.h"


@implementation RVXBinding (UIConvenienceFilter)

- (RVXFilteredBinding *)CGColorFilter {
    
    return [self filter:^id(UIColor *value) {
        
        NSAssert(value == nil || [value isKindOfClass:[UIColor class]],
                 @"The value %@ to be filtered by CGColorFilter must be UIColor. but %@", value, value.class);
        
        return (id)value.CGColor;
    }];
}

- (RVXFilteredBinding *)CGPathFilter {
    
    return [self filter:^id(UIBezierPath *value) {
        
        NSAssert(value == nil || [value isKindOfClass:[UIBezierPath class]],
                 @"The value %@ to be filtered by CGPathFilter must be UIBezierPath. but %@", value, value.class);
        
        return (id)value.CGPath;
    }];
}

@end
