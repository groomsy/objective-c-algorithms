//
//  NSMutableArray+MergeSort.m
//  Algorithms
//
//  Created by Todd Grooms on 7/8/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

#import "NSMutableArray+MergeSort.h"

#import "NSMutableArray+Swap.h"

@implementation NSMutableArray (MergeSort)

- (void)mergeSortFrom:(NSUInteger)startIndex to:(NSUInteger)endIndex {
    
    if ( startIndex < endIndex ) {
        
        NSUInteger pivot = ( startIndex + endIndex ) / 2;
        [self mergeSortFrom:startIndex to:pivot];
        [self mergeSortFrom:( pivot + 1 ) to:endIndex];
        [self mergeFrom:startIndex to:endIndex pivot:pivot];
    }
}

- (void)mergeFrom:(NSUInteger)startIndex to:(NSUInteger)endIndex pivot:(NSUInteger)pivot {
    
    NSUInteger leftLength = pivot - startIndex + 1;
    NSUInteger rightLength = endIndex - pivot;
    NSAssert(leftLength + rightLength == endIndex - startIndex + 1, @"Combined lengths should be equal to overall length.");
    
    NSMutableArray *left = [NSMutableArray arrayWithCapacity:leftLength + 1];
    for ( NSUInteger iterator = 0; iterator < leftLength; ++iterator ) {
        
        [left addObject:self[startIndex + iterator]];
    }
    [left addObject:@(NSUIntegerMax)]; // This ensures we never go out of bounds on the left array
    
    NSMutableArray *right = [NSMutableArray arrayWithCapacity:rightLength + 1];
    for ( NSUInteger iterator = 1; iterator <= rightLength; ++iterator ) {
        
        [right addObject:self[pivot + iterator]];
    }
    [right addObject:@(NSUIntegerMax)]; // This ensures we never go out of bounds on the right array
    
    NSUInteger leftIndex = 0, rightIndex = 0;
    for ( NSUInteger iterator = startIndex; iterator <= endIndex; ++iterator ) {
        
        if ( left[leftIndex] <= right[rightIndex] ) {
            
            self[iterator] = left[leftIndex++];
        }
        else {
            
            self[iterator] = right[rightIndex++];
        }
    }
}

- (void)mergeSort {
    
    if ( self.count == 0 ) return;
    
    [self mergeSortFrom:0 to:( self.count - 1 )];
}

@end
