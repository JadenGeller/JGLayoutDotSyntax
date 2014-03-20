//
//  JGLayoutParameter.m
//
//  Created by Jaden Geller on 11/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "JGLayoutParameter.h"
#import "JGDynamicConstraint.h"

@interface JGLayoutParameter ()

@property (nonatomic) NSLayoutAttribute attribute;
@property (nonatomic) NSLayoutRelation relation;
@property (nonatomic) id object;
@property (nonatomic) NSInteger priority;
@property (nonatomic) id constant;
@property (nonatomic) id multiplier;

@end

@implementation JGLayoutParameter

+(JGLayoutParameter*)layoutParameterWithObject:(id)object attribute:(NSLayoutAttribute)attribute{
    JGLayoutParameter *parameter = [[JGLayoutParameter alloc]init];
    parameter.object = object;
    parameter.attribute = attribute;
    return parameter;
}

+(JGLayoutParameter*)constant:(CGFloat)constant{
    JGLayoutParameter *parameter = [[JGLayoutParameter alloc]init];
    parameter.constant = @(constant);
    return parameter;
}

-(id)init{
    if (self = [super init]) {
        //Set Defaults (other property defaults are implied)
        _attribute = NSLayoutAttributeNotAnAttribute;
        _relation = NSLayoutRelationEqual;
        _priority = UILayoutPriorityRequired;
        _multiplier = @(1);
        _constant = @(0);
    }
    return self;
}

// The following functions return self for convenience.

- (id)objectAtIndexedSubscript:(NSUInteger)idx{
    self.priority = idx;
    return self;
}

-(JGLayoutParameter*)add:(id)constant{
    self.constant = constant;
    return self;
}

-(JGLayoutParameter*)multiply:(id)constant{
    self.multiplier = constant;
    return self;
}

-(JGLayoutParameter*)withRelation:(NSLayoutRelation)relation{
    self.relation = relation;
    return self;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"<%@: %p; object = %@; constant = %@; multiplier = %@>",NSStringFromClass([self class]), self, self.object, self.constant, self.multiplier];
}

-(CGFloat)currentConstant{
    return [self valueForObject:self.constant];
}

-(CGFloat)currentMultiplier{
    return [self valueForObject:self.multiplier];
}

-(CGFloat)valueForObject:(id)object{
    if ([object isKindOfClass:[JGDynamicConstraint class]]) {
        JGDynamicConstraint *constraint = (JGDynamicConstraint*)object;
        return [[constraint.object valueForKey:constraint.keyPath]doubleValue];
    }
    else if ([object isKindOfClass:[NSNumber class]]) {
        return [object doubleValue];
    }
    
    [NSException raise:@"Bad type" format:@"Invalid layout parameter"];
    return 0;
}

@end
