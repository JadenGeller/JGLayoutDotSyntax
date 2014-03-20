//
//  JGDynamicConstraintObserver.m
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/10/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import "JGDynamicConstraintObserver.h"
#import "JGDynamicConstraint.h"

@interface JGDynamicConstraintObserver ()

@property (nonatomic, readonly) NSMutableDictionary *watchedConstants;
@property (nonatomic, readonly) NSMutableDictionary *watchedMultipliers;

@end

@implementation JGDynamicConstraintObserver

@synthesize watchedConstants = _watchedConstants, watchedMultipliers = _watchedMultipliers;

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    NSLayoutConstraint *layoutConstraintConstant = [self.watchedConstants objectForKey:[JGDynamicConstraint constraintWithObject:object keyPath:keyPath]];
    NSLayoutConstraint *layoutConstraintMultiplier = [self.watchedMultipliers objectForKey:[JGDynamicConstraint constraintWithObject:object keyPath:keyPath]];
    
    if (layoutConstraintConstant) [self.delegate updatedValue:change[NSKeyValueChangeNewKey] forConstraint:layoutConstraintConstant forMultiplier:NO];
    if (layoutConstraintMultiplier) [self.delegate updatedValue:change[NSKeyValueChangeNewKey] forConstraint:layoutConstraintMultiplier forMultiplier:YES];

}

-(NSMutableDictionary*)watchedMultipliers{
    if (!_watchedMultipliers) {
        _watchedMultipliers = [NSMutableDictionary dictionary];
    }
    return _watchedMultipliers;
}

-(NSMutableDictionary*)watchedConstants{
    if (!_watchedConstants) {
        _watchedConstants = [NSMutableDictionary dictionary];
    }
    return _watchedConstants;
}

-(NSMutableDictionary*)watchedForMultiplier:(BOOL)useMultiplier{
    return useMultiplier ? self.watchedMultipliers : self.watchedConstants;
}

-(BOOL)isWatched:(JGDynamicConstraint*)constraint{
    return [self.watchedMultipliers objectForKey:constraint] || [self.watchedConstants objectForKey:constraint];
}

-(void)startWatchingDynamicConstraint:(JGDynamicConstraint*)constraint{
    if (![self isWatched:constraint]) {
        [constraint.object addObserver:self forKeyPath:constraint.keyPath options:NSKeyValueObservingOptionNew context:NULL];
    }
}

-(void)startUpdatingConstraint:(NSLayoutConstraint *)layoutConstraint withDynamicConstraint:(JGDynamicConstraint*)dynamicConstraint forMultiplier:(BOOL)useMultiplier{
    [self startWatchingDynamicConstraint:dynamicConstraint];
    [[self watchedForMultiplier:useMultiplier] setObject:layoutConstraint forKey:dynamicConstraint];
}

-(void)stopUpdatingConstraintWithAttribute:(NSLayoutAttribute)layoutAttribute dictionary:(NSMutableDictionary*)dictionary{
    for (NSLayoutConstraint *constraint in [dictionary allValues]) {
        if (constraint.firstAttribute == layoutAttribute){
            JGDynamicConstraint *dynamicConstraint = [dictionary objectForKey:constraint];
            [dynamicConstraint.object removeObserver:self forKeyPath:dynamicConstraint.keyPath];
            [dictionary removeObjectForKey:constraint];
        }
    }
}

-(void)stopUpdatingAllConstraintsWithDictionary:(NSMutableDictionary*)dictionary{
    for (NSLayoutConstraint *constraint in dictionary) {
        JGDynamicConstraint *dynamicConstraint = [dictionary objectForKey:constraint];
        [dynamicConstraint.object removeObserver:self forKeyPath:dynamicConstraint.keyPath];
        [dictionary removeObjectForKey:constraint];
    }
}

-(void)stopUpdatingConstraintWithAttribute:(NSLayoutAttribute)layoutConstraint{
    [self stopUpdatingConstraintWithAttribute:layoutConstraint dictionary:self.watchedConstants];
    [self stopUpdatingConstraintWithAttribute:layoutConstraint dictionary:self.watchedMultipliers];
}

-(void)stopUpdatingAllConstraints{
    [self stopUpdatingAllConstraintsWithDictionary:self.watchedConstants];
    [self stopUpdatingAllConstraintsWithDictionary:self.watchedMultipliers];
}

-(void)dealloc{
    [self stopUpdatingAllConstraints];
}

@end
