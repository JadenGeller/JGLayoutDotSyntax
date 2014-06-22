//
//  JGLayoutConstruction.swift
//  JGLayoutDotSyntax
//
//  Objective-C code Copyright (c) 2014 Jaden Geller. All rights reserved.
//  Swift adaptation Copyright (c) 2014 Nicolas Gomollon. All rights reserved.
//

import Foundation
import UIKit

protocol JGLayoutConstruction: NSObjectProtocol {
	
	/** Sets the relationship for the given JGLayoutParameter and returns the same instance of JGLayoutParameter. The only reason that there is a return value is for conveneince, allowing layout constraints to be specified on a single line.
 
 @param relation A NSLayoutRelation representing the desired NSLayoutConstraint relationship.
 
 @return An instance of JGLayoutParameter.
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	func withRelation(relation: NSLayoutRelation) -> JGLayoutParameter
	
}
