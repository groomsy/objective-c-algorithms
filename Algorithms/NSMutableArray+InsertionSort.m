//
//  NSMutableArray+InsertionSort.m
//  Algorithms
//
//  Created by Todd Grooms on 7/8/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

#import "NSMutableArray+InsertionSort.h"

#import "NSMutableArray+Swap.h"

@implementation NSMutableArray (InsertionSort)

- (void)insertionSort {
    
    if ( self.count == 0 ) return;
    
    for ( NSUInteger outerIterator = 1; outerIterator < self.count; ++outerIterator ) {
        
        NSUInteger innerIterator = outerIterator;
        while ( innerIterator > 0 && self[innerIterator] < self[innerIterator - 1] ) {
            
            [self swapObjectAtIndex:( innerIterator - 1 ) withObjectAtIndex:innerIterator];
            --innerIterator;
        }
    }
}

@end
