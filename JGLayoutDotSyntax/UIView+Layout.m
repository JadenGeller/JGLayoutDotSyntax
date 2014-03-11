//
//  UIView+Layout.m
//
//  Created by Jaden Geller on 11/29/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "UIView+Layout.h"
#import "JGLayoutParameter.h"
#import "JGDynamicSizeLabel.h"

@implementation UIView (Layout)

@dynamic left, right, top, bottom, leading, trailing, width, height, centerX, centerY, baseline;

#pragma mark - Getters

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

#pragma mark - Setters

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

#pragma mark - Adding Constraint

-(void)removeLayoutConstraintsForAttribute:(NSLayoutAttribute)attribute{
    UIView *view = self;
    
    // Remove all constraints relating to self and attribute from all superviews of self
    do {
        for (NSLayoutConstraint *constraint in view.constraints) {
            if (([constraint.firstItem isEqual:self] && constraint.firstAttribute == attribute) || ([constraint.secondItem isEqual:self] && constraint.secondAttribute == attribute)) {
                [view removeConstraint:constraint];
            }
        }
        view = view.superview;
    } while (view.superview);
}

// parameter argument may be either a JGLayoutParameter or a NSNumber
-(void)addLayoutConstraintWithAttribute:(NSLayoutAttribute)attribute parameter:(id)theParameter{
    
    [self removeLayoutConstraintsForAttribute:attribute];
    
    if (!theParameter) {
        return;
    }
    
    JGLayoutParameter *parameter;
    
    //Checks class of parameter input
    if ([theParameter isKindOfClass:[JGLayoutParameter class]]) {
        parameter = (JGLayoutParameter*)theParameter;
    }
    else if([theParameter isKindOfClass:[NSNumber class]]){
        // Creates a JGLayoutParameter out of NSNumber input
        parameter = [JGLayoutParameter constant:[(NSNumber*)theParameter floatValue]];
    }
    else{
        [NSException raise:@"Bad parameter input." format:@"Parameter input must be either a NSNumber or a JGLayoutParameter."];
    }
    
    // Gets pointer to the view to which the NSLayoutConstraint should be added
    UIView *receiver = parameter.object?[UIView nearestCommonView:@[self,parameter.object]]:self;
    
    // Creates constraint
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self attribute:attribute relatedBy:parameter.relation toItem:parameter.object attribute:parameter.attribute multiplier:parameter.multiplier constant:parameter.constant];
    
    // Sets priority, if specified
    if (parameter.priority) constraint.priority = parameter.priority;
    
    // Adds constraint
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

-(void)setAlignment:(NSArray *)alignment{
    if (alignment.count == 4) {
        for (JGLayoutParameter *parameter in alignment) {
            switch (parameter.attribute) {
                case NSLayoutAttributeTop:
                    self.top = parameter;
                    break;
                    
                case NSLayoutAttributeBottom:
                    self.bottom = parameter;
                    break;
                    
                case NSLayoutAttributeLeft:
                    self.left = parameter;
                    break;
                    
                case NSLayoutAttributeRight:
                    self.right = parameter;
                    break;
                    
                case NSLayoutAttributeLeading:
                    self.leading = parameter;
                    break;
                    
                case NSLayoutAttributeTrailing:
                    self.trailing = parameter;
                    break;
                    
                default:
                    break;
            }
        }
    }
    else [NSException raise:@"Invalid alignment" format:@"Alignment array does not contain 4 objects"];
}

-(void)setSize:(NSArray *)size{
    if (size.count == 2) {
        for (JGLayoutParameter *parameter in size) {
            switch (parameter.attribute) {
                case NSLayoutAttributeWidth:
                    self.width = parameter;
                    break;
                    
                case NSLayoutAttributeHeight:
                    self.height = parameter;
                    break;
                
                default:
                    break;
            }
        }
    }
    else [NSException raise:@"Invalid size" format:@"Size array does not contain 2 objects"];
}

-(void)setPosition:(NSArray *)position{
    if (position.count == 2) {
        for (JGLayoutParameter *parameter in position) {
            switch (parameter.attribute) {
                case NSLayoutAttributeCenterX:
                    self.centerX = parameter;
                    break;
                    
                case NSLayoutAttributeCenterY:
                    self.centerY = parameter;
                    break;
                    
                default:
                    break;
            }
        }
    }
    else [NSException raise:@"Invalid alignment" format:@"Center array does not contain 2 objects"];
}

-(NSArray *)alignment{
    return @[self.top, self.bottom, self.left, self.right];
}

-(NSArray *)size{
    return @[self.width, self.height];
}

-(NSArray *)position{
    return @[self.centerX, self.centerY];
}

@end
