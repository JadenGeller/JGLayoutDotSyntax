//
//  JGDynamicConstraint.m
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/11/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import "JGDynamicConstraint.h"

@implementation JGDynamicConstraint

-(id)initWithObject:(NSObject*)object keyPath:(NSString*)keyPath{
    if (self = [super init]) {
        _object = object;
        _keyPath = keyPath;
    }
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    return [[JGDynamicConstraint allocWithZone:zone]initWithObject:self.object keyPath:self.keyPath];
}

+(JGDynamicConstraint*)constraintWithObject:(NSObject*)object keyPath:(NSString*)keyPath{
    return [[JGDynamicConstraint alloc]initWithObject:object keyPath:keyPath];
}

-(BOOL)isEqual:(id)object{
    if ([object isKindOfClass:[JGDynamicConstraint class]]) {
        JGDynamicConstraint *compare = (JGDynamicConstraint*)object;
        return ([self.object isEqual:compare.object] && [self.keyPath isEqual:compare.keyPath]);
    }
    else return NO;
}

-(NSUInteger)hash{
    return self.object.hash + self.keyPath.hash;
}

@end
