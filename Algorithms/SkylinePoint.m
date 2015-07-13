//
//  SkylinePoint.m
//  Algorithms
//
//  Created by Todd Grooms on 7/13/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

#import "SkylinePoint.h"

@implementation SkylinePoint

- (instancetype)initWithX:(NSUInteger)x height:(NSUInteger)height {
    
    self = [super init];
    if ( self ) {
        
        _x = x;
        _height = height;
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    
    if ( [object isKindOfClass:[self class]] ) {
        
        SkylinePoint *otherPoint = (SkylinePoint *)object;
        return otherPoint.x == self.x && otherPoint.height == self.height;
    }
    return NO;
}

@end
