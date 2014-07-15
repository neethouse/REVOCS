
//
//  RVXSelectorNotifier.m
//  REVOCS
//
//  Created by mtmta on 2014/07/11.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXSelectorNotifier.h"

@implementation RVXSelectorNotifier

- (instancetype)initWithBinding:(RVXBinding *)binding
                         object:(id)object
                       selector:(SEL)selector {
    self = [super initWithBinding:binding];
    if (self) {
        _object = object;
        _selector = selector;
    }
    return self;
}

- (void)notify {

    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    
    [_object performSelector:_selector withObject:self.binding.value];
    
    #pragma clang diagnostic pop
}

@end
