//
//  RVXBinding+FilterTest.m
//  REVOCS
//
//  Created by mtmta on 2014/07/15.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <REVOCS/RVXBinding+Filter.h>

#import <XCTest/XCTest.h>
#import <OCMock.h>


@interface RVXBinding_FilterTest : XCTestCase

@end

@implementation RVXBinding_FilterTest {
    
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
    
    RVXFilteredBinding *binding = [_source filter:^id(id value) {
        
        XCTAssertEqualObjects(value, @"星空", @"source の値が渡される");
        
        return [value stringByAppendingString:@"凛"];
    }];
    
    XCTAssertEqual(binding.sourceBinding, _source);
    
    XCTAssertEqualObjects(binding.value, @"星空凛", @"filter で加工された値が取得できる");
}

@end
