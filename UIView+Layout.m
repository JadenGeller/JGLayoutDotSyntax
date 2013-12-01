//
//  UIView+Layout.m
//
//  Created by Jaden Geller on 11/29/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "UIView+Layout.h"
#import "JGLayoutParameter.h"

@implementation UIView (Layout)

@dynamic left, right, top, bottom, leading, trailing, width, height, centerX, centerY, baseline;

-(id)left{
    return [JGLayoutParameter layoutParameterWithObject:self attribute:NSLayoutAttributeLeft];
}

-(id)right{
    return [JGLayoutParameter layoutParameterWithObject:self attribute:NSLayoutAttributeRight];
}

-(id)top{
    return [JGLayoutParameter layoutParameterWithObject:self attribute:NSLayoutAttributeTop];
}

-(id)bottom{
    return [JGLayoutParameter layoutParameterWithObject:self attribute:NSLayoutAttributeBottom];
}

-(id)leading{
    return [JGLayoutParameter layoutParameterWithObject:self attribute:NSLayoutAttributeLeading];
}

-(id)trailing{
    return [JGLayoutParameter layoutParameterWithObject:self attribute:NSLayoutAttributeTrailing];
}

-(id)width{
    return [JGLayoutParameter layoutParameterWithObject:self attribute:NSLayoutAttributeWidth];
}

-(id)height{
    return [JGLayoutParameter layoutParameterWithObject:self attribute:NSLayoutAttributeHeight];
}

-(id)centerX{
    return [JGLayoutParameter layoutParameterWithObject:self attribute:NSLayoutAttributeCenterX];
}

-(id)centerY{
    return [JGLayoutParameter layoutParameterWithObject:self attribute:NSLayoutAttributeCenterY];
}

-(id)baseline{
    return [JGLayoutParameter layoutParameterWithObject:self attribute:NSLayoutAttributeBaseline];
}

-(void)setLeft:(id)left{
    [self addLayoutConstraintWithAttribute:NSLayoutAttributeLeft parameter:left];
}

-(void)setRight:(id)right{
    [self addLayoutConstraintWithAttribute:NSLayoutAttributeRight parameter:right];
}

-(void)setTop:(id)top{
    [self addLayoutConstraintWithAttribute:NSLayoutAttributeTop parameter:top];
}

-(void)setBottom:(id)bottom{
    [self addLayoutConstraintWithAttribute:NSLayoutAttributeBottom parameter:bottom];
}

-(void)setLeading:(id)leading{
    [self addLayoutConstraintWithAttribute:NSLayoutAttributeLeading parameter:leading];
}

-(void)setTrailing:(id)trailing{
    [self addLayoutConstraintWithAttribute:NSLayoutAttributeTrailing parameter:trailing];
}

-(void)setWidth:(id)width{
    [self addLayoutConstraintWithAttribute:NSLayoutAttributeWidth parameter:width];
}

-(void)setHeight:(id)height{
    [self addLayoutConstraintWithAttribute:NSLayoutAttributeHeight parameter:height];
}

-(void)setCenterX:(id)centerX{
    [self addLayoutConstraintWithAttribute:NSLayoutAttributeCenterX parameter:centerX];
}

-(void)setCenterY:(id)centerY{
    [self addLayoutConstraintWithAttribute:NSLayoutAttributeCenterY parameter:centerY];
}

-(void)setBaseline:(id)baseline{
    [self addLayoutConstraintWithAttribute:NSLayoutAttributeBaseline parameter:baseline];
}

-(void)addLayoutConstraintWithAttribute:(NSLayoutAttribute)attribute parameter:(id)theParameter{
    JGLayoutParameter *parameter;
    if ([theParameter isKindOfClass:[JGLayoutParameter class]]) {
        parameter = (JGLayoutParameter*)theParameter;
    }
    else if([theParameter isKindOfClass:[NSNumber class]]){
        parameter = [JGLayoutParameter constant:[(NSNumber*)theParameter floatValue]];
    }
    else{
        NSLog(@"Bad parameter type.");
    }
    UIView *receiver = parameter.object?[UIView nearestCommonView:@[self,parameter.object]]:self;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:parameter.relation toItem:parameter.object attribute:parameter.attribute multiplier:parameter.multiplier constant:parameter.constant];
    if (parameter.priority) constraint.priority = parameter.priority;
    [receiver addConstraint:constraint];
}

+(UIView*)nearestCommonView:(NSArray*)views{
    int closestView = INT_MAX;
    for (UIView *view in views) {
        closestView = MIN(closestView, [view displacementFromTopOfHeirachy]);
    }
    
    NSMutableArray *slice = [NSMutableArray array];
    for (UIView *view in views) {
        [slice addObject:[view viewWithDisplacementFromTopOfHeirachy:closestView]];
    }
    
    while (![UIView allObjectsInArrayAreEqual:slice]) {
        for (int i = 0; i<slice.count; i++) {
            slice[i] = [slice[i] superview];
        }
    }
    return slice[0]; //all equal or all nil
}

+(BOOL)allObjectsInArrayAreEqual:(NSArray*)array{
    BOOL returnValue = YES;
    NSObject *firstObject = array[0];
    for (int i = 1; i<array.count && returnValue; i++) {
        returnValue = [array[i]isEqual:firstObject];
    }
    return returnValue;
}

-(UIView*)viewWithDisplacementFromTopOfHeirachy:(int)displacement{
    return [self superviewOfOrder:[self displacementFromTopOfHeirachy]-displacement];
}

-(UIView*)superviewOfOrder:(int)order{
    UIView *view = self;
    for (int i = 0; i < order; i++) {
        view = [view superview];
    }
    return view;
}

-(int)displacementFromTopOfHeirachy{
    int count = 0;
    for (UIView *i = [self superview]; i; i = [i superview]) {
        count++;
    }
    return count;
}

@end
