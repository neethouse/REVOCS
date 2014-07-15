//
//  RVXBinding+UIConvenienceFilter.h
//  Pods
//
//  Created by mtmta on 2014/04/06.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RVXBinding+Filter.h"


@interface RVXBinding (UIConvenienceFilter)

- (RVXFilteredBinding *)CGColorFilter;

- (RVXFilteredBinding *)CGPathFilter;

@end
