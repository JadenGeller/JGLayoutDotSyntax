//
//  JGDynamicSizeLabel.m
//  LayoutDotSyntaxExample
//
//  Created by Jaden Geller on 3/9/14.
//  Copyright (c) 2014 Jaden Geller. All rights reserved.
//

#import "JGDynamicSizeLabel.h"
#import "JGLayoutParameter.h"

@interface JGDynamicSizeLabel ()
{
    UIFont *_font;
}

@property (nonatomic) JGLayoutParameter *parameter;

@end

@implementation JGDynamicSizeLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(void)setFont:(UIFont *)font{
    _font = font;
    
   // >> UPDATE FONT
}

-(UIFont*)font{
    if (!_font) {
        _font = [super font];
    }
    return _font;
}

-(void)setParameter:(JGLayoutParameter *)parameter{
    if (_parameter) [self clean_JGDynamicSizeLabel];
    _parameter = parameter;
    
    [[parameter.object layer] addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew context:NULL];
}
         
-(void)setFontSize:(id)fontSizeMultiplier{
    if ([fontSizeMultiplier isKindOfClass:[NSNumber class]]) {
        [super setFont:[self.font fontWithSize:self.font.pointSize * [fontSizeMultiplier doubleValue]]];
    }
    else if ([fontSizeMultiplier isKindOfClass:[JGLayoutParameter class]]){
        if ([(JGLayoutParameter*)fontSizeMultiplier attribute] == NSLayoutAttributeWidth || [(JGLayoutParameter*)fontSizeMultiplier attribute] == NSLayoutAttributeHeight) {
            self.parameter = (JGLayoutParameter*)fontSizeMultiplier;
        }
        else [JGDynamicSizeLabel exception_JGDynamicSizeLabel];
    }
    else if (!fontSizeMultiplier) [self clean_JGDynamicSizeLabel];
    else [JGDynamicSizeLabel exception_JGDynamicSizeLabel];
    
    _fontSize = fontSizeMultiplier;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    if ([object isEqual:[self.parameter.object layer]] && [keyPath isEqualToString:@"bounds"]) {
        CGFloat size = 0;
        if (self.parameter.attribute == NSLayoutAttributeWidth) {
            size = [self.parameter.object bounds].size.width;
        }
        else if (self.parameter.attribute == NSLayoutAttributeHeight){
            size = [self.parameter.object bounds].size.height;
        }
        else{
            [NSException raise:@"Bad font size constraint." format:@"Font size constraint must be either a NSNumber or a JGLayoutParameter."];
        }
        
        [super setFont:[self.font fontWithSize:size * self.parameter.multiplier + self.parameter.constant]];
    }
}

+(void)exception_JGDynamicSizeLabel{
    [NSException raise:@"Bad font size constraint." format:@"Font size constraint must be either a NSNumber or a JGLayoutParameter."];
}

-(void)clean_JGDynamicSizeLabel{
    [[_parameter.object layer] removeObserver:self forKeyPath:@"bounds.size"];
    [super setFont:self.font];
}

-(void)dealloc{
    [self clean_JGDynamicSizeLabel];
}

@end
