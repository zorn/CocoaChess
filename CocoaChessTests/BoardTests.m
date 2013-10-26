//
//  BoardTests.m
//  CocoaChess
//
//  Created by Michael Zornek on 10/26/13.
//  Copyright (c) 2013 Michael Zornek. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PCBoard.h"

@interface BoardTests : XCTestCase

@end

@implementation BoardTests

- (void)setUp
{
    [super setUp];
    // Put setup code here; it will be run once, before the first test case.
}

- (void)tearDown
{
    // Put teardown code here; it will be run once, after the last test case.
    [super tearDown];
}

- (void)testBuildBoard
{
    PCBoard *board = [[PCBoard alloc] init];
    XCTAssert(board != nil, @"board is created");
}

@end
