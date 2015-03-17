//
//  JGLayout.swift
//  JGLayoutDotSyntax
//
//  Objective-C code Copyright (c) 2014 Jaden Geller. All rights reserved.
//  Swift adaptation Copyright (c) 2014 Nicolas Gomollon. All rights reserved.
//

import Foundation
import UIKit

class JGLayout: NSObject {
	
	var object: AnyObject!
	var view: UIView! {
		if let view = object as? UIView {
			return view
		}
		return nil
	}
	
	
	override var description: String {
		return "<JGLayout; object = \(object)>"
	}
	
	init(object: AnyObject) {
		self.object = object
		super.init()
	}
	
	
	/** The top of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the top of the object.
 
 @code
 
 viewA.layout.top = viewB.layout.bottom // aligns top edge of viewA to bottom edge of viewB
 viewC.layout.top = viewD.layout.top    // aligns top edge of viewC to top edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var top: JGLayoutParameter! {
	get {
		return JGLayoutParameter(object: object, attribute: .Top)
	}
	set {
		view.addLayoutConstraintWithAttribute(.Top, parameter: newValue)
	}
	}
	
	/** The bottom of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the bottom of the object.
 
 @code
 
 viewA.layout.bottom = viewB.layout.bottom // aligns bottom edge of viewA to bottom edge of viewB
 viewC.layout.bottom = viewD.layout.top    // aligns bottom edge of viewC to top edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var bottom: JGLayoutParameter! {
	get {
		return JGLayoutParameter(object: object, attribute: .Bottom)
	}
	set {
		view.addLayoutConstraintWithAttribute(.Bottom, parameter: newValue)
	}
	}
	
	/** The left side of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the left side of the object.
 
 @code
 
 viewA.layout.left = viewB.layout.right // aligns left edge of viewA to right edge of viewB
 viewC.layout.left = viewD.layout.left  // aligns left edge of viewC to left edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
	
	*/
	var left: JGLayoutParameter! {
	get {
		return JGLayoutParameter(object: object, attribute: .Left)
	}
	set {
		view.addLayoutConstraintWithAttribute(.Left, parameter: newValue)
	}
	}
	
