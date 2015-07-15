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

+ (instancetype)divideAndConquerSkylineFromBuildings:(NSArray *)buildings {
    
    return [Skyline divideAndConquerSkylineFromBuildings:buildings leftBoundBuildingIndex:0 rightBoundBuildingIndex:( buildings.count - 1 )];
}

+ (instancetype)divideAndConquerSkylineFromBuildings:(NSArray *)buildings leftBoundBuildingIndex:(NSUInteger)leftBoundBuildingIndex rightBoundBuildingIndex:(NSUInteger)rightBoundBuildingIndex {
    
    if ( leftBoundBuildingIndex == rightBoundBuildingIndex ) {
        
        Building *building = buildings[leftBoundBuildingIndex];
        return [[Skyline alloc] initWithPoints:@[
                                                 [[SkylinePoint alloc] initWithX:building.left height:building.height],
                                                 [[SkylinePoint alloc] initWithX:building.right height:0]
                                                ]];
    }
    
    NSUInteger pivot = leftBoundBuildingIndex + ( rightBoundBuildingIndex - leftBoundBuildingIndex ) / 2;
    Skyline *leftSkyline = [Skyline divideAndConquerSkylineFromBuildings:buildings leftBoundBuildingIndex:leftBoundBuildingIndex rightBoundBuildingIndex:pivot];
    Skyline *rightSkyline = [Skyline divideAndConquerSkylineFromBuildings:buildings leftBoundBuildingIndex:( pivot + 1 ) rightBoundBuildingIndex:rightBoundBuildingIndex];
    return [Skyline mergeSkyline:leftSkyline withSkyline:rightSkyline];
}

+ (instancetype)mergeSkyline:(Skyline *)leftSkyline withSkyline:(Skyline *)rightSkyline {
    
    NSMutableArray *points = [NSMutableArray arrayWithCapacity:( leftSkyline.points.count + rightSkyline.points.count )];
    
    NSUInteger leftHeight = 0, rightHeight = 0;
    
    NSUInteger leftIterator = 0, rightIterator = 0;
    while ( leftIterator < leftSkyline.points.count && rightIterator < rightSkyline.points.count ) {
        
        SkylinePoint *leftSkylinePoint = leftSkyline.points[leftIterator];
        SkylinePoint *rightSkylinePoint = rightSkyline.points[rightIterator];
        if ( leftSkylinePoint.x < rightSkylinePoint.x ) {
            
            leftHeight = leftSkylinePoint.height;

            NSUInteger x = leftSkylinePoint.x;
            NSUInteger height = MAX(leftHeight, rightHeight);
            
            // FIXME
            // This check is incorrect; This check excludes where the right building has a height and the intersecting left building drops below or to 0.
            if ( height == leftHeight ) {

                [points addObject:[[SkylinePoint alloc] initWithX:x height:height]];
            }
            ++leftIterator;
        }
        else {
            
            rightHeight = rightSkylinePoint.height;
            
            NSUInteger x = rightSkylinePoint.x;
            NSUInteger height = MAX(leftHeight, rightHeight);
            
            if ( height == rightHeight ) {

                [points addObject:[[SkylinePoint alloc] initWithX:x height:height]];
            }
            ++rightIterator;
        }
    }
    
    while ( leftIterator < leftSkyline.points.count ) {
        
        [points addObject:leftSkyline.points[leftIterator++]];
    }
    
    while ( rightIterator < rightSkyline.points.count ) {
        
        [points addObject:rightSkyline.points[rightIterator++]];
    }
    
    return [[Skyline alloc] initWithPoints:points];
}

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
