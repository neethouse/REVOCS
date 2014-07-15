//
//  RVXKeyValueBindingTest.m
//  REVOCS
//
//  Created by mtmta on 2014/07/13.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <REVOCS/RVXKeyValueBinding.h>

#import <XCTest/XCTest.h>
#import <OCMock.h>
#import "Student.h"


@interface RVXKeyValueBindingTest : XCTestCase
@end

@implementation RVXKeyValueBindingTest {
}

/**
 
 KVO 開始・終了処理がちゃんと行われるか。
 
 - binding 生成時に addObserver... が呼ばれる
 - 解放時に removeObserver... が呼ばれる
 - それらのメソッドに binding が渡されてる
 
 */
- (void)testKVO_add_remove {
    
    id mock = [OCMockObject partialMockForObject:[Student new]];
    
    RVXKeyValueBinding *binding;
    
    { // 生成時に addObserver される
        
        // 引数として binding が渡されてるか
        __block void *observer = NULL;
        
        [[[[[mock expect] andDo:^(NSInvocation *i){
            [i getArgument:&observer atIndex:2];
        }] andForwardToRealObject] ignoringNonObjectArgs] addObserver:OCMOCK_ANY forKeyPath:@"name" options:0 context:NULL];

        binding = [RVXKeyValueBinding.alloc initWithObject:mock
                                                   keyPath:@"name"];
        
        XCTAssertNoThrow([mock verify]);
        
        XCTAssertEqual(observer, (__bridge void *)binding);
    }
    
    { // 解放時に removeObserver
        
        // 引数として binding が渡されてるか
        __block void *observer = NULL;
        void *pBinding = (__bridge void *)binding;

        [[[[mock expect] andDo:^(NSInvocation *i) {
            [i getArgument:&observer atIndex:2];
        }] andForwardToRealObject] removeObserver:OCMOCK_ANY forKeyPath:@"name"];
        
        __weak id wBinding = binding;

        binding = nil;
        
        XCTAssertNil(wBinding);
        
        XCTAssertNotEqual(observer, NULL);
        XCTAssertEqual(observer, pBinding);
    }
}

/**
 
 KVO/KVC がちゃんと機能してるか。
 
 - value で指定したオブジェクトとキーパスの値が取得できるか
 - プロパティを変更すると delegate が呼ばれるか
 - delegate が呼ばれた後の value で新しい値が取得できるか
 
 */
- (void)testKVO_C {
    
    Student *s = [Student new];
    
    s.name = @"星空凛";
    
    RVXKeyValueBinding *binding = [RVXKeyValueBinding.alloc initWithObject:s
                                                                   keyPath:@"name"];
    
    id mockDelegate = [OCMockObject mockForProtocol:@protocol(RVXBindingDelegate)];
    binding.delegate = mockDelegate;
    
    XCTAssertEqualObjects(binding.value, @"星空凛", @"初期値");
    
    { // 変更されると delegate が呼ばれる && 変更後の値が取得できる
        
        [[mockDelegate expect] rvx_didChangeBindingValue:binding];
        
        s.name = @"小泉花陽";
        
        XCTAssertNoThrow([mockDelegate verify]);
        
        XCTAssertEqualObjects(binding.value, @"小泉花陽", @"変更後の値が取得できる");
    }
}

/**
 
 プリミティブ型のプロパティでも KVO/KVC がちゃんと機能してるか。

 */
- (void)testKVO_C_primitive {
    
    Student *student = [Student new];
    
    student.year = 1;
    
    RVXKeyValueBinding *binding = [RVXKeyValueBinding.alloc initWithObject:student
                                                                   keyPath:@"year"];

    id mockDelegate = [OCMockObject mockForProtocol:@protocol(RVXBindingDelegate)];
    binding.delegate = mockDelegate;
    
    XCTAssertEqualObjects(binding.value, @(1), @"初期値");
    
    { // 変更されると delegate が呼ばれる && 変更後の値が取得できる
        
        [[mockDelegate expect] rvx_didChangeBindingValue:binding];
        
        student.year = 3;
        
        XCTAssertNoThrow([mockDelegate verify]);
        
        XCTAssertEqualObjects(binding.value, @(3), @"変更後の値が取得できる");
    }
}

@end
