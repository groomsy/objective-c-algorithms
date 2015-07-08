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
    
    // TODO Implement
}

- (void)mergeSort {
    
    if ( self.count == 0 ) return;
    
    [self mergeSortFrom:0 to:( self.count - 1 )];
}

@end
