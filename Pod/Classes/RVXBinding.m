//
//  RVXBinding.m
//  REVOCS
//
//  Created by mtmta on 2014/04/07.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXBinding.h"

@implementation RVXBinding

- (id)value {
    return nil;
}

- (void)notifyChanged {
    [_delegate rvx_didChangeBindingValue:self];
}

@end
