Introduction
=================

JGLayoutDotSyntax provides classes and categories to make it easier to add NSLayoutConstraints. Rather than entering lengthy code that specifies the views, attributes, relationship, constant, and mulplier all in a single function (not to mention the reciever view that must add the constraint), JGLayoutDotSyntax allows relationships to be specified simply and concisely. Additionally, JGLayoutDotSyntax adds support for font size constraints by use of the JGDynamicSizeLabel subclass of UILabel. With this class, one can simply and set up the font size to adjust with the rest of the layout.

Format
=================

Layout constraints can be specified simply and easily using reading dot syntax. The lenghty, hard-to-understand layout code

```objc
[self.view addConstraint:[NSLayoutConstraint constraintWithItem:subview attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1 constant:0]];
```

can be rewritten in a short, simple, easily understood format using JGLayoutDotSyntax:

```objc
subview.centerX = self.view.centerX;
```


Conventional methods of creating autolayout constraints simply obfuscuate the intent, causing difficult to read and often buggy code. JGLayoutDotSyntax aims to fix that. The advantages achieved are even more stunning when you realize that each subview usually has about four NSLayoutConstraints created to define its location.

JGLayoutDotSyntax supports all features that NSLayoutConstraint does, including constants, multipliers, and priority. Because of the limitations of Objective-C, constants can not simply be added with the plus symbol. Instead, JGLayoutParameter implements an add method that can be used as follows:

```objc
subview.left = [self.view.left add:10];
```

The add method takes a CGFloat as an input argument and sets it as the NSLayoutConstraint's constant. Similiarly, multipliers can be specified with the muliply method and different relationships, such as NSLayoutRelationGreaterThanOrEqual, can be specified using the withRelation method. For more info, refer to the documentation in the JGLayoutConstruction.h file.

Additionally, JGLayoutDotSyntax allows priority to be specified. In favor of concision, a slightly irregular syntax is used. After a JGLayoutParameter, square backets can be used to specifiy priority of a constraint, if needed. For example, we can lower the priority of centering our subview:

```objc
subview.centerX = self.view.centerX[UILayoutPriorityDefaultLow];
```

The argument between the brackets should be a UILayoutPriority, which is represented by a positive integer, less than or equal to 1000 (as specified in Apple's NSLayoutConstraint documentation).

Further, there exists convenience methods `matchAligment:` and `matchSize:` and `matchCenter:` to quickly set the top, bottom, left, right constraints or the width and height of the sender to that of the receiver.

One of the coolest parts of JGLayoutDotSyntax is the `JGDynamicSizeLabel` subclass of UILabel. With it, font sizes can be linked to layout constraints effortlessly. Check it out!

```objc
label.fontSize = [view.height multiply:.5];
```

In the above example, we set the label to have a font with half the value of view's height.

Installation
=================

To use JGLayoutDotSyntax with your project, you simply need to add the neccessary files to your project and import JGLayoutDotSyntax.h. It's as simple as that!

Example
=================

In order to better illustrate how JGLayoutDotSyntax is to be used, an example project is included that makes use of this syntax. Below is the relavent section of the example project:

```objc
float size = 40;
float statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;

purpleView.width = @(2*size);
purpleView.height = @(2*size);
purpleView.right = self.view.right;
purpleView.top = [self.view.top add:statusBarHeight];

blueView.left = self.view.left;
blueView.centerY = self.view.centerY;
blueView.height = @(size);
blueView.width = @190;

redView.width = @(size);
redView.height = @(size);
redView.centerX = self.view.centerX[UILayoutPriorityDefaultHigh];
redView.centerY = self.view.centerY;
redView.left = [[blueView.right add:10] withRelation:NSLayoutRelationGreaterThanOrEqual];

yellowView.left = [blueView.left add:10];
yellowView.right = [blueView.right add:-10];
yellowView.top = [blueView.top add:10];
yellowView.bottom = [blueView.bottom add:-10];

greenView.bottom = self.view.bottom;
greenView.height = [self.view.height multiply:.2];
greenView.left = self.view.left;
greenView.right = self.view.right;

[label matchAligment:greenView];
label.fontSize = [greenView.height multiply:.5];
```

Displayed a portrait-oriented and a landscape oriented iPhone, the above layout would look like the images below:

![](https://github.com/JadenGeller/JGLayoutDotSyntax/blob/master/example_layout_portrait.png?raw=true)    
![](https://github.com/JadenGeller/JGLayoutDotSyntax/blob/master/example_layout_landscape.png?raw=true)
