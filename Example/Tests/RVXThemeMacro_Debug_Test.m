//
//  RVXThemeMacro_Debug_Test.m
//  REVOCS
//
//  Created by mtmta on 2014/07/14.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

// デバッグビルドとしてテスト
#define _RVX_DEBUG

#import <REVOCS/RVXThemeMacro.h>
#import <REVOCS/RVXBinding.h>
#import <REVOCS/NSObject+RVXBinding.h>

#import <XCTest/XCTest.h>

#import "TestTheme.h"


@interface RVXThemeMacro_Debug_Test : XCTestCase

@end

@implementation RVXThemeMacro_Debug_Test {
    
    TestTheme *_theme;
}

- (void)setUp {
    [super setUp];

    _theme = [TestTheme new];
    
    _theme.font = [UIFont systemFontOfSize:11];
    _theme.color = [UIColor blackColor];
    
    [TestTheme rvx_setSharedTheme:_theme];
}

- (void)tearDown {
    
    [TestTheme rvx_setSharedTheme:nil];
    [TestTheme2 rvx_setSharedTheme:nil];
    
    [super tearDown];
}

- (void)testThemeBinding {
    
    RVXBinding *binding = RVX_THEME_BINDING(TestTheme, font);
    
    {
        UIFont *font = binding.value;
        
        XCTAssertTrue([font isKindOfClass:[UIFont class]]);
        XCTAssertEqualWithAccuracy(font.pointSize, 11, 0.01);
    }
}

/**
 
 デバッグビルドではプロパティの存在チェックが行われる。
 そのため以下のコードはコンパイルエラーになる。
 
 */
/*
- (void)testPropertyCheck {
    
    // 存在しないプロパティを使おうとするとコンパイルエラー
    RVX_THEME_BINDING(TestTheme, hogehogehoge);
}
//*/

@end
