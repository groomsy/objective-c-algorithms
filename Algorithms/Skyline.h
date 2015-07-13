//
//  Skyline.h
//  Algorithms
//
//  Created by Todd Grooms on 7/13/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

@import Foundation;

@interface Skyline : NSObject

@property (nonatomic, readonly) NSArray *points;

+ (instancetype)skylineFromBuildings:(NSArray *)buildings;

- (instancetype)initWithPoints:(NSArray *)points;

@end
