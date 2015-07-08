//
//  NSMutableArray+Swap.m
//  Algorithms
//
//  Created by Todd Grooms on 7/8/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

#import "NSMutableArray+Swap.h"

@implementation NSMutableArray (Swap)

- (void)swapObjectAtIndex:(NSUInteger)firstIndex withObjectAtIndex:(NSUInteger)secondIndex {
    
    NSNumber *temp = self[firstIndex];
    self[firstIndex] = self[secondIndex];
    self[secondIndex] = temp;
}

@end
