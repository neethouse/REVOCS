//
//  RVXNotifier.m
//  REVOCS
//
//  Created by mtmta on 2014/07/11.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXNotifier.h"

@implementation RVXNotifier

- (instancetype)initWithBinding:(RVXBinding *)binding {
    self = [super init];
    if (self) {
        _binding = binding;
        _binding.delegate = self;
    }
    return self;
}

- (void)notify {
    // do nothing
}

- (void)rvx_didChangeBindingValue:(RVXBinding *)binding {
    [self notify];
}

@end
