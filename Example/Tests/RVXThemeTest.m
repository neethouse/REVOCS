//
//  RVXThemeTest.m
//  REVOCS
//
//  Created by mtmta on 2014/07/14.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <REVOCS/RVXTheme.h>

#import <XCTest/XCTest.h>
#import <OCMock.h>

#import "TestTheme.h"


@interface RVXThemeTest : XCTestCase

@end

@implementation RVXThemeTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    
    [TestTheme rvx_setSharedTheme:nil];
    [TestTheme2 rvx_setSharedTheme:nil];
    
    [super tearDown];
}

/**
 
 RVXTheme のサブクラスごとに sharedTheme を設定できるか
 
 */
- (void)testSharedTheme {

    TestTheme *t1 = [TestTheme new];
    [TestTheme rvx_setSharedTheme:t1];
    
    TestTheme2 *t2 = [TestTheme2 new];
    [TestTheme2 rvx_setSharedTheme:t2];
    
    XCTAssertEqual([TestTheme rvx_sharedTheme], t1);
    XCTAssertEqual([TestTheme2 rvx_sharedTheme], t2);
}

/**
 
 プロパティに対する binding がちゃんと動くか。
 
 - binding.value で指定した keyPath の値が取得できる
 - bind したプロパティが変更された時に通知される
 - rvx_sharedThemee が変更された時に通知される
 
 */
- (void)testPropertyBinding {
    
    TestTheme *t1;
    RVXBinding *binding;
    id mockDelegate;
    
    { // 準備
        
        t1 = [TestTheme new];
        t1.font = [UIFont systemFontOfSize:11];
        [TestTheme rvx_setSharedTheme:t1];
        
        binding = [t1 rvx_bindingForPropertyWithKeyPath:@"font"];
        
        mockDelegate = [OCMockObject mockForProtocol:@protocol(RVXBindingDelegate)];
        binding.delegate = mockDelegate;
    }

    { // 指定した keyPath の値が取得できる

        XCTAssertNotNil(binding);
        
        UIFont *font = binding.value;
        XCTAssertTrue([font isKindOfClass:[UIFont class]]);
        XCTAssertEqualWithAccuracy(font.pointSize, 11, 0.01);
    }
    
    { // プロパティが変更された時に通知される
        
        [[mockDelegate expect] rvx_didChangeBindingValue:[OCMArg checkWithBlock:^BOOL(RVXBinding *binding) {
            
            // 変更後の値が取得できる
            UIFont *font = binding.value;
            XCTAssertTrue([font isKindOfClass:[UIFont class]]);
            XCTAssertEqualWithAccuracy(font.pointSize, 22, 0.01);
            
            return YES;
        }]];
        
        t1.font = [UIFont systemFontOfSize:22];
        
        XCTAssertNoThrow([mockDelegate verify]);
    }
    
    { // rvx_sharedTheme が変更された時に通知される
        
        [[mockDelegate expect] rvx_didChangeBindingValue:[OCMArg checkWithBlock:^BOOL(RVXBinding *binding) {
            
            // 変更後の値が取得できる
            UIFont *font = binding.value;
            XCTAssertTrue([font isKindOfClass:[UIFont class]]);
            XCTAssertEqualWithAccuracy(font.pointSize, 33, 0.01);
            
            return YES;
        }]];
        
        TestTheme *t2 = [TestTheme new];
        t2.font = [UIFont systemFontOfSize:33];
        
        [TestTheme rvx_setSharedTheme:t2];
        
        XCTAssertNoThrow([mockDelegate verify]);
    }
}

/**
 
 sharedTheme に対する binding がちゃんと動くか。
 
 - binding.value でテーマオブジェクトが取得できる
 - rvx_sharedThemee が変更された時に通知される
 
 */
- (void)testSharedThemeBinding {
    
    TestTheme *t1;
    RVXBinding *binding;
    id mockDelegate;
    
    { // 準備
        
        t1 = [TestTheme new];
        t1.font = [UIFont systemFontOfSize:11];
        [TestTheme rvx_setSharedTheme:t1];
        
        binding = [TestTheme rvx_bindingForSharedTheme];
        
        mockDelegate = [OCMockObject mockForProtocol:@protocol(RVXBindingDelegate)];
        binding.delegate = mockDelegate;
    }
    
    { // テーマオブジェクトが取得できる
        
        XCTAssertNotNil(binding);
        
        XCTAssertEqual(binding.value, t1);
    }
    
    { // rvx_sharedTheme が変更された時に通知される
        
        [[mockDelegate expect] rvx_didChangeBindingValue:[OCMArg checkWithBlock:^BOOL(RVXBinding *binding) {
            
            // 変更後の値が取得できる
            TestTheme *t2 = binding.value;
            XCTAssertNotEqual(t2, t1, @"インスタンスが変わってる");
            
            XCTAssertEqualWithAccuracy(t2.font.pointSize, 33, 0.01);
            
            return YES;
        }]];
        
        TestTheme *t2 = [TestTheme new];
        t2.font = [UIFont systemFontOfSize:33];
        
        [TestTheme rvx_setSharedTheme:t2];
        
        XCTAssertNoThrow([mockDelegate verify]);
    }
}

/**
 
 プロパティに対する binding と　rvx_sharedTheme に対する binding の切り替えができるか。
 
 */
- (void)testBinding {
    
    TestTheme *t1;
    
    { // 準備
        
        t1 = [TestTheme new];
        t1.font = [UIFont systemFontOfSize:11];
        [TestTheme rvx_setSharedTheme:t1];
    }
    
    { // プロパティに対する binding
        
        RVXBinding *binding = [t1 rvx_bindingForKeyPath:@"font"];
        
        XCTAssertTrue([binding.value isKindOfClass:[UIFont class]], @"プロパティの値が取得できてる");
    }
    
    { // sharedTheme に対する binding
        
        RVXBinding *binding = [t1 rvx_bindingForKeyPath:@"rvx_self"];
        
        XCTAssertTrue([binding.value isKindOfClass:[TestTheme class]], @"sharedTheme が取得できる");
    }
}

/**
 
 rvx_self でテーマオブジェクト自身が取得できる
 
 */
- (void)testSelf {
    
    TestTheme *t1;
    
    { // 準備
        
        t1 = [TestTheme new];
        [TestTheme rvx_setSharedTheme:t1];
    }
    
    XCTAssertEqual(t1.rvx_self, t1);
}

@end
