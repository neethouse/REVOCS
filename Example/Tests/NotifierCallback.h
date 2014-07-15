//
//  NotifierCallback.h
//  REVOCS
//
//  Created by mtmta on 2014/07/13.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NotifierCallback <NSObject>

- (void)rvxt_didNotify:(id)value;

@end
