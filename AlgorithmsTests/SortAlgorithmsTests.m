//
//  AlgorithmsTests.m
//  AlgorithmsTests
//
//  Created by Todd Grooms on 7/8/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

@import XCTest;

#import "NSMutableArray+BubbleSort.h"
#import "NSMutableArray+InsertionSort.h"
#import "NSMutableArray+MergeSort.h"
#import "NSMutableArray+SelectionSort.h"

@interface AlgorithmsTests : XCTestCase

@property (nonatomic, strong) NSMutableArray *inputNil;
@property (nonatomic, strong) NSMutableArray *inputEmpty;
@property (nonatomic, strong) NSMutableArray *inputOneNumber;
@property (nonatomic, strong) NSMutableArray *input;

@property (nonatomic, strong) NSArray *expectedOutputOneNumber;
@property (nonatomic, strong) NSArray *expectedOutput;

@end

@implementation AlgorithmsTests

- (void)setUp {
    
    [super setUp];
    
    self.inputNil = nil;
    self.inputEmpty = @[].mutableCopy;
    self.inputOneNumber = @[@1].mutableCopy;
    self.input = @[@5, @4, @3, @2, @1].mutableCopy;
    
    self.expectedOutputOneNumber = @[@1];
    self.expectedOutput = @[@1, @2, @3, @4, @5];
}

- (void)tearDown {
    
    self.inputNil = nil;
    self.inputEmpty = nil;
    self.inputOneNumber = nil;
    self.input = nil;

    self.expectedOutputOneNumber = nil;
    self.expectedOutput = nil;
    
    [super tearDown];
}

#pragma mark - BubbleSort

- (void)testBubbleSortEmptyArray {
    
    XCTAssertNoThrow([self.inputEmpty bubbleSort]);
    XCTAssertEqual(self.inputEmpty.count, 0);
}

- (void)testBubbleSortNilArray {
    
    XCTAssertNoThrow([self.inputNil bubbleSort]);
    XCTAssertNil(self.inputNil);
}

- (void)testBubbleSortOneNumber {
    
    XCTAssertNoThrow([self.inputOneNumber bubbleSort]);
    XCTAssertEqualObjects(self.inputOneNumber, self.expectedOutputOneNumber);
}

- (void)testBubbleSort {
    
    XCTAssertNoThrow([self.input bubbleSort]);
    XCTAssertEqualObjects(self.input, self.expectedOutput);
}

#pragma mark - InsertionSort

- (void)testInsertionSortEmptyArray {
    
    XCTAssertNoThrow([self.inputEmpty insertionSort]);
    XCTAssertEqual(self.inputEmpty.count, 0);
}

- (void)testInsertionSortNilArray {
    
    XCTAssertNoThrow([self.inputNil insertionSort]);
    XCTAssertNil(self.inputNil);
}

- (void)testInsertionSortOneNumber {
    
    XCTAssertNoThrow([self.inputOneNumber insertionSort]);
    XCTAssertEqualObjects(self.inputOneNumber, self.expectedOutputOneNumber);
}

- (void)testInsertionSort {
    
    XCTAssertNoThrow([self.input insertionSort]);
    XCTAssertEqualObjects(self.input, self.expectedOutput);
}

#pragma mark - MergeSort

- (void)testMergeSortEmptyArray {
    
    XCTAssertNoThrow([self.inputEmpty mergeSort]);
    XCTAssertEqual(self.inputEmpty.count, 0);
}

- (void)testMergeSortNilArray {
    
    XCTAssertNoThrow([self.inputNil mergeSort]);
    XCTAssertNil(self.inputNil);
}

- (void)testMergeSortOneNumber {
    
    XCTAssertNoThrow([self.inputOneNumber mergeSort]);
    XCTAssertEqualObjects(self.inputOneNumber, self.expectedOutputOneNumber);
}

- (void)testMergeSort {
    
    XCTAssertNoThrow([self.input mergeSort]);
    XCTAssertEqualObjects(self.input, self.expectedOutput);
}

#pragma mark - SelectionSort

- (void)testSelectionSortEmptyArray {
    
    XCTAssertNoThrow([self.inputEmpty selectionSort]);
    XCTAssertEqual(self.inputEmpty.count, 0);
}

- (void)testSelectionSortNilArray {
    
    XCTAssertNoThrow([self.inputNil selectionSort]);
    XCTAssertNil(self.inputNil);
}

- (void)testSelectionSortOneNumber {
    
    XCTAssertNoThrow([self.inputOneNumber selectionSort]);
    XCTAssertEqualObjects(self.inputOneNumber, self.expectedOutputOneNumber);
}

- (void)testSelectionSort {
    
    XCTAssertNoThrow([self.input selectionSort]);
    XCTAssertEqualObjects(self.input, self.expectedOutput);
}

@end
