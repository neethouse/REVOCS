//
//  NSObject+RVXBinding.h
//  REVOCS
//
//  Created by mtmta on 2014/04/06.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RVXBindingDictionary.h"


@interface NSObject (RVXBinding)

- (RVXBindingDictionary *)rvx_bindings;

- (void)rvx_applyBindingValue:(RVXBinding *)binding forKeyPath:(NSString *)keyPath;

@end
