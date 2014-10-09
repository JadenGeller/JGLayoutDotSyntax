//
//  JGDynamicSizeLabel.swift
//  JGLayoutDotSyntax
//
//  Objective-C code Copyright (c) 2014 Jaden Geller. All rights reserved.
//  Swift adaptation Copyright (c) 2014 Nicolas Gomollon. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class JGDynamicSizeLabel: UILabel {
	
	/** The font size of the label. Used as a setter, this creates and adds a "constraint" based upon the specification of the assigned JGLayoutParameter. The label's original font size is ignored, and replaced by this constraint. Can only be used with the width and the height attribute. Used as a getter, will return any associated constraint. If none exists, will return nil. Note that, in order to add a font size constraint, the label must be the sender.
 
 @code
 
 label.fontSize = view.layoutHeight // sets viewA's baseline to match that of viewB
 
 @endcode
 
 @see https://github.com/JadenGeller/JGLayoutDotSyntax for more information.
 
	*/
	var fontSize: AnyObject! {
	get {
		return parameter
	}
	set {
		if newValue == nil {
			parameter = nil
		} else if let fontSizeMultiplier = newValue as? JGLayoutParameter {
			if (fontSizeMultiplier.attribute == NSLayoutAttribute.Width) || (fontSizeMultiplier.attribute == NSLayoutAttribute.Height) {
				parameter = fontSizeMultiplier
			}
		} else if let fontSizeMultiplier = newValue as? Double {
			font = font.fontWithSize(font.pointSize * CGFloat(fontSizeMultiplier))
		}
	}
	}
	
	var parameter: JGLayoutParameter! {
	willSet {
		if let p = parameter {
			if var view = p.object as? UIView {
				view.layer.removeObserver(self, forKeyPath:"bounds")
			}
		}
	}
	didSet {
		if let p = parameter {
			if var view = p.object as? UIView {
				view.layer.addObserver(self, forKeyPath: "bounds", options: .New, context: nil)
			}
		}
	}
	}
	
	
	convenience override init() {
		self.init(frame: CGRectZero)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
	
	override func observeValueForKeyPath(keyPath: String!, ofObject object: AnyObject!, change: [NSObject : AnyObject]!, context: UnsafeMutablePointer<Void>) {
		if let p = parameter {
			var view = p.object as? UIView
			var viewObject = object as? CALayer
			if (view != nil) && (viewObject == view!.layer) && (keyPath == "bounds") {
				var size: CGFloat = 0.0
				switch p.attribute {
				case .Width:
					size = view!.bounds.size.width
				case .Height:
					size = view!.bounds.size.height
				default:
					break
				}
				font = font.fontWithSize(size * CGFloat(p.multiplier) + CGFloat(p.constant))
			}
		}
	}
	
}
