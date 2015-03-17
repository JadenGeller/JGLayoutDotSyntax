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
	
	var layout: JGLayout {
		return JGLayout(object: self)
	}
	
	func removeLayoutConstraintsForAttribute(attribute: NSLayoutAttribute) {
		var view: UIView? = self
		
		// Remove all constraints relating to self and attribute from all superviews of self
		do {
			if var view = view {
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
			}
			view = view?.superview
		} while view?.superview != nil
	}
	
	func addLayoutConstraintWithAttribute(attribute: NSLayoutAttribute, parameter: AnyObject?) {
		removeLayoutConstraintsForAttribute(attribute)
		if parameter == nil { return }
		
		var layoutParameter: JGLayoutParameter!
		if let layoutParam = parameter as? JGLayoutParameter {
			layoutParameter = layoutParam
		} else if let constant = parameter as? Double {
			layoutParameter = JGLayoutParameter(constant: constant)
		}
		assert(layoutParameter != nil, "Bad parameter input: Parameter input must be either a JGLayoutParameter, NSNumber, Double, Float, or Int.")
		
		var receiver: UIView!
		var layoutConstraint: NSLayoutConstraint!
		
		if let object = layoutParameter.object as? UIView {
			receiver = nearestCommonView([self, object])
			
			layoutConstraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: layoutParameter.relation, toItem: object, attribute: layoutParameter.attribute, multiplier: CGFloat(layoutParameter.multiplier), constant: CGFloat(layoutParameter.constant))
		} else {
			receiver = self
			
			layoutConstraint = NSLayoutConstraint(item: self, attribute: attribute, relatedBy: .Equal, toItem: self, attribute: attribute, multiplier: 0.0, constant: CGFloat(layoutParameter.constant))
		}
		
		if layoutParameter.priority != JGLayoutPriorityRequired {
			layoutConstraint.priority = UILayoutPriority(layoutParameter.priority)
		}
		
		receiver.addConstraint(layoutConstraint)
	}
	
}

// MARK: Private Helper Methods
private extension UIView {
	
	func nearestCommonView(views: Array<UIView>) -> UIView {
		var closestView = Int.max
		for view in views {
			closestView = min(closestView, view.displacementFromTopOfHierarchy)
		}
		
		var slice = Array<UIView>()
		for view in views {
			slice += [view.viewWithDisplacementFromTopOfHierarchy(closestView)]
		}
		
		while !UIView.allObjectsInArrayAreEqual(slice) {
			for i in 0..<slice.count {
				slice[i] = slice[i].superview!
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
	
	func viewWithDisplacementFromTopOfHierarchy(displacement: Int) -> UIView! {
		return superviewOfOrder(displacementFromTopOfHierarchy - displacement)
	}
	
	func superviewOfOrder(order: Int) -> UIView! {
		var view: UIView! = self
		for _ in 0..<order {
			view = view.superview
		}
		return view
	}
	
	var displacementFromTopOfHierarchy: Int {
		var count = 0
		for var i = superview; i != nil; i = i?.superview {
			count++
		}
		return count
	}
	
}
