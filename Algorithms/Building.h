//
//  Building.h
//  Algorithms
//
//  Created by Todd Grooms on 7/13/15.
//  Copyright (c) 2015 Groomsy Dev. All rights reserved.
//

@import Foundation;

@interface Building : NSObject

- (instancetype)initWithLeft:(NSUInteger)left right:(NSUInteger)right height:(NSUInteger)height;

@property (nonatomic, assign) NSUInteger left;
@property (nonatomic, assign) NSUInteger right;
@property (nonatomic, assign) NSUInteger height;

@end
