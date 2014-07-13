//
//  RVXBinding+Filter.h
//  REVOCS
//
//  Created by mtmta on 2014/07/15.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXBinding.h"
#import "RVXFilteredBinding.h"


@interface RVXBinding (Filter)

- (RVXFilteredBinding *)filter:(RVXFilterBlock)filterBlock;

@end
