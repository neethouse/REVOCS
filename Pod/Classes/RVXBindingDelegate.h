//
//  RVXBindingDelegate.h
//  REVOCS
//
//  Created by mtmta on 2014/04/07.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <Foundation/Foundation.h>


@class RVXBinding;

@protocol RVXBindingDelegate <NSObject>

- (void)rvx_didChangeBindingValue:(RVXBinding *)binding;

@end
