//
//  NSObject+DynamicConstraint.h
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/10/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JGLayoutParameter;

@interface NSObject (DynamicConstraint)

/** Returns a constraint associated with the given key-value path. Reciever must be KVO compliant (if you use properties, it should be!). Whenever the property changes in value, the constraint will automatically update.
 
 @code
 
 view.height = [downloader constraintForKeyPath: @"progress"]; // sets height of view equal to value of downloader.progress, and updates height of view whenever downloader.progress changes
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
-(JGLayoutParameter*)constraintForKeyPath:(NSString*)keyPath;

@end
