//
//  RVXBindingTest.m
//  REVOCS
//
//  Created by mtmta on 2014/07/13.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <REVOCS/RVXBinding.h>

#import <XCTest/XCTest.h>
#import <OCMock.h>


@interface RVXBindingTest : XCTestCase
@end

@implementation RVXBindingTest {
    
    RVXBinding *_binding;
}

- (void)setUp {
    [super setUp];
    
    _binding = [RVXBinding.alloc init];
}

- (void)testNotifyDelegate {
    
    id mockDelegate = [OCMockObject mockForProtocol:@protocol(RVXBindingDelegate)];
    _binding.delegate = mockDelegate;
    
    [[mockDelegate expect] rvx_didChangeBindingValue:_binding];
    
    [_binding notifyChanged];
    
    XCTAssertNoThrow([mockDelegate verify]);
}

- (void)testGetValue {
    
    XCTAssertNil(_binding.value);
}

@end
