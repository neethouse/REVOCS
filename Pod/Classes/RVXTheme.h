//
//  RVXTheme.h
//  Pods
//
//  Created by mtmta on 2014/07/13.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RVXBinding.h"


@interface RVXTheme : NSObject

- (instancetype)rvx_self;

- (RVXBinding *)rvx_bindingForKeyPath:(NSString *)keyPathOrSelf;

- (RVXBinding *)rvx_bindingForPropertyWithKeyPath:(NSString *)keyPath;

+ (RVXBinding *)rvx_bindingForSharedTheme;

+ (instancetype)rvx_sharedTheme;

+ (void)rvx_setSharedTheme:(RVXTheme *)theme;

@end
