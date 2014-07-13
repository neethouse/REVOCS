//
//  NSObject+RVXBindingTest.m
//  REVOCS
//
//  Created by mtmta on 2014/07/13.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <REVOCS/NSObject+RVXBinding.h>

#import <XCTest/XCTest.h>
#import <OCMock.h>

#import "Student.h"


@interface NSObject_RVXBindingTest : XCTestCase

@end

@implementation NSObject_RVXBindingTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
 
 rvx_applyBindingValue:forKeyPath: を呼ぶと -setValue:forKeyPath: が呼ばれるか
 
 */
- (void)testApply {
    
    id mockBinding = [OCMockObject niceMockForClass:[RVXBinding class]];
    [(RVXBinding *)[[mockBinding stub] andReturn:@"星空凛"] value];
    
    id mock = [OCMockObject partialMockForObject:[Student new]];
    
    [[mock expect] setValue:@"星空凛" forKeyPath:@"name"];
    
    [mock rvx_applyBindingValue:mockBinding forKeyPath:@"name"];
    
    XCTAssertNoThrow([mock verify]);
}

/**
 
 - rvx_bindings で RVXBindingDictionary が取得できるか
 - 同じ NSObject からは常に同じ RVXBindingDictionary インスタンスが取得できるか
 - NSObject が解放される時に RVXBindingDictionary も一緒に開放されるか
 
 */
- (void)testBindings {
    
    Student *s = [Student new];
    
    RVXBindingDictionary *bindings = nil;
    
    @autoreleasepool {
        
        bindings = s.rvx_bindings;
        
        XCTAssertNotNil(bindings);
        XCTAssertTrue([bindings isKindOfClass:[RVXBindingDictionary class]]);
        
        XCTAssertEqual(s.rvx_bindings, bindings, @"同じインスタンスが取得できる");
    }
    
    { // NSObject の解放と一緒に開放されるか
        
        __weak id wS = s;
        __weak id wBindings = bindings;
        
        bindings = nil;
        s = nil;
        
        XCTAssertNil(wS);
        XCTAssertNil(wBindings, @"解放されてる");
    }
}

@end