	/** The right side of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the right side of the object.
 
 @code
 
 viewA.layout.right = viewB.layout.right // aligns right edge of viewA to right edge of viewB
 viewC.layout.right = viewD.layout.left  // aligns right edge of viewC to left edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var right: JGLayoutParameter! {
	get {
		return JGLayoutParameter(object: object, attribute: .Right)
	}
	set {
		view.addLayoutConstraintWithAttribute(.Right, parameter: newValue)
	}
	}
	
	/** The leading edge of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the leading edge of the object.
 
 @code
 
 viewA.layout.leading = viewB.layout.trailing // aligns leading edge of viewA to the trailing edge of viewB
 viewC.layout.leading = viewD.layout.leading  // aligns leading edge of viewC to the leading edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var leading: JGLayoutParameter! {
	get {
		return JGLayoutParameter(object: object, attribute: .Leading)
	}
	set {
		view.addLayoutConstraintWithAttribute(.Leading, parameter: newValue)
	}
	}
	
	/** The trailing edge of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the trailing edge of the object.
 
 @code
 
 viewA.layout.trailing = viewB.layout.trailing // aligns trailing edge of viewA to the trailing edge of viewB
 viewC.layout.trailing = viewD.layout.leading  // aligns trailing edge of viewC to the leading edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var trailing: JGLayoutParameter! {
	get {
		return JGLayoutParameter(object: object, attribute: .Trailing)
	}
	set {
		view.addLayoutConstraintWithAttribute(.Trailing, parameter: newValue)
	}
	}
	
	/** The width of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter or constant NSNumber. Used as a getter, this returns a JGLayoutParameter representing the width of the object.
 
 @code
 
 viewA.layout.width = viewB.layout.width // sets viewA width to match that of viewB
 viewC.layout.width = 50.0              // sets viewC width to 50 points
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var width: JGLayoutParameter! {
	get {
		return JGLayoutParameter(object: object, attribute: .Width)
	}
	set {
		view.addLayoutConstraintWithAttribute(.Width, parameter: newValue)
	}
	}
	
	/** The height of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter or constant NSNumber. Used as a getter, this returns a JGLayoutParameter representing the height of the object.
 
 @code
 
 viewA.layout.height = viewB.layout.height // sets viewA height to match that of viewB
 viewC.layout.height = 50.0               // sets viewC height to 50 points
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var height: JGLayoutParameter! {
	get {
		return JGLayoutParameter(object: object, attribute: .Height)
	}
	set {
		view.addLayoutConstraintWithAttribute(.Height, parameter: newValue)
	}
	}
	
	/** The center along the x-axis of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the center along the x-axis of the object.
 
 @code
 
 viewA.layout.centerX = viewB.layout.centerX // sets viewA center along the x-axis to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var centerX: JGLayoutParameter! {
	get {
		return JGLayoutParameter(object: object, attribute: .CenterX)
	}
	set {
		view.addLayoutConstraintWithAttribute(.CenterX, parameter: newValue)
	}
	}
	
	/** The center along the y-axis of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the center along the y-axis of the object.
 
 @code
 
 viewA.layout.centerY = viewB.layout.centerY // sets viewA center along the y-axis to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var centerY: JGLayoutParameter! {
	get {
		return JGLayoutParameter(object: object, attribute: .CenterY)
	}
	set {
		view.addLayoutConstraintWithAttribute(.CenterY, parameter: newValue)
	}
	}
	
	/** The baseline of the object. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the baseline of the object.
 
 @code
 
 viewA.layout.baseline = viewB.layout.baseline // sets viewA's baseline to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var baseline: JGLayoutParameter! {
	get {
		return JGLayoutParameter(object: object, attribute: .Baseline)
	}
	set {
		view.addLayoutConstraintWithAttribute(.Baseline, parameter: newValue)
	}
	}
	
	/** Convenience property for setting the top, bottom, left, and right alginment of the reciever to be that of the view argument. As a setter, only another alignment property or a specifically formatted NSArray can be assigned. The NSArray must contain 4 object--a top, bottom, left, and right layout parameter. Note that complex layouts, such as setting the left of a view to the right of another view, cannot be obtained using this convenience property.
 
 @code
 
 viewA.layout.alignment = viewB.layout.alignment // sets viewA's top, bottom, left, and right to that of viewB
 viewC.layout.alignment = [viewD.layout.top, viewD.layout.bottom, viewE.layout.left, viewF.layout.right]
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var alignment: Array<JGLayoutParameter!> {
	get {
		return [top, bottom, left, right] as Array<JGLayoutParameter!>
	}
	set {
		assert(newValue.count == 4, "Invalid alignment: Alignment array does not contain 4 objects")
		for parameter in newValue {
			switch parameter.attribute {
			case .Top:
				top = parameter
			case .Bottom:
				bottom = parameter
			case .Left:
				left = parameter
			case .Right:
				right = parameter
			case .Leading:
				leading = parameter
			case .Trailing:
				trailing = parameter
			default:
				break
			}
		}
	}
	}
	
	/** Convenience property for setting the width and height alginment of the reciever to be that of the view argument. As a setter, another size property or an NSArray containing a width and a height layout parameter can be assigned.
 
 @code
 
 viewA.layout.size = viewB.layout.size // sets viewA's width and height to that of viewB
 viewC.layout.size = [viewD.layout.width, viewE.layout.height]
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var size: Array<JGLayoutParameter!> {
	get {
		return [width, height] as Array<JGLayoutParameter!>
	}
	set {
		assert(newValue.count == 2, "Invalid size: Size array does not contain 2 objects")
		for parameter in newValue {
			switch parameter.attribute {
			case .Width:
				width = parameter
			case .Height:
				height = parameter
			default:
				break
			}
		}
	}
	}
	
	/** Convenience property for setting the centerX and centerY of the reciever to be that of the view argument. As a setter, another center property or an NSArray containing a centerX and a centerY layout parameter can be assigned.
 
 @code
 
 viewA.layout.center = viewB.layout.center // sets viewA's centerX and centerY to that of viewB
 viewC.layout.center = [viewD.layout.centerX, viewE.layout.centerY]
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var center: Array<JGLayoutParameter!> {
	get {
		return [centerX, centerY] as Array<JGLayoutParameter!>
	}
	set {
		assert(newValue.count == 2, "Invalid position: Position array does not contain 2 objects")
		for parameter in newValue {
			switch parameter.attribute {
			case .CenterX:
				centerX = parameter
			case .CenterY:
				centerY = parameter
			default:
				break
			}
		}
	}
	}
	
}
