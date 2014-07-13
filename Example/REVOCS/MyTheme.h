//
//  MyTheme.h
//  REVOCS
//
//  Created by mtmta on 2014/04/06.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <REVOCS/RVXTheme.h>


#define MyThemeBinding(_themeKeyPath) \
    RVX_THEME_BINDING(MyTheme, _themeKeyPath)


typedef NS_ENUM(int, MyThemeType) {
    kMyThemeTypeLight,
    kMyThemeTypeDark,
};


@interface MyTheme : RVXTheme

- (instancetype)initLightTheme;

- (instancetype)initDarkTheme;

@property (nonatomic, readonly) MyThemeType type;

@property (nonatomic, readonly) UIColor *backgroundColor;

@property (nonatomic, readonly) UIColor *foregroundColor;

@property (nonatomic, readonly) UIColor *buttonTitleColor;

@property (nonatomic, readonly) UIColor *textColor;

+ (void)toggle;

@end
