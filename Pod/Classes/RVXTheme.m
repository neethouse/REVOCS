//
//  RVXTheme.m
//  REVOCS
//
//  Created by mtmta on 2014/07/13.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXTheme.h"
#import <objc/runtime.h>
#import "RVXKeyValueBinding.h"


static const int kSharedThemeAssociationKey;

#define kSharedThemeKeyPath @"rvx_sharedTheme"


@implementation RVXTheme

- (instancetype)rvx_self {
    return self;
}

- (RVXBinding *)rvx_bindingForKeyPath:(NSString *)keyPath {
    
    if ([keyPath isEqualToString:@"rvx_self"]) {
        return [self.class rvx_bindingForSharedTheme];
    }
    
    return [self rvx_bindingForPropertyWithKeyPath:keyPath];
}

- (RVXBinding *)rvx_bindingForPropertyWithKeyPath:(NSString *)keyPath {
    
    NSString *fullPath = [kSharedThemeKeyPath @"." stringByAppendingString:keyPath];
    
    return [RVXKeyValueBinding.alloc initWithObject:self.class
                                            keyPath:fullPath];
}

+ (RVXBinding *)rvx_bindingForSharedTheme {
    
    return [RVXKeyValueBinding.alloc initWithObject:self
                                            keyPath:kSharedThemeKeyPath];
}

+ (instancetype)rvx_sharedTheme {
    
    RVXTheme *theme = objc_getAssociatedObject(self, &kSharedThemeAssociationKey);
    
    NSAssert(theme != nil, @"%@.%@ not set", self, kSharedThemeKeyPath);
    
    return theme;
}

+ (void)rvx_setSharedTheme:(RVXTheme *)theme {
    
    if (theme) {
        NSAssert([theme isMemberOfClass:self], @"Shared theme must be same class. (expect: %@, but: %@)", self, theme.class);
    }
    
    [self willChangeValueForKey:kSharedThemeKeyPath];
    
    objc_setAssociatedObject(self, &kSharedThemeAssociationKey, theme, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [self didChangeValueForKey:kSharedThemeKeyPath];
}

@end
