//
//  RVXFilteredBinding.h
//  REVOCS
//
//  Created by mtmta on 2014/07/15.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXBinding.h"


typedef id (^RVXFilterBlock)(id value);


@interface RVXFilteredBinding : RVXBinding <RVXBindingDelegate>

- (instancetype)initWithSourceBinding:(RVXBinding *)sourceBinding filter:(RVXFilterBlock)filterBlock;

@property (nonatomic, readonly) RVXBinding *sourceBinding;

@property (nonatomic, readonly) RVXFilterBlock filterBlock;

@end
