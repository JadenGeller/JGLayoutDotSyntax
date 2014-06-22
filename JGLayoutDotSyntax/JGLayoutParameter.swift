//
//  JGLayoutParameter.swift
//  JGLayoutDotSyntax
//
//  Objective-C code Copyright (c) 2014 Jaden Geller. All rights reserved.
//  Swift adaptation Copyright (c) 2014 Nicolas Gomollon. All rights reserved.
//

import Foundation
import UIKit

class JGLayoutParameter: NSObject, JGLayoutConstruction {
	
	var object: AnyObject?
	var attribute: NSLayoutAttribute
	var relation: NSLayoutRelation
	var priority: Int
	var constant: Double
	var multiplier: Double
	
	override var description: String {
		return "<JGLayoutParameter; object = \(object); constant = \(constant); multiplier = \(multiplier)>"
	}
	
	/** Returns an initialized JGLayoutParameter. */
	convenience init() {
		self.init(object: nil, attribute: .NotAnAttribute, relation: .Equal, priority: UILayoutPriorityRequired, constant: 0.0, multiplier: 1.0)
	}
	
	/** Returns an initialized JGLayoutParameter with all its parameters set. */
	init(object: AnyObject?, attribute: NSLayoutAttribute, relation: NSLayoutRelation, priority: Int, constant: Double, multiplier: Double) {
		self.object = object
		self.attribute = attribute
		self.relation = relation
		self.priority = priority
		self.constant = constant
		self.multiplier = multiplier
		super.init()
	}
	
	/** Returns an initialized JGLayoutParameter with the constant set. It is not necessary to use this, however, as the JGLayoutConstruction protocol for the NSNumber class allows NSNumbers to be used as constant JGLayoutParameters.
 
 @param constant A Double representing the desired NSLayoutConstraint constant.
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	convenience init(constant: Double) {
		self.init()
		self.constant = constant
	}
	
	/** Returns an initialized JGLayoutParameter with the object and attribute set. It is not necessary to use this, however, as the Layout category for the UIView class adds properties with getters that return JGLayoutParameters with the requested attributes.
 
 @param object An AnyObject representing the desired secondary view for the NSLayoutConstraint.
 @param attribute A NSLayoutAttribute representing the desired NSLayoutConstraint relationship.
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	convenience init(object: AnyObject, attribute: NSLayoutAttribute) {
		self.init()
		self.object = object
		self.attribute = attribute
	}
	
	subscript(priority: Int) -> JGLayoutParameter {
		self.priority = priority
		return self
	}
	
	func withRelation(relation: NSLayoutRelation) -> JGLayoutParameter {
		self.relation = relation
		return self
	}
	
}

extension JGLayoutParameter: NSCopying {
	
	func copyWithZone(zone: NSZone) -> AnyObject! {
		return JGLayoutParameter(object: object, attribute: attribute, relation: relation, priority: priority, constant: constant, multiplier: multiplier)
	}
	
}


extension Double {
	
	var layoutParameter: JGLayoutParameter {
		return JGLayoutParameter(constant: self)
	}
	
	func withRelation(relation: NSLayoutRelation) -> JGLayoutParameter {
		return layoutParameter.withRelation(relation)
	}
	
}

extension Float {
	
	var layoutParameter: JGLayoutParameter {
		return JGLayoutParameter(constant: Double(self))
	}
	
	func withRelation(relation: NSLayoutRelation) -> JGLayoutParameter {
		return layoutParameter.withRelation(relation)
	}
	
}

extension Int {
	
	var layoutParameter: JGLayoutParameter {
		return JGLayoutParameter(constant: Double(self))
	}
	
	func withRelation(relation: NSLayoutRelation) -> JGLayoutParameter {
		return layoutParameter.withRelation(relation)
	}
	
}

extension NSNumber {
	
	var layoutParameter: JGLayoutParameter {
		return JGLayoutParameter(constant: self.doubleValue)
	}
	
	func withRelation(relation: NSLayoutRelation) -> JGLayoutParameter {
		return layoutParameter.withRelation(relation)
	}
	
}


@infix func + (left: JGLayoutParameter, right: Double) -> JGLayoutParameter {
	left.constant += right
	return left
}

@infix func + (left: Double, right: JGLayoutParameter) -> JGLayoutParameter {
	return right + left
}

@infix func + (left: JGLayoutParameter, right: Float) -> JGLayoutParameter {
	return left + Double(right)
}

@infix func + (left: Float, right: JGLayoutParameter) -> JGLayoutParameter {
	return right + left
}

@infix func + (left: JGLayoutParameter, right: Int) -> JGLayoutParameter {
	return left + Double(right)
}

@infix func + (left: Int, right: JGLayoutParameter) -> JGLayoutParameter {
	return right + left
}

@infix func + (left: JGLayoutParameter, right: NSNumber) -> JGLayoutParameter {
	return left + right.doubleValue
}

@infix func + (left: NSNumber, right: JGLayoutParameter) -> JGLayoutParameter {
	return right + left.doubleValue
}


@infix func - (left: JGLayoutParameter, right: Double) -> JGLayoutParameter {
	return left + -right
}

@infix func - (left: JGLayoutParameter, right: Float) -> JGLayoutParameter {
	return left + Double(-right)
}

@infix func - (left: JGLayoutParameter, right: Int) -> JGLayoutParameter {
	return left + Double(-right)
}

@infix func - (left: JGLayoutParameter, right: NSNumber) -> JGLayoutParameter {
	return left + -right.doubleValue
}


@infix func += (left: JGLayoutParameter, right: Double) {
	left.constant += right
}

@infix func -= (left: JGLayoutParameter, right: Double) {
	left.constant -= right
}

@infix func += (left: JGLayoutParameter, right: Float) {
	left += Double(right)
}

@infix func -= (left: JGLayoutParameter, right: Float) {
	left -= Double(right)
}

@infix func += (left: JGLayoutParameter, right: Int) {
	left += Double(right)
}

@infix func -= (left: JGLayoutParameter, right: Int) {
	left -= Double(right)
}

@infix func += (left: JGLayoutParameter, right: NSNumber) {
	left += right.doubleValue
}

@infix func -= (left: JGLayoutParameter, right: NSNumber) {
	left -= right.doubleValue
}


@infix func * (left: JGLayoutParameter, right: Double) -> JGLayoutParameter {
	left.multiplier = right
	return left
}

@infix func * (left: Double, right: JGLayoutParameter) -> JGLayoutParameter {
	return right * left
}

@infix func * (left: JGLayoutParameter, right: Float) -> JGLayoutParameter {
	return left * Double(right)
}

@infix func * (left: Float, right: JGLayoutParameter) -> JGLayoutParameter {
	return right * left
}

@infix func * (left: JGLayoutParameter, right: Int) -> JGLayoutParameter {
	return left * Double(right)
}

@infix func * (left: Int, right: JGLayoutParameter) -> JGLayoutParameter {
	return right * left
}

@infix func * (left: JGLayoutParameter, right: NSNumber) -> JGLayoutParameter {
	return left * right.doubleValue
}

@infix func * (left: NSNumber, right: JGLayoutParameter) -> JGLayoutParameter {
	return right * left.doubleValue
}


@infix func *= (left: JGLayoutParameter, right: Double) {
	left.multiplier = right
}


@infix func *= (left: JGLayoutParameter, right: Float) {
	left *= Double(right)
}


@infix func *= (left: JGLayoutParameter, right: Int) {
	left *= Double(right)
}


@infix func *= (left: JGLayoutParameter, right: NSNumber) {
	left *= right.doubleValue
}
