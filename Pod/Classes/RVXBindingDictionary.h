//
//  RVXBindingDictionary.h
//  REVOCS
//
//  Created by mtmta on 2014/04/20.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RVXBinding.h"
#import "RVXBindingDelegate.h"


@interface RVXBindingDictionary : NSMutableDictionary <RVXBindingDelegate>

@property (nonatomic, readonly, weak) NSObject *target;

- (instancetype)initWithTarget:(NSObject *)target;

- (void)setBinding:(RVXBinding *)binding forKeyPath:(NSString *)keyPath;

@end
