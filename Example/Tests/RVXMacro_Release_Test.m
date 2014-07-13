//
//  RVXMacro_Release_Test.m
//  REVOCS
//
//  Created by mtmta on 2014/07/13.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

// リリースビルドとしてテスト
#define _RVX_RELEASE

#import <REVOCS/RVXMacro.h>
#import <REVOCS/RVXBinding.h>
#import <REVOCS/NSObject+RVXBinding.h>

#import <XCTest/XCTest.h>

#import "Student.h"


@interface RVXMacro_Release_Test : XCTestCase

@end

@implementation RVXMacro_Release_Test

- (void)testBind {
    
    RVXBinding *binding = [RVXBinding new];
    
    Student *student = [Student new];
    
    XCTAssertEqual(student.rvx_bindings.count, 0U);
    
    RVX_BIND(student, name) = binding;
    
    XCTAssertEqual(student.rvx_bindings.count, 1U);
    XCTAssertEqual(student.rvx_bindings[@"name"], binding, @"第2引数のキーに設定されてる");
}

/**
 
 リリースビルドではプロパティの存在チェックが行われない
 
 */
- (void)testBind_nonExistentProperty {
    
    RVXBinding *binding = [RVXBinding new];
    
    NSObject *object = [Student new];

    // コンパイル通る
    RVX_BIND(object, name) = binding;
}

@end
