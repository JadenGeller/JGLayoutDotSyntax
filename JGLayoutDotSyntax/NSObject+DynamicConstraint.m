//
//  NSObject+DynamicConstraint.m
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/10/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import "NSObject+DynamicConstraint.h"
#import "JGDynamicConstraint.h"
#import "JGLayoutParameter.h"

@implementation NSObject (DynamicConstraint)

-(JGLayoutParameter*)constraintForKeyPath:(NSString*)keyPath{
    return [[JGLayoutParameter layoutParameterWithObject:nil attribute:0]add:[JGDynamicConstraint constraintWithObject:self keyPath:keyPath]];
}

@end
