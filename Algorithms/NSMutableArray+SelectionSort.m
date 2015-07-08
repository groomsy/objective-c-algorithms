//
//  NSMutableArray+SelectionSort.m
//  Algorithms
//
//  Created by Todd Grooms on 7/8/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

#import "NSMutableArray+SelectionSort.h"

#import "NSMutableArray+Swap.h"

@implementation NSMutableArray (SelectionSort)

- (void)selectionSort {
    
    if ( self.count == 0 ) return;
    
    for ( NSUInteger outerIterator = 0; outerIterator < self.count - 1; ++outerIterator ) {
        
        NSUInteger minimumIndex = outerIterator;
        for ( NSUInteger innerIterator = outerIterator + 1; innerIterator < self.count; ++innerIterator ) {
            
            if ( self[innerIterator] < self[minimumIndex] ) {
                
                minimumIndex = innerIterator;
            }
        }
        
        if ( minimumIndex != outerIterator ) {

            [self swapObjectAtIndex:minimumIndex withObjectAtIndex:outerIterator];
        }
    }
}

@end
