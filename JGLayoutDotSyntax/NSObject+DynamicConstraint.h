//
//  NSObject+DynamicConstraint.h
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/10/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (DynamicConstraint)

-(id)constraintForKeyPath:(NSString*)keyPath;
-(void)setConstraintForKeyPath:(NSString*)keyPath;

@end
