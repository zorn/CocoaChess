//
//  PlayerTests.m
//  CocoaChess
//
//  Created by Michael Zornek on 10/26/13.
//  Copyright (c) 2013 Michael Zornek. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PCPlayer.h"

@interface PlayerTests : XCTestCase

@property (strong) PCPlayer *freshPlayer;

@end

@implementation PlayerTests

- (void)setUp
{
    [super setUp];
    self.freshPlayer = [[PCPlayer alloc] init];
}

- (void)tearDown
{
    self.freshPlayer = nil;
    [super tearDown];
}

- (void)testCreation
{
    PCPlayer *player = [[PCPlayer alloc] init];
    XCTAssertNotNil(player, @"player should not be nil");
}

- (void)testName
{
    self.freshPlayer.name = @"Billy Beta";
    XCTAssert([self.freshPlayer.name isEqualToString:@"Billy Beta"], @"name should be assignable");
}

@end
