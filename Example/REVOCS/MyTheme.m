//
//  MyTheme.m
//  REVOCS
//
//  Created by mtmta on 2014/04/06.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import "MyTheme.h"

@implementation MyTheme

- (id)initLightTheme {
    self = [super init];
    if (self) {
        _type = kMyThemeTypeLight;
        
        _backgroundColor = [UIColor whiteColor];
        
        _foregroundColor = [UIColor blackColor];
        
        _textColor = [UIColor colorWithWhite:0.2 alpha:1];
        
        _buttonTitleColor = [UIColor redColor];
    }
    return self;
}

- (instancetype)initDarkTheme {
    self = [super init];
    if (self) {
        _type = kMyThemeTypeDark;
        
        _backgroundColor = [UIColor blackColor];
        
        _foregroundColor = [UIColor redColor];
        
        _textColor = [UIColor whiteColor];
        
        _buttonTitleColor = [UIColor yellowColor];
    }
    return self;
}

+ (void)toggle {
    
    MyTheme *current = [self rvx_sharedTheme];
    
    if (current.type != kMyThemeTypeDark) {
        [self rvx_setSharedTheme:[self.alloc initDarkTheme]];
        
    } else {
        [self rvx_setSharedTheme:[self.alloc initLightTheme]];
    }
}

@end
