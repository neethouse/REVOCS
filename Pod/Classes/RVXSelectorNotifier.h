//
//  RVXSelectorNotifier.h
//  REVOCS
//
//  Created by mtmta on 2014/07/11.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXNotifier.h"

@interface RVXSelectorNotifier : RVXNotifier

- (instancetype)initWithBinding:(RVXBinding *)binding
                         object:(id)object
                       selector:(SEL)selector;

@property (nonatomic, readonly) id object;

@property (nonatomic, readonly) SEL selector;

@end
