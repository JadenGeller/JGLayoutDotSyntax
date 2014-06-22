//
//  UIViewExtension.swift
//  JGLayoutDotSyntax
//
//  Objective-C code Copyright (c) 2014 Jaden Geller. All rights reserved.
//  Swift adaptation Copyright (c) 2014 Nicolas Gomollon. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
	
	/** The top of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the top of the object.
 
 @code
 
 viewA.layoutTop = viewB.layoutBottom // aligns top edge of viewA to bottom edge of viewB
 viewC.layoutTop = viewD.layoutTop    // aligns top edge of viewC to top edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutTop: AnyObject! {
	get {
		return JGLayoutParameter(object: self, attribute: .Top)
	}
	set {
		addLayoutConstraintWithAttribute(.Top, parameter: newValue)
	}
	}
	
	/** The bottom of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the bottom of the object.
 
 @code
 
 viewA.layoutBottom = viewB.layoutBottom // aligns bottom edge of viewA to bottom edge of viewB
 viewC.layoutBottom = viewD.layoutTop    // aligns bottom edge of viewC to top edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutBottom: AnyObject! {
	get {
		return JGLayoutParameter(object: self, attribute: .Bottom)
	}
	set {
		addLayoutConstraintWithAttribute(.Bottom, parameter: newValue)
	}
	}
	
	/** The left side of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the left side of the object.
 
 @code
 
 viewA.layoutLeft = viewB.layoutRight // aligns left edge of viewA to right edge of viewB
 viewC.layoutLeft = viewD.layoutLeft  // aligns left edge of viewC to left edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
	
	*/
	var layoutLeft: AnyObject! {
	get {
		return JGLayoutParameter(object: self, attribute: .Left)
	}
	set {
		addLayoutConstraintWithAttribute(.Left, parameter: newValue)
	}
	}
	
	/** The right side of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the right side of the object.
 
 @code
 
 viewA.layoutRight = viewB.layoutRight // aligns right edge of viewA to right edge of viewB
 viewC.layoutRight = viewD.layoutLeft  // aligns right edge of viewC to left edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutRight: AnyObject! {
	get {
		return JGLayoutParameter(object: self, attribute: .Right)
	}
	set {
		addLayoutConstraintWithAttribute(.Right, parameter: newValue)
	}
	}
	
	/** The leading edge of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the leading edge of the object.
 
 @code
 
 viewA.layoutLeading = viewB.layoutTrailing // aligns leading edge of viewA to the trailing edge of viewB
 viewC.layoutLeading = viewD.layoutLeading  // aligns leading edge of viewC to the leading edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutLeading: AnyObject! {
	get {
		return JGLayoutParameter(object: self, attribute: .Leading)
	}
	set {
		addLayoutConstraintWithAttribute(.Leading, parameter: newValue)
	}
	}
	
	/** The trailing edge of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the trailing edge of the object.
 
 @code
 
 viewA.layoutTrailing = viewB.layoutTrailing // aligns trailing edge of viewA to the trailing edge of viewB
 viewC.layoutTrailing = viewD.layoutLeading  // aligns trailing edge of viewC to the leading edge of viewD
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutTrailing: AnyObject! {
	get {
		return JGLayoutParameter(object: self, attribute: .Trailing)
	}
	set {
		addLayoutConstraintWithAttribute(.Trailing, parameter: newValue)
	}
	}
	
	/** The width of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter or constant NSNumber. Used as a getter, this returns a JGLayoutParameter representing the width of the object.
 
 @code
 
 viewA.layoutWidth = viewB.layoutWidth // sets viewA width to match that of viewB
 viewC.layoutWidth = 50.0              // sets viewC width to 50 points
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutWidth: AnyObject! {
	get {
		return JGLayoutParameter(object: self, attribute: .Width)
	}
	set {
		addLayoutConstraintWithAttribute(.Width, parameter: newValue)
	}
	}
	
	/** The height of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter or constant NSNumber. Used as a getter, this returns a JGLayoutParameter representing the height of the object.
 
 @code
 
 viewA.layoutHeight = viewB.layoutHeight // sets viewA height to match that of viewB
 viewC.layoutHeight = 50.0               // sets viewC height to 50 points
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutHeight: AnyObject! {
	get {
		return JGLayoutParameter(object: self, attribute: .Height)
	}
	set {
		addLayoutConstraintWithAttribute(.Height, parameter: newValue)
	}
	}
	
	/** The center along the x-axis of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the center along the x-axis of the object.
 
 @code
 
 viewA.layoutCenterX = viewB.layoutCenterX // sets viewA center along the x-axis to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutCenterX: AnyObject! {
	get {
		return JGLayoutParameter(object: self, attribute: .CenterX)
	}
	set {
		addLayoutConstraintWithAttribute(.CenterX, parameter: newValue)
	}
	}
	
	/** The center along the y-axis of the object’s alignment rectangle. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the center along the y-axis of the object.
 
 @code
 
 viewA.layoutCenterY = viewB.layoutCenterY // sets viewA center along the y-axis to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutCenterY: AnyObject! {
	get {
		return JGLayoutParameter(object: self, attribute: .CenterY)
	}
	set {
		addLayoutConstraintWithAttribute(.CenterY, parameter: newValue)
	}
	}
	
	/** The baseline of the object. Used as a setter, this creates and adds a NSLayoutContraint based upon the specification of the assigned JGLayoutParameter. Used as a getter, this returns a JGLayoutParameter representing the baseline of the object.
 
 @code
 
 viewA.layoutBaseline = viewB.layoutBaseline // sets viewA's baseline to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutBaseline: AnyObject! {
	get {
		return JGLayoutParameter(object: self, attribute: .Baseline)
	}
	set {
		addLayoutConstraintWithAttribute(.Baseline, parameter: newValue)
	}
	}
	
	/** Convenience property for setting the top, bottom, left, and right alginment of the reciever to be that of the view argument. As a setter, only another alignment property or a specifically formatted NSArray can be assigned. The NSArray must contain 4 object--a top, bottom, left, and right layout parameter. Note that complex layouts, such as setting the left of a view to the right of another view, cannot be obtained using this convenience property.
 
 @code
 
 viewA.layoutAlignment = viewB.layoutAlignment // sets viewA's top, bottom, left, and right to that of viewB
 viewC.layoutAlignment = [viewD.layoutTop, viewD.layoutBottom, viewE.layoutLeft, viewF.layoutRight]
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutAlignment: Array<JGLayoutParameter!> {
	get {
		return [layoutTop, layoutBottom, layoutLeft, layoutRight] as Array<JGLayoutParameter!>
	}
	set {
		assert(newValue.count == 4, "Invalid alignment: Alignment array does not contain 4 objects")
		for parameter in newValue {
			switch parameter.attribute {
			case .Top:
				layoutTop = parameter
			case .Bottom:
				layoutBottom = parameter
			case .Left:
				layoutLeft = parameter
			case .Right:
				layoutRight = parameter
			case .Leading:
				layoutLeading = parameter
			case .Trailing:
				layoutTrailing = parameter
			default:
				break
			}
		}
	}
	}
	
	/** Convenience property for setting the width and height alginment of the reciever to be that of the view argument. As a setter, another size property or an NSArray containing a width and a height layout parameter can be assigned.
 
 @code
 
 viewA.layoutSize = viewB.layoutSize // sets viewA's width and height to that of viewB
 viewC.layoutSize = [viewD.layoutWidth, viewE.layoutHeight]
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutSize: Array<JGLayoutParameter!> {
	get {
		return [layoutWidth, layoutHeight] as Array<JGLayoutParameter!>
	}
	set {
		assert(newValue.count == 2, "Invalid size: Size array does not contain 2 objects")
		for parameter in newValue {
			switch parameter.attribute {
			case .Width:
				layoutWidth = parameter
			case .Height:
				layoutHeight = parameter
			default:
				break
			}
		}
	}
	}
	
	/** Convenience property for setting the centerX and centerY of the reciever to be that of the view argument. As a setter, another center property or an NSArray containing a centerX and a centerY layout parameter can be assigned.
 
 @code
 
 viewA.layoutCenter = viewB.layoutCenter // sets viewA's centerX and centerY to that of viewB
 viewC.layoutCenter = [viewD.layoutCenterX, viewE.layoutCenterY]
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var layoutCenter: Array<JGLayoutParameter!> {
	get {
		return [layoutCenterX, layoutCenterY] as Array<JGLayoutParameter!>
	}
	set {
		assert(newValue.count == 2, "Invalid position: Position array does not contain 2 objects")
		for parameter in newValue {
			switch parameter.attribute {
			case .CenterX:
				layoutCenterX = parameter
			case .CenterY:
				layoutCenterY = parameter
			default:
				break
			}
		}
	}
	}
	
	
	func removeLayoutConstraintsForAttribute(attribute: NSLayoutAttribute) {
		var view = self
		
		// Remove all constraints relating to self and attribute from all superviews of self
		do {
			for constraint: AnyObject in view.constraints() {
				if let constraint = constraint as? NSLayoutConstraint {
					let firstItem = constraint.firstItem as? UIView
					let secondItem = constraint.secondItem as? UIView
					if ((firstItem == self) && (constraint.firstAttribute == attribute)) ||
						((secondItem == self) && (constraint.secondAttribute == attribute)) {
							view.removeConstraint(constraint)
					}
				}
			}
			view = view.superview
		} while view.superview
	}
	
	func addLayoutConstraintWithAttribute(attribute: NSLayoutAttribute, parameter: AnyObject?) {
		removeLayoutConstraintsForAttribute(attribute)
		if !parameter { return }
		
		var layoutParameter: JGLayoutParameter!
		if let layoutParam = parameter as? JGLayoutParameter {
			layoutParameter = layoutParam
		} else if let constant = parameter as? Double {
			layoutParameter = JGLayoutParameter(constant: constant)
		}
		assert(layoutParameter, "Bad parameter input: Parameter input must be either a JGLayoutParameter, NSNumber, Double, Float, or Int.")
		
		var receiver: UIView!
		var layoutConstraint: NSLayoutConstraint!
		
		if let object = layoutParameter.object as? UIView {
			receiver = nearestCommonView([self, object])
			
			layoutConstraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: layoutParameter.relation, toItem: object, attribute: layoutParameter.attribute, multiplier: layoutParameter.multiplier, constant: layoutParameter.constant)
		} else {
			receiver = self
			
			layoutConstraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .Equal, toItem: self, attribute: attribute, multiplier: 0.0, constant: layoutParameter.constant)
		}
		
		if layoutParameter.priority != UILayoutPriorityRequired {
			layoutConstraint.priority = UILayoutPriority(layoutParameter.priority)
		}
		
		receiver.addConstraint(layoutConstraint)
	}
	
	func nearestCommonView(views: Array<UIView>) -> UIView {
		var closestView = Int.max
		for view in views {
			closestView = min(closestView, view.displacementFromTopOfHierarchy)
		}
		
		var slice = Array<UIView>()
		for view in views {
			slice += view.viewWithDisplacementFromTopOfHierarchy(closestView)
		}
		
		while !UIView.allObjectsInArrayAreEqual(slice) {
			for i in 0..slice.count {
				slice[i] = slice[i].superview
			}
		}
		return slice[0]
	}
	
	class func allObjectsInArrayAreEqual(array: Array<NSObject>) -> Bool {
		var arrayGenerator = array.generate()
		let firstObject = arrayGenerator.next()
		for object in arrayGenerator {
			if object != firstObject { return false }
		}
		return true
	}
	
	func viewWithDisplacementFromTopOfHierarchy(displacement: Int) -> UIView {
		return superviewOfOrder(displacementFromTopOfHierarchy - displacement)
	}
	
	func superviewOfOrder(order: Int) -> UIView {
		var view = self
		for _ in 0..order {
			view = view.superview
		}
		return view
	}
	
	var displacementFromTopOfHierarchy: Int {
		var count = 0
		for var i = superview; i; i = i.superview {
			count++
		}
		return count
	}
	
}
