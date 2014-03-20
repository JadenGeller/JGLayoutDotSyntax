//
//  JGDynamicConstraint.h
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/11/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JGDynamicConstraint : NSObject <NSCopying>

@property (nonatomic) NSObject *object;
@property (nonatomic) NSString *keyPath;

-(id)initWithObject:(NSObject*)object keyPath:(NSString*)keyPath;
+(JGDynamicConstraint*)constraintWithObject:(NSObject*)object keyPath:(NSString*)keyPath;

@end
