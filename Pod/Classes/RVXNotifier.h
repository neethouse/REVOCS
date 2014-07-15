//
//  RVXNotifier.h
//  REVOCS
//
//  Created by mtmta on 2014/07/11.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RVXBinding.h"


@interface RVXNotifier : NSObject <RVXBindingDelegate>

- (instancetype)initWithBinding:(RVXBinding *)binding;

@property (nonatomic, readonly) RVXBinding *binding;

- (void)notify;

@end
