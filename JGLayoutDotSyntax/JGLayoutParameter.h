//
//  JGLayoutParameter.h
//
//  Created by Jaden Geller on 11/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JGLayoutConstruction.h"

@interface JGLayoutParameter : NSObject <JGLayoutConstruction>

@property (nonatomic, readonly) NSLayoutAttribute attribute;
@property (nonatomic, readonly) NSLayoutRelation relation;
@property (nonatomic, readonly) id object;
@property (nonatomic, readonly) NSInteger priority;
@property (nonatomic, readonly) CGFloat constant;
@property (nonatomic, readonly) CGFloat multiplier;

/** Initializes a JGLayoutParameter and sets the constant. It is not necessary to use this, however, as the JGLayoutConstruction category for the NSNumber class allows NSNumbers to be used as constant JGLayoutParameters.
 
 @param constant A CGFloat representing the desired NSLayoutConstraint constant.
 
 @return An instance of JGLayoutParameter
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
+(JGLayoutParameter*)constant:(CGFloat)constant;

/** Initializes a JGLayoutParameter and sets the object and attribute. It is not necessary to use this, however, as the Layout category for the UIView class adds properties with getters that return JGLayoutParameters with the requested attributes.
 
 @param object An id representing the desired secondary view for the NSLayoutConstraint.
 @param attribute A NSLayoutAttribute representing the desired NSLayoutConstraint relationship.
 
 @return An instance of JGLayoutParameter
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
+(JGLayoutParameter*)layoutParameterWithObject:(id)object attribute:(NSLayoutAttribute)attribute;

@end
