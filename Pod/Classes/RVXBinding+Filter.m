//
//  RVXBinding+Filter.m
//  REVOCS
//
//  Created by mtmta on 2014/07/15.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXBinding+Filter.h"

@implementation RVXBinding (Filter)

- (RVXFilteredBinding *)filter:(RVXFilterBlock)filterBlock {
    
    return [RVXFilteredBinding.alloc initWithSourceBinding:self
                                                    filter:filterBlock];
}

@end
