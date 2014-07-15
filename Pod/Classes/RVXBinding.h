//
//  RVXBinding.h
//  REVOCS
//
//  Created by mtmta on 2014/04/07.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "RVXBindingDelegate.h"


@interface RVXBinding : NSObject

@property (nonatomic, weak) id<RVXBindingDelegate> delegate;

- (id)value;

- (void)notifyChanged;

@end
