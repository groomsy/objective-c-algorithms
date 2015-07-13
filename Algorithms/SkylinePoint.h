//
//  SkylinePoint.h
//  Algorithms
//
//  Created by Todd Grooms on 7/13/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

@import Foundation;

@interface SkylinePoint : NSObject

- (instancetype)initWithX:(NSUInteger)x height:(NSUInteger)height;

@property (nonatomic, assign) NSUInteger x;
@property (nonatomic, assign) NSUInteger height;

@end
