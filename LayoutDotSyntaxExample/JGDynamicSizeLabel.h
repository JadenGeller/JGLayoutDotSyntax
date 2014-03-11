//
//  JGDynamicSizeLabel.h
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/9/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JGDynamicSizeLabel : UILabel

/** The font size of the label. Used as a setter, this creates and adds a "constraint" based upon the specification of the assigned JGLayoutParameter. The label's original font size is ignored, and replaced by this constraint. Can only be used with the width and the height attribute. Used as a getter, will return any associated constraint. If none exists, will return nil. Note that, in order to add a font size constraint, the label must be the sender.
 
 @code
 
 label.fontSize = view.height; // sets viewA's baseline to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id fontSize;

@end
