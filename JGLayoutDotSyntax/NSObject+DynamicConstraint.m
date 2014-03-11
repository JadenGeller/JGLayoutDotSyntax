//
//  NSObject+DynamicConstraint.m
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/10/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import "NSObject+DynamicConstraint.h"

@implementation NSObject (DynamicConstraint)

-(id)constraintForKeyPath:(NSString*)keyPath{
    return @[self, keyPath];
}

@end
