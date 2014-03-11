//
//  NSObject+DynamicConstraint.m
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/10/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import "NSObject+DynamicConstraint.h"
#import "JGDynamicConstraintObserver.h"

@implementation NSObject (DynamicConstraint)

-(id)constraintForKeyPath:(NSString*)keyPath{
    return @[self, keyPath];
}

-(void)setConstraintForKeyPath:(NSString*)keyPath{
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    
}

@end
