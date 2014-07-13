//
//  RVXBindingDictionary.m
//  REVOCS
//
//  Created by mtmta on 2014/04/20.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXBindingDictionary.h"

#import "NSObject+RVXBinding.h"


@implementation RVXBindingDictionary {
    
    NSMutableDictionary *_bindings;
}

- (instancetype)initWithTarget:(NSString *)target {
    self = [super init];
    if (self) {
        _target = target;
        _bindings = [NSMutableDictionary new];
    }
    return self;
}

- (NSUInteger)count {
    return [_bindings count];
}

- (id)objectForKey:(id)aKey {
    return [_bindings objectForKey:aKey];
}

- (NSEnumerator *)keyEnumerator {
    return [_bindings keyEnumerator];
}

- (void)setBinding:(RVXBinding *)binding forKeyPath:(NSString *)keyPath {
    
    binding.delegate = self;
    
    _bindings[keyPath] = binding;
    
    [_target rvx_applyBindingValue:binding forKeyPath:keyPath];
}

- (void)setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    
    NSAssert([anObject isKindOfClass:[RVXBinding class]], @"anObject '%@' must be RVXBinding but %@", anObject, [anObject class]);
    NSAssert([(id)aKey isKindOfClass:[NSString class]], @"aKey '%@' must be string but %@", aKey, [(id)aKey class]);
    
    RVXBinding *binding = (RVXBinding *)anObject;
    NSString *keyPath = (NSString *)aKey;
    
    [self setBinding:binding forKeyPath:keyPath];
}

- (void)removeObjectForKey:(id)aKey {
    [_bindings removeObjectForKey:aKey];
}

- (void)rvx_didChangeBindingValue:(RVXBinding *)binding {
    
    for (NSString *keyPath in [_bindings allKeysForObject:binding]) {
        
        [_target rvx_applyBindingValue:binding forKeyPath:keyPath];
    }
}

@end
