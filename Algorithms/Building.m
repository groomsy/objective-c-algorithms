//
//  Building.m
//  Algorithms
//
//  Created by Todd Grooms on 7/13/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

#import "Building.h"

@implementation Building

- (instancetype)initWithLeft:(NSUInteger)left right:(NSUInteger)right height:(NSUInteger)height {
    
    self = [super init];
    if ( self ) {
        
        _left = left;
        _right = right;
        _height = height;
    }
    return self;
}

@end
