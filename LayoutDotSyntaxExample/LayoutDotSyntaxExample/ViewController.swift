//
//  ViewController.swift
//  LayoutDotSyntaxExample
//
//  Objective-C code Copyright (c) 2014 Jaden Geller. All rights reserved.
//  Swift adaptation Copyright (c) 2014 Nicolas Gomollon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		// Do any additional setup after loading the view, typically from a nib.
		view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
		
		var blueView = UIView()
		blueView.backgroundColor = UIColor.blueColor()
		blueView.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		var greenView = UIView()
		greenView.backgroundColor = UIColor.greenColor()
		greenView.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		var yellowView = UIView()
		yellowView.backgroundColor = UIColor.yellowColor()
		yellowView.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		var redView = UIView()
		redView.backgroundColor = UIColor.redColor()
		redView.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		var purpleView = UIView()
		purpleView.backgroundColor = UIColor.purpleColor()
		purpleView.setTranslatesAutoresizingMaskIntoConstraints(false)
		
		var label = JGDynamicSizeLabel()
		label.setTranslatesAutoresizingMaskIntoConstraints(false)
		label.textAlignment = .Center
		label.text = "Hello World!"
		
		view.addSubview(purpleView)
		view.addSubview(blueView)
		view.addSubview(greenView)
		blueView.addSubview(yellowView)
		view.addSubview(redView)
		greenView.addSubview(label)
		
		
		// Set up layout constraints using dot syntax.
		let size = JGLP(40.0)
		let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
		
		purpleView.layout.width = JGLP(size.constant * 2.0)
		purpleView.layout.height = JGLP(size.constant * 2.0)
		purpleView.layout.right = view.layout.right
		purpleView.layout.top = view.layout.top + statusBarHeight
		
		blueView.layout.left = view.layout.left
		blueView.layout.centerY = view.layout.centerY
		blueView.layout.height = size
		blueView.layout.width = JGLP(190.0)
		
		redView.layout.width = size
		redView.layout.height = size
		redView.layout.centerX = view.layout.centerX[JGLayoutPriorityDefaultHigh]
		redView.layout.centerY = view.layout.centerY
		redView.layout.left = (blueView.layout.right + 10.0).withRelation(.GreaterThanOrEqual)
		
		let margin = 10.0
		
		yellowView.layout.left = blueView.layout.left + margin
		yellowView.layout.right = blueView.layout.right - margin
		yellowView.layout.top = blueView.layout.top + margin
		yellowView.layout.bottom = blueView.layout.bottom - margin
		
		greenView.layout.bottom = view.layout.bottom
		greenView.layout.height = view.layout.height * 0.2
		greenView.layout.left = view.layout.left
		greenView.layout.right = view.layout.right
		
		label.layout.alignment = greenView.layout.alignment
		label.fontSize = greenView.layout.height * 0.5
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}

