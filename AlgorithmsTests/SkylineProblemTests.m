//
//  SkylineProblemTests.m
//  Algorithms
//
//  Created by Todd Grooms on 7/13/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

@import XCTest;

#import "Building.h"
#import "Skyline.h"
#import "SkylinePoint.h"

@interface SkylineProblemTests : XCTestCase

@end

@implementation SkylineProblemTests

- (void)testSkyline {
    
    NSArray *buildings = @[
                           [[Building alloc] initWithLeft:1 right:5 height:11],
                           [[Building alloc] initWithLeft:2 right:7 height:6],
                           [[Building alloc] initWithLeft:3 right:9 height:13],
                           [[Building alloc] initWithLeft:12 right:16 height:7],
                           [[Building alloc] initWithLeft:14 right:25 height:3],
                           [[Building alloc] initWithLeft:19 right:22 height:18],
                           [[Building alloc] initWithLeft:23 right:29 height:13],
                           [[Building alloc] initWithLeft:24 right:28 height:4]
                           ];
    
    NSArray *expectedPoints = @[
                                [[SkylinePoint alloc] initWithX:1 height:11],
                                [[SkylinePoint alloc] initWithX:3 height:13],
                                [[SkylinePoint alloc] initWithX:9 height:0],
                                [[SkylinePoint alloc] initWithX:12 height:7],
                                [[SkylinePoint alloc] initWithX:16 height:3],
                                [[SkylinePoint alloc] initWithX:19 height:18],
                                [[SkylinePoint alloc] initWithX:22 height:3],
                                [[SkylinePoint alloc] initWithX:23 height:13],
                                [[SkylinePoint alloc] initWithX:29 height:0]
                                ];
    
    Skyline *actualSkyline = [Skyline skylineFromBuildings:buildings];
    Skyline *expectedSkyline = [[Skyline alloc] initWithPoints:expectedPoints];
    XCTAssertEqualObjects(actualSkyline, expectedSkyline);
}

@end
