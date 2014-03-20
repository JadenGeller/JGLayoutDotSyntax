//
//  JGDynamicConstraintObserver.h
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/10/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JGDynamicConstraint;

@protocol JGDynamicConstraintObserverDelegate <NSObject>

-(void)updatedValue:(NSNumber*)value forConstraint:(NSLayoutConstraint*)constraint forMultiplier:(BOOL)useMultiplier;

@end

@interface JGDynamicConstraintObserver : NSObject

@property (nonatomic, weak) id<JGDynamicConstraintObserverDelegate> delegate;

-(void)startUpdatingConstraint:(NSLayoutConstraint *)layoutConstraint withDynamicConstraint:(JGDynamicConstraint*)dynamicConstraint forMultiplier:(BOOL)useMultiplier;
-(void)stopUpdatingConstraintWithAttribute:(NSLayoutAttribute)layoutAttribute;
-(void)stopUpdatingAllConstraints;

@end
