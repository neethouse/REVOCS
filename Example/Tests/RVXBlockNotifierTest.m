//
//  RVXBlockNotifierTest.m
//  REVOCS
//
//  Created by mtmta on 2014/07/13.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <REVOCS/RVXBlockNotifier.h>
#import <REVOCS/RVXKeyValueBinding.h>

#import <XCTest/XCTest.h>
#import <OCMock.h>

#import "NotifierCallback.h"
#import "Student.h"


@interface RVXBlockNotifierTest : XCTestCase

@end

@implementation RVXBlockNotifierTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
 
 - binding が変更されると block が呼ばれるか。
 - 引数として binding.value が渡されるか
 
 */
- (void)testNotify {
    
    Student *student = [Student new];
    
    RVXKeyValueBinding *mockBinding = [RVXKeyValueBinding.alloc initWithObject:student
                                                                   keyPath:@"name"];
    
    id mockReceiver = [OCMockObject mockForProtocol:@protocol(NotifierCallback)];
    
    __unused RVXBlockNotifier *notifier = [RVXBlockNotifier.alloc initWithBinding:mockBinding block:^(id value) {
        [mockReceiver rvxt_didNotify:value];
    }];
    
    { // 変更
        
        [[mockReceiver expect] rvxt_didNotify:@"星空凛"];
        
        student.name = @"星空凛";
        
        XCTAssertNoThrow([mockReceiver verify]);
    }
    
    { // 変更
        
        [[mockReceiver expect] rvxt_didNotify:@"西木野真姫"];
        
        student.name = @"西木野真姫";
        
        XCTAssertNoThrow([mockReceiver verify]);
    }
}

@end
