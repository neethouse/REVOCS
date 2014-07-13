//
//  RVXBlockNotifier.h
//  REVOCS
//
//  Created by mtmta on 2014/07/11.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXNotifier.h"


typedef void (^RVXBlockNotifierNotifiedBlock)(id value);


@interface RVXBlockNotifier : RVXNotifier

- (instancetype)initWithBinding:(RVXBinding *)binding
                          block:(RVXBlockNotifierNotifiedBlock)block;

@property (nonatomic, readonly) RVXBlockNotifierNotifiedBlock block;

@end
