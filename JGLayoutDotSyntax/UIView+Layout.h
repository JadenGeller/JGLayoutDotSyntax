//
//  UIView+Layout.h
//
//  Created by Jaden Geller on 11/29/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JGLayoutParameter;

@interface UIView (Layout)

/** The left side of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the left side of the object.
 
 @code
 
 viewA.left = viewB.right; // aligns left edge of viewA to right edge of viewB
 viewC.left = viewD.left;  // aligns left edge of viewC to left edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
  
 */
@property (nonatomic) id left;

/** The right side of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the right side of the object.
 
 @code
 
 viewA.right = viewB.right; // aligns right edge of viewA to right edge of viewB
 viewC.right = viewD.left;  // aligns right edge of viewC to left edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id right;

/** The top of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the top of the object.
 
 @code
 
 viewA.top = viewB.bottom; // aligns top edge of viewA to bottom edge of viewB
 viewC.top = viewD.top;    // aligns top edge of viewC to top edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id top;

/** The bottom of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the bottom of the object.
 
 @code
 
 viewA.bottom = viewB.bottom; // aligns bottom edge of viewA to bottom edge of viewB
 viewC.bottom = viewD.top;    // aligns bottom edge of viewC to top edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id bottom;

/** The leading edge of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the leading edge of the object.
 
 @code
 
 viewA.leading = viewB.trailing; // aligns leading edge of viewA to the trailing edge of viewB
 viewC.leading = viewD.leading;  // aligns leading edge of viewC to the leading edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id leading;

/** The trailing edge of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the trailing edge of the object.
 
 @code
 
 viewA.trailing = viewB.trailing; // aligns trailing edge of viewA to the trailing edge of viewB
 viewC.trailing = viewD.leading;  // aligns trailing edge of viewC to the leading edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id trailing;

/** The width of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter or constant NSNumber. Used as a getter, this returns a JGLayoutParameter representing the width of the object.
 
 @code
 
 viewA.width = viewB.width; // sets viewA width to match that of viewB
 viewC.width = @50;         // sets viewC width to 50 points
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id width;

/** The height of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter or constant NSNumber. Used as a getter, this returns a JGLayoutParameter representing the height of the object.
 
 @code
 
 viewA.height = viewB.height; // sets viewA height to match that of viewB
 viewC.height = @50;          // sets viewC height to 50 points
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id height;

/** The center along the x-axis of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the center along the x-axis of the object.
 
 @code
 
 viewA.centerX = viewB.centerX; // sets viewA center along the x-axis to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id centerX;

/** The center along the y-axis of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the center along the y-axis of the object.
 
 @code
 
 viewA.centerY = viewB.centerY; // sets viewA center along the y-axis to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id centerY;

/** The baseline of the object. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the baseline of the object.
 
 @code
 
 viewA.baseline = viewB.baseline; // sets viewA's baseline to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) id baseline;

/** Convenience property for setting the top, bottom, left, and right alginment of the reciever to be that of the view argument. As a setter, only another alignment property or a specifically formatted NSArray can be assigned. The NSArray must contain 4 object--a top, bottom, left, and right layout parameter. Note that complex layouts, such as setting the left of a view to the right of another view, cannot be obtained using this convenience property.
 
 @code
 
 viewA.alignment = viewB.alignment; // sets viewA's top, bottom, left, and right to that of viewB
 viewC.alignment = @[viewD.top, viewD.bottom, viewE.left, viewF.right];
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) NSArray *alignment;

/** Convenience property for setting the width and height alginment of the reciever to be that of the view argument. As a setter, another size property or an NSArray containing a width and a height layout parameter can be assigned.
 
 @code
 
 viewA.size = viewB.size; // sets viewA's width and height to that of viewB
 viewC.size = @[viewD.width, viewE.height];
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) NSArray *size;

/** Convenience property for setting the centerX and centerY of the reciever to be that of the view argument. As a setter, another center property or an NSArray containing a centerX and a centerY layout parameter can be assigned.
 
 @code
 
 viewA.center = viewB.center; // sets viewA's centerX and centerY to that of viewB
 viewC.center = @[viewD.centerX, viewE.centerY];
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
 */
@property (nonatomic) NSArray *position;

@end
