//
//  JGLayoutParameter.m
//
//  Created by Jaden Geller on 11/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "JGLayoutParameter.h"

@interface JGLayoutParameter ()

@property (nonatomic) NSLayoutAttribute attribute;
@property (nonatomic) NSLayoutRelation relation;
@property (nonatomic) id object;
@property (nonatomic) NSInteger priority;
@property (nonatomic) CGFloat constant;
@property (nonatomic) CGFloat multiplier;

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
    parameter.constant = constant;
    return parameter;
}

-(id)init{
    if (self = [super init]) {
        //Set Defaults (other property defaults are implied)
        _attribute = NSLayoutAttributeNotAnAttribute;
        _relation = NSLayoutRelationEqual;
        _priority = UILayoutPriorityRequired;
        _multiplier = 1;
    }
    return self;
}

// The following functions return self for convenience.

- (id)objectAtIndexedSubscript:(NSUInteger)idx{
    self.priority = idx;
    return self;
}

-(JGLayoutParameter*)add:(CGFloat)constant{
    self.constant = constant;
    return self;
}

-(JGLayoutParameter*)multiply:(CGFloat)multiplier{
    self.multiplier = multiplier;
    return self;
}

-(JGLayoutParameter*)withRelation:(NSLayoutRelation)relation{
    self.relation = relation;
    return self;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"<%@: %p; object = %@; constant = %f; multiplier = %f>",NSStringFromClass([self class]), self, self.object, self.constant, self.multiplier];
}

@end
