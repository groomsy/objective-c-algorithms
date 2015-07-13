//
//  MathAlgorithms.m
//  Algorithms
//
//  Created by Todd Grooms on 7/10/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

#import "MathAlgorithms.h"

@implementation MathAlgorithms

+ (NSInteger)multiply:(NSInteger)x by:(NSInteger)y {
    
    BOOL isResultNegative = x < 0;
    if ( y < 0 ) {
        
        isResultNegative = !isResultNegative;
    }
    
    NSUInteger sanitizedX = labs(x);
    NSUInteger sanitizedY = labs(y);
    NSInteger total = 0;
    for ( NSUInteger iterator = sanitizedY; iterator > 0; --iterator ) {
        
        total += sanitizedX;
    }
    
    if ( isResultNegative ) {
        
        return -total;
    }
    
    return total;
}

+ (NSInteger)raise:(NSInteger)x to:(NSInteger)power {
    
    if ( power < 0 ) {
        
        // This is not yet supported
        return 0;
    }
    
    if ( power == 0 ) {
        
        return 1;
    }
    else if ( power == 1 ) {
        
        return x;
    }
    
    return [MathAlgorithms multiply:x by:[MathAlgorithms raise:x to:( power - 1 )]];
}

@end
