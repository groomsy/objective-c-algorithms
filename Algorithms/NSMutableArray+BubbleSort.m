//
//  NSMutableArray+BubbleSort.m
//  Algorithms
//
//  Created by Todd Grooms on 7/8/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

#import "NSMutableArray+BubbleSort.h"

#import "NSMutableArray+Swap.h"

@implementation NSMutableArray (BubbleSort)

- (void)bubbleSort {
    
    if ( self.count == 0 ) return;
    
    BOOL isInCorrectOrder = NO;
    while ( !isInCorrectOrder ) {
        
        isInCorrectOrder = YES;
        for ( NSUInteger iterator = 0; iterator < self.count - 1; ++iterator ) {
            
            NSUInteger leftIndex = iterator;
            NSUInteger rightIndex = iterator + 1;
            if ( self[rightIndex] < self[leftIndex] ) {
                
                [self swapObjectAtIndex:leftIndex withObjectAtIndex:rightIndex];
                isInCorrectOrder = NO;
            }
        }
    }
}

@end
