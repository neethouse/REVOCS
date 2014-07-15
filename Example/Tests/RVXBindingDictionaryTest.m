//
//  RVXBindingDictionaryTest.m
//  REVOCS
//
//  Created by mtmta on 2014/07/13.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <REVOCS/RVXBindingDictionary.h>
#import <REVOCS/RVXBinding.h>
#import <REVOCS/NSObject+RVXBinding.h>

#import <XCTest/XCTest.h>
#import <OCMock.h>
#import "Student.h"


@interface RVXBindingDictionaryTest : XCTestCase

@end

@implementation RVXBindingDictionaryTest {
    
    /// Student の OCMStrictClassMock
    id _mockTarget;
    
    RVXBindingDictionary *_dict;
}

- (void)setUp {
    [super setUp];
    
    _mockTarget = [OCMockObject mockForClass:[Student class]];

    _dict = [RVXBindingDictionary.alloc initWithTarget:_mockTarget];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
 
 -setBinding:forKeyPath:
 
 - 追加した binding の delegate に RVXBindingDictionary が設定される
 - 追加時に target の rvx_apply... が呼ばれる
 
 */
- (void)testSet {
    
    id mockBinding = [OCMockObject partialMockForObject:[RVXBinding new]];
    
    {
        // RVXBinding.delegate に dictionary が設定される
        [[mockBinding expect] setDelegate:_dict];
        
        // 追加時に rvx_apply.. が呼ばれる
        [[_mockTarget expect] rvx_applyBindingValue:mockBinding forKeyPath:@"name"];
    }
    
    // 追加
    [_dict setBinding:mockBinding forKeyPath:@"name"];
    
    {
        XCTAssertNoThrow([mockBinding verify]);
        XCTAssertNoThrow([_mockTarget verify]);
    }
}

/**
 
 -setObject:forKey:
 
 - -setBinding:forKeyPath: と同じ挙動か
 
 */
- (void)testSetObjectForKey {
    
    id mockBinding = [OCMockObject partialMockForObject:[RVXBinding new]];
    
    {
        // RVXBinding.delegate に dictionary が設定される
        [[mockBinding expect] setDelegate:_dict];
        
        // 追加時に rvx_apply.. が呼ばれる
        [[_mockTarget expect] rvx_applyBindingValue:mockBinding forKeyPath:@"name"];
    }
    
    // 追加
    [_dict setObject:mockBinding forKey:@"name"];
    
    {
        XCTAssertNoThrow([mockBinding verify]);
        XCTAssertNoThrow([_mockTarget verify]);
    }
}

/**
 
 bind した値が変更された時、target の rvx_apply.. が呼ばれるか
 
 */
- (void)testChange {
    
    id mockBinding = [OCMockObject niceMockForClass:[RVXBinding class]];
    
    { // 追加

        // 追加時に rvx_apply.. が呼ばれる
        [[_mockTarget expect] rvx_applyBindingValue:mockBinding forKeyPath:@"name"];

        [_dict setBinding:mockBinding forKeyPath:@"name"];
    }
    
    { // 変更時に rvx_apply.. が呼ばれる
        [[_mockTarget expect] rvx_applyBindingValue:mockBinding forKeyPath:@"name"];
    }
    
    // 直接変更を通知
    [_dict rvx_didChangeBindingValue:mockBinding];
    
    // 呼ばれてる
    XCTAssertNoThrow([_mockTarget verify]);
}

/**
 
 同じ binding を target の複数の keyPath に設定した場合
 
 - 変更時に、各 keyPath に対して rvx_apply.. が呼ばれるか
 - 違う binding は呼ばれない
 
 */
- (void)testChange_multipleKeyPaths {
    
    id stringBinding = [OCMockObject niceMockForClass:[RVXBinding class]];
    id numberBinding = [OCMockObject niceMockForClass:[RVXBinding class]];
    
    { // 追加
        
        // stringBinding -> name, school に設定
        // numberBinding -> year に設定
        
        // 追加時に rvx_apply.. が呼ばれる
        [[_mockTarget expect] rvx_applyBindingValue:stringBinding forKeyPath:@"name"];
        [[_mockTarget expect] rvx_applyBindingValue:stringBinding forKeyPath:@"school"];
        [[_mockTarget expect] rvx_applyBindingValue:numberBinding forKeyPath:@"year"];
        
        [_dict setBinding:stringBinding forKeyPath:@"name"];
        [_dict setBinding:stringBinding forKeyPath:@"school"];
        [_dict setBinding:numberBinding forKeyPath:@"year"];
    }
    
    { // stringBinding が変更された時
        
        // 同一の binding を設定した name と school 両方の rvx_apply が呼ばれる
        // (year は呼ばれない)
        [[_mockTarget expect] rvx_applyBindingValue:stringBinding forKeyPath:@"name"];
        [[_mockTarget expect] rvx_applyBindingValue:stringBinding forKeyPath:@"school"];
    }
    
    // stringBinding の変更を通知
    [_dict rvx_didChangeBindingValue:stringBinding];
    
    // 呼ばれてる
    XCTAssertNoThrow([_mockTarget verify]);
}

@end
