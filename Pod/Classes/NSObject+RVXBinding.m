//
//  NSObject+RVXBinding.m
//  REVOCS
//
//  Created by mtmta on 2014/04/06.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "NSObject+RVXBinding.h"
#import <objc/runtime.h>


static int kRVXBindingDictionaryAssociationKey;


@implementation NSObject (RVXBinding)

- (RVXBindingDictionary *)rvx_bindings {
    
    RVXBindingDictionary *bindings = objc_getAssociatedObject(self, &kRVXBindingDictionaryAssociationKey);
    
    if (bindings == nil) {
        bindings = [[RVXBindingDictionary alloc] initWithTarget:self];
        objc_setAssociatedObject(self, &kRVXBindingDictionaryAssociationKey, bindings, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return bindings;
}

- (void)rvx_applyBindingValue:(RVXBinding *)binding forKeyPath:(NSString *)keyPath {
    [self setValue:binding.value forKeyPath:keyPath];
}

@end
