//
//  JGLayoutConstruction.h
//
//  Created by Jaden Geller on 11/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JGLayoutParameter;

@protocol JGLayoutConstruction <NSObject>

/** Adds a constant to the given JGLayoutParameter and returns the same instance of JGLayoutParameter. The only reason that there is a return value is for conveneince, allowing layout constraints to be specified on a single line.
 
 @param constant A CGFloat representing the desired NSLayoutConstraint constant.
 
 @return The receiver
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
-(JGLayoutParameter*)add:(id)constant;

/** Sets the multiplier for the given JGLayoutParameter and returns the same instance of JGLayoutParameter. The only reason that there is a return value is for conveneince, allowing layout constraints to be specified on a single line.
 
 @param multiplier A CGFloat representing the desired NSLayoutConstraint multiplier.
 
 @return The receiver
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
-(JGLayoutParameter*)multiply:(id)constant;

/** Sets the relationship for the given JGLayoutParameter and returns the same instance of JGLayoutParameter. The only reason that there is a return value is for conveneince, allowing layout constraints to be specified on a single line.
 
 @param relation A NSLayoutRelation representing the desired NSLayoutConstraint relationship.
 
 @return An instance of JGLayoutParameter
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
-(JGLayoutParameter*)withRelation:(NSLayoutRelation)relation;

- (id)objectAtIndexedSubscript:(NSUInteger)idx;

@end