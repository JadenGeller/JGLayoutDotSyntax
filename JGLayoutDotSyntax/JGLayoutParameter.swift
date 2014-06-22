//
//  JGLayoutParameter.swift
//  JGLayoutDotSyntax
//
//  Objective-C code Copyright (c) 2014 Jaden Geller. All rights reserved.
//  Swift adaptation Copyright (c) 2014 Nicolas Gomollon. All rights reserved.
//

import Foundation
import UIKit

typealias JGLP = JGLayoutParameter

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
	
	/** Returns an initialized JGLayoutParameter with the constant set. It is not necessary to use this, however, as the JGLayoutConstruction protocol for the NSNumber class allows NSNumbers to be used as constant JGLayoutParameters.
 
 @param number A number object (e.g. Double, Float, Int, NSNumber) representing the desired NSLayoutConstraint constant.
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	convenience init(_ number: AnyObject) {
		self.init(constant: number as Double)
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


@infix func + (left: JGLayoutParameter, right: AnyObject) -> JGLayoutParameter {
	var parameter = left.copy() as JGLayoutParameter
	parameter.constant += right as Double
	return parameter
}

@infix func + (left: AnyObject, right: JGLayoutParameter) -> JGLayoutParameter {
	return right + left
}

@infix func - (left: JGLayoutParameter, right: AnyObject) -> JGLayoutParameter {
	return left + -(right as Double)
}


@infix func += (left: JGLayoutParameter, right: AnyObject) {
	left.constant += right as Double
}

@infix func -= (left: JGLayoutParameter, right: AnyObject) {
	left.constant -= right as Double
}


@infix func * (left: JGLayoutParameter, right: AnyObject) -> JGLayoutParameter {
	var parameter = left.copy() as JGLayoutParameter
	parameter.multiplier = right as Double
	return parameter
}

@infix func * (left: AnyObject, right: JGLayoutParameter) -> JGLayoutParameter {
	return right * left
}


@infix func *= (left: JGLayoutParameter, right: AnyObject) {
	left.multiplier = right as Double
}
