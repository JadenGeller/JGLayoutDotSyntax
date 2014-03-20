//
//  NSNumber+LayoutConstruction.m
//
//  Created by Jaden Geller on 11/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "NSNumber+LayoutConstruction.h"
#import "JGLayoutParameter.h"

@interface NSNumber ()

@property (nonatomic, readonly) JGLayoutParameter *layoutParameter;

@end

@implementation NSNumber (Layout)

- (id)objectAtIndexedSubscript:(NSUInteger)idx{
    return self.layoutParameter[idx];
}

-(JGLayoutParameter*)add:(id)constant{
    return [self.layoutParameter add:constant];
}

-(JGLayoutParameter*)multiply:(id)multiplier{
    return [self.layoutParameter multiply:multiplier];
}

-(JGLayoutParameter*)withRelation:(NSLayoutRelation)relation{
    return [self.layoutParameter withRelation:relation];
}

-(JGLayoutParameter*)layoutParameter{
    return [JGLayoutParameter constant:self.floatValue];
}

@end
