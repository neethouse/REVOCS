//
//  RVXKeyValueBinding.m
//  REVOCS
//
//  Created by mtmta on 2014/04/07.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXKeyValueBinding.h"

@implementation RVXKeyValueBinding

- (instancetype)initWithObject:(id)object keyPath:(NSString *)keyPath {
    self = [super init];
    if (self) {
        _object = object;
        _keyPath = keyPath;
        
        [object addObserver:self forKeyPath:keyPath options:0 context:NULL];
    }
    return self;
}

- (void)dealloc {
    [_object removeObserver:self forKeyPath:_keyPath];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self notifyChanged];
}

- (id)value {
    return [_object valueForKeyPath:_keyPath];
}

@end
