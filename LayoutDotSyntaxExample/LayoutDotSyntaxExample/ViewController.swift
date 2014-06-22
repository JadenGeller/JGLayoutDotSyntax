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
		let size = 40.0
		let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.size.height
		
		purpleView.layoutWidth = size * 2.0
		purpleView.layoutHeight = size * 2.0
		purpleView.layoutRight = view.layoutRight
		purpleView.layoutTop = (view.layoutTop as JGLayoutParameter) + statusBarHeight
		
		blueView.layoutLeft = view.layoutLeft
		blueView.layoutCenterY = view.layoutCenterY
		blueView.layoutHeight = size
		blueView.layoutWidth = 190.0
		
		redView.layoutWidth = size
		redView.layoutHeight = size
		redView.layoutCenterX = (view.layoutCenterX as JGLayoutParameter)[UILayoutPriorityDefaultHigh]
		redView.layoutCenterY = view.layoutCenterY
		redView.layoutLeft = ((blueView.layoutRight as JGLayoutParameter) + 10.0).withRelation(.GreaterThanOrEqual)
		
		yellowView.layoutLeft = (blueView.layoutLeft as JGLayoutParameter) + 10.0
		yellowView.layoutRight = (blueView.layoutRight as JGLayoutParameter) - 10.0
		yellowView.layoutTop = (blueView.layoutTop as JGLayoutParameter) + 10.0
		yellowView.layoutBottom = (blueView.layoutBottom as JGLayoutParameter) - 10.0
		
		greenView.layoutBottom = view.layoutBottom
		greenView.layoutHeight = (view.layoutHeight as JGLayoutParameter) * 0.2
		greenView.layoutLeft = view.layoutLeft
		greenView.layoutRight = view.layoutRight
		
		label.layoutAlignment = greenView.layoutAlignment
		label.fontSize = (greenView.layoutHeight as JGLayoutParameter) * 0.5
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
}

