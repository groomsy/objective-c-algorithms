//
//  MathAlgorithmsTests.m
//  Algorithms
//
//  Created by Todd Grooms on 7/10/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

@import XCTest;

#import "MathAlgorithms.h"

@interface MathAlgorithmsTests : XCTestCase

@end

@implementation MathAlgorithmsTests

#pragma mark - Exponents

- (void)testTwoToZeroPower {
    
    XCTAssertEqual([MathAlgorithms raise:2 to:0], 1);
}

- (void)testTwoToFirstPower {
    
    XCTAssertEqual([MathAlgorithms raise:2 to:1], 2);
}

- (void)testTwoToSecondPower {

    XCTAssertEqual([MathAlgorithms raise:2 to:2], 4);
}

- (void)testTwoToThirdPower {
    
    XCTAssertEqual([MathAlgorithms raise:2 to:3], 8);
}

#pragma mark - Multiplication

- (void)testFiveTimesZero {
    
    XCTAssertEqual([MathAlgorithms multiply:5 by:0], 0);
}

- (void)testNegativeFiveTimesZero {
    
    XCTAssertEqual([MathAlgorithms multiply:-5 by:0], 0);
}

- (void)testNegativeThreeTimesFive {

    XCTAssertEqual([MathAlgorithms multiply:-3 by:5], -15);
}

- (void)testNegativeThreeTimesNegativeFive {
    
    XCTAssertEqual([MathAlgorithms multiply:-3 by:-5], 15);
}

- (void)testThreeTimesFive {
    
    XCTAssertEqual([MathAlgorithms multiply:3 by:5], 15);
}

- (void)testThreeTimesNegativeFive {
    
    XCTAssertEqual([MathAlgorithms multiply:3 by:-5], -15);
}

- (void)testZeroTimesFive {
    
    XCTAssertEqual([MathAlgorithms multiply:0 by:5], 0);
}

- (void)testZeroTimesNegativeFive {
    
    XCTAssertEqual([MathAlgorithms multiply:0 by:-5], 0);
}

@end
