//
//  RVXBinding+UIConvenienceFilterTest.m
//  REVOCS
//
//  Created by mtmta on 2014/07/15.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <REVOCS/RVXBinding+UIConvenienceFilter.h>

#import <XCTest/XCTest.h>
#import <OCMock.h>


@interface RVXBinding_UIConvenienceFilterTest : XCTestCase

@end

@implementation RVXBinding_UIConvenienceFilterTest {
    
    RVXBinding *_source;
    
    id _mockSource;
}

- (void)setUp {
    [super setUp];

    _source = [RVXBinding new];
    
    _mockSource = [OCMockObject partialMockForObject:_source];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCGColorFilter {

    UIColor *uiColor = [UIColor colorWithRed:182.0/255 green:252.0/255 blue:196.0/255 alpha:1.0];
    [(RVXBinding *)[[_mockSource stub] andReturn:uiColor] value];
    
    RVXFilteredBinding *binding = [_source CGColorFilter];
    
    CGColorRef cgColor = (__bridge CGColorRef)(binding.value);
    
    XCTAssertNotEqual(cgColor, NULL);
    XCTAssertTrue(CGColorEqualToColor(cgColor, uiColor.CGColor), @"source.value.CGColor と同じ");
}

- (void)testCGPathFilter {
    
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 200, 300)];
    [(RVXBinding *)[[_mockSource stub] andReturn:bezierPath] value];
    
    RVXFilteredBinding *binding = [_source CGPathFilter];
    
    CGPathRef cgPath = (__bridge CGPathRef)(binding.value);
    
    XCTAssertNotEqual(cgPath, NULL);
    XCTAssertTrue(CGPathEqualToPath(cgPath, bezierPath.CGPath), @"source.value.CGPath と同じ");
}

@end
