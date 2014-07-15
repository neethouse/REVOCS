//
//  RVXFilteredBindingTest.m
//  REVOCS
//
//  Created by mtmta on 2014/07/15.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <REVOCS/RVXFilteredBinding.h>

#import <XCTest/XCTest.h>
#import <OCMock.h>


@interface RVXFilteredBindingTest : XCTestCase

@end

@implementation RVXFilteredBindingTest {
    
    RVXBinding *_source;
    
    id _mockSource;
}

- (void)setUp {
    [super setUp];
    
    _source = [RVXBinding new];
    
    _mockSource = [OCMockObject partialMockForObject:_source];
    [[[_mockSource stub] andReturn:@"星空"] value];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testFilter {
    
    __block BOOL executed = NO;
    
    RVXFilteredBinding *binding = [RVXFilteredBinding.alloc initWithSourceBinding:_source filter:^id(id value) {
        
        executed = YES;
        
        XCTAssertEqualObjects(value, @"星空", @"source の値が渡される");
        
        return [value stringByAppendingString:@"凛"];
    }];
    
    XCTAssertEqualObjects(binding.value, @"星空凛", @"filter で加工された値が取得できる");
    XCTAssertTrue(executed, @"filterBlock が実行されてる");
}

@end
