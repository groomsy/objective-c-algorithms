//
//  Skyline.m
//  Algorithms
//
//  Created by Todd Grooms on 7/13/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

#import "Skyline.h"

#import "Building.h"
#import "SkylinePoint.h"

@interface Skyline ()

@property (nonatomic, strong) NSMutableArray *mutablePoints;

@end

@implementation Skyline

+ (instancetype)skylineFromBuildings:(NSArray *)buildings {

    if ( buildings.count == 0 ) {

        return [[Skyline alloc] initWithPoints:@[]];
    }
    else {
        
        NSMutableArray *heights = [NSMutableArray array];
        for ( Building *building in buildings ) {
            
            for ( NSUInteger iterator = heights.count; iterator <= building.right; ++iterator ) {
                
                // Fill with 0s if necessary
                [heights addObject:@0];
            }
            
            for ( NSUInteger iterator = building.left; iterator < building.right; ++iterator ) {
                
                if ( ((NSNumber *)heights[iterator]).unsignedIntegerValue < building.height ) {
                    
                    heights[iterator] = @(building.height);
                }
            }
        }
        
        NSMutableArray *points = [NSMutableArray arrayWithCapacity:heights.count];
        NSUInteger previousHeight = 0;
        for ( NSUInteger iterator = 0; iterator < heights.count; ++iterator ) {
            
            NSUInteger height = ((NSNumber *)heights[iterator]).unsignedIntegerValue;
            if ( height != previousHeight ) {
                
                [points addObject:[[SkylinePoint alloc] initWithX:iterator height:height]];
            }
            previousHeight = height;
        }
        
        return [[Skyline alloc] initWithPoints:points];
    }
}

- (instancetype)initWithPoints:(NSArray *)points {
    
    self = [super init];
    if ( self ) {
        
        _mutablePoints = points.mutableCopy;
    }
    return self;
}

- (BOOL)isEqual:(id)object {
    
    if ( [object isKindOfClass:[self class]] ) {
        
        Skyline *otherSkyline = (Skyline *)object;
        if ( self.points.count == otherSkyline.points.count ) {
            
            for ( NSUInteger iterator = 0; iterator < self.points.count; ++iterator ) {
                
                if ( ![self.points[iterator] isEqual:otherSkyline.points[iterator]] ) {
                    
                    return NO;
                }
            }
            return YES;
        }
    }
    return NO;
}

#pragma mark - Getter/Setter Methods

- (NSMutableArray *)mutablePoints {
    
    if ( !_mutablePoints ) {
        
        self.mutablePoints = [NSMutableArray array];
    }
    return _mutablePoints;
}

- (NSArray *)points {
    
    return self.mutablePoints.copy;
}

@end