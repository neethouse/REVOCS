//
//  RVXMacro_Debug_Test.m
//  REVOCS
//
//  Created by mtmta on 2014/07/13.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

// デバッグビルドとしてテスト
#define __RVX_DEBUG

#import <REVOCS/RVXMacro.h>
#import <REVOCS/RVXBinding.h>
#import <REVOCS/NSObject+RVXBinding.h>

#import <XCTest/XCTest.h>

#import "Student.h"


@interface RVXMacro_Debug_Test : XCTestCase

@end

@implementation RVXMacro_Debug_Test

- (void)testBind {
    
    RVXBinding *binding = [RVXBinding new];
    
    Student *student = [Student new];
    
    XCTAssertEqual(student.rvx_bindings.count, 0U);
    
    RVX_BIND(student, name) = binding;
    
    XCTAssertEqual(student.rvx_bindings.count, 1U);
    XCTAssertEqual(student.rvx_bindings[@"name"], binding, @"第2引数のキーに設定されてる");
}

/**
 
 デバッグビルドではプロパティの存在チェックが行われる。
 そのため以下のコードはコンパイルエラーになる
 
 */
/*
- (void)testBind_nonExistentProperty {
    
    RVXBinding *binding = [RVXBinding new];
    
    NSObject *object = [Student new];
    
    // コンパイルエラー
    RVX_BIND(object, name) = binding;
}
 */

@end
