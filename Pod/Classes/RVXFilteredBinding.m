//
//  RVXFilteredBinding.m
//  REVOCS
//
//  Created by mtmta on 2014/07/15.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXFilteredBinding.h"

@implementation RVXFilteredBinding

- (instancetype)initWithSourceBinding:(RVXBinding *)sourceBinding filter:(RVXFilterBlock)filterBlock {
    self = [super init];
    if (self) {
        _sourceBinding = sourceBinding;
        _filterBlock = filterBlock;
        
        sourceBinding.delegate = self;
    }
    return self;
}

- (void)rvx_didChangeBindingValue:(RVXBinding *)binding {
    [self.delegate rvx_didChangeBindingValue:self];
}

- (id)value {
    return _filterBlock(_sourceBinding.value);
}

@end
