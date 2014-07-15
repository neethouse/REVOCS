//
//  RVXKeyValueBinding.h
//  REVOCS
//
//  Created by mtmta on 2014/04/07.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "RVXBinding.h"

@interface RVXKeyValueBinding : RVXBinding

- (instancetype)initWithObject:(id)object
                       keyPath:(NSString *)keyPath;

@property (nonatomic, readonly) id object;

@property (nonatomic, readonly) NSString *keyPath;

@end
