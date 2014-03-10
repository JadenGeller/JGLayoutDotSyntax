//
//  JGDynamicSizeLabel.h
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/9/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGDynamicSizeLabel : UILabel

/** The font size of the lable. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the baseline of the object.
 
 @code
 
 viewA.baseline = viewB.baseline; // sets viewA's baseline to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id fontSize;

@end
