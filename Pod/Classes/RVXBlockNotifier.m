//
//  RVXBlockNotifier.m
//  REVOCS
//
//  Created by mtmta on 2014/07/11.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXBlockNotifier.h"

@implementation RVXBlockNotifier

- (instancetype)initWithBinding:(RVXBinding *)binding block:(RVXBlockNotifierNotifiedBlock)block {
    self = [super initWithBinding:binding];
    if (self) {
        _block = block;
    }
    return self;
}

- (void)notify {
    _block(self.binding.value);
}

@end
