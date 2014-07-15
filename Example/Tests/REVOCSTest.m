//
//  REVOCSTest.m
//  REVOCS
//
//  Created by mtmta on 2014/07/13.
//  Copyright (c) 2014年 NeetHouse. All rights reserved.
//

#import <REVOCS/REVOCS.h>

#import <XCTest/XCTest.h>

#import "Student.h"
#import "TestTheme.h"


@interface REVOCSTest : XCTestCase

@end

@implementation REVOCSTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

/**
 
 REVOCS.h から必要なクラスを全部 import できるか
 
 コンパイルが通れば ok
 
 */
- (void)_testImports {
    
    [(NSObject *)nil rvx_bindings]; // NSObject+RVXBinding
    [RVXBinding class];
    [(RVXBinding *)nil filter:nil]; // RVXBinding+Filter
    [(RVXBinding *)nil CGColorFilter]; // RVXBinding+UIConvenienceFilter
    NSStringFromProtocol(@protocol(RVXBindingDelegate));
    [RVXBindingDictionary class];
    [RVXBlockNotifier class];
    [RVXFilteredBinding class];
    [RVXKeyValueBinding class];
    RVX_BIND((Student *)nil, name); // RVXMacro.h
    [RVXNotifier class];
    [RVXSelectorNotifier class];
    [RVXTheme class];
    RVX_THEME_BINDING(TestTheme, font); // RVXThemeMacro
}

@end
