//
//  RVXThemeMacro_Release_Test.m
//  REVOCS
//
//  Created by mtmta on 2014/07/15.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

// リリースビルドとしてテスト
#define _RVX_RELEASE

#import <REVOCS/RVXThemeMacro.h>
#import <REVOCS/RVXBinding.h>
#import <REVOCS/NSObject+RVXBinding.h>

#import <XCTest/XCTest.h>

#import "TestTheme.h"


@interface RVXThemeMacro_Release_Test : XCTestCase

@end

@implementation RVXThemeMacro_Release_Test {
    
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
 
 リリースビルドではプロパティの存在チェックが行われない
 
 */
 - (void)testPropertyCheck {
 
     // 存在しないプロパティでもエラーにならない
     RVX_THEME_BINDING(TestTheme, hogehogehoge);
}

@end
