//
//  JGViewController.m
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 11/30/13.
//  Copyright (c) 2013 Jaden Geller. All rights reserved.
//

#import "JGViewController.h"
#import "JGLayoutDotSyntax.h"
#import "NSObject+DynamicConstraint.h"

@interface JGViewController ()

@property (nonatomic) NSInteger value;

@end

@implementation JGViewController

- (void)viewDidLoad
{
    _value = 20;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor colorWithWhite:.9 alpha:1];
    
    UIView *blueView = [[UIView alloc]init];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *greenView = [[UIView alloc]init];
    greenView.backgroundColor = [UIColor greenColor];
    greenView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *yellowView = [[UIView alloc] init];
    yellowView.backgroundColor = [UIColor yellowColor];
    yellowView.translatesAutoresizingMaskIntoConstraints = NO;
    
    UIView *redView = [[UIView alloc] init];
    redView.backgroundColor = [UIColor redColor];
    redView.translatesAutoresizingMaskIntoConstraints = NO;

    UIView *purpleView = [[UIView alloc] init];
    purpleView.backgroundColor = [UIColor purpleColor];
    purpleView.translatesAutoresizingMaskIntoConstraints = NO;
    
    JGDynamicSizeLabel *label = [[JGDynamicSizeLabel alloc]init];
    label.translatesAutoresizingMaskIntoConstraints = NO;
    label.text = @"Touch Me!";
    label.textAlignment = NSTextAlignmentCenter;

    [self.view addSubview:purpleView];
    [self.view addSubview:blueView];
    [self.view addSubview:greenView];
    [blueView addSubview:yellowView];
    [self.view addSubview:redView];
    [greenView addSubview:label];
    
    //Set up layout constraints using dot syntax
    
    float size = 40;
    float statusBarHeight = [UIApplication sharedApplication].statusBarFrame.size.height;
    
    purpleView.height = [self constraintForKeyPath:@"value"];
    purpleView.width = [purpleView.height add:@(10)];
    purpleView.right = self.view.right;
    purpleView.top = [self.view.top add:@(statusBarHeight)];
    
    blueView.left = self.view.left;
    blueView.centerY = self.view.centerY;
    blueView.height = @(size);
    blueView.width = @190;
    
    redView.width = @(size);
    redView.height = @(size);
    redView.centerX = self.view.centerX[UILayoutPriorityDefaultHigh];
    redView.centerY = self.view.centerY;
    redView.left = [[blueView.right add:@(10)] withRelation:NSLayoutRelationGreaterThanOrEqual];
    
    CGFloat margin = 10;
    
    yellowView.left = [blueView.left add:@(margin)];
    yellowView.right = [blueView.right add:@(-margin)];
    yellowView.top = [blueView.top add:@(margin)];
    yellowView.bottom = [blueView.bottom add:@(-margin)];
    
    greenView.bottom = self.view.bottom;
    greenView.height = [self.view.height multiply:@.2];
    greenView.left = self.view.left;
    greenView.right = self.view.right;
    
    label.alignment = greenView.alignment;
    label.fontSize = [greenView.height multiply:@.5];

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    self.value += 10;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
