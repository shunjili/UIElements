//
//  SJReversibleButton.m
//  scrollViewTest
//
//  Created by Shunji Li on 7/2/14.
//  Copyright (c) 2014 shunjili. All rights reserved.
//

#import "SJBorderedReversibleButton.h"
@interface SJBorderedReversibleButton()
@property (nonatomic, assign, readwrite) MOReverseButtonStyle style;
@property (nonatomic, strong)NSDictionary *attributes;
@property (nonatomic, assign) MOReverseButtonStyle currentStyle;
@end

@implementation SJBorderedReversibleButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.style = MOReverseButtonStyleHollow;
        self.currentStyle = self.style;
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame style:(MOReverseButtonStyle) style
{
    self = [self initWithFrame:frame];
    self.style = style;
    self.currentStyle = self.style;
    return self;
}

-(NSDictionary*) attributes
{
    if (!_attributes) {
        NSDictionary *attributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue" size:14]};
        self.attributes = attributes;
    }
    return _attributes;
}
- (void) setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
    NSMutableDictionary *attr = [self.attributes mutableCopy];
    attr[NSForegroundColorAttributeName] = tintColor;
    self.attributes = attr;
    
}

-(void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if ((self.style == MOReverseButtonStyleHollow && highlighted) || (self.style == MOReverseButtonStyleFilled && !highlighted)) {
        self.currentStyle = MOReverseButtonStyleFilled;
        [self setNeedsDisplay];
    }else
    {
        self.currentStyle= MOReverseButtonStyleHollow;
        [self setNeedsDisplay];
    }
}

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize s = [self.title sizeWithAttributes:self.attributes];
    s.width += 15.0;
    s.height += 15.0;
    return s;
}


- (void)drawRect:(CGRect)rect
{
    if(self.currentStyle == MOReverseButtonStyleHollow) {
        // Drawing the border
        CGContextRef context=UIGraphicsGetCurrentContext();
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:7.5];
        CGContextSetStrokeColorWithColor(context, self.tintColor.CGColor);
        [bezierPath stroke];
        CGRect inRect = CGRectInset(rect, 1.0, 1.0);
        bezierPath = [UIBezierPath bezierPathWithRoundedRect:inRect cornerRadius:5.5];
        CGContextSetStrokeColorWithColor(context, self.tintColor.CGColor);
        [bezierPath stroke];
        CGSize size = [self.title sizeWithAttributes:self.attributes];
        CGPoint textOrigin = CGPointMake(self.frame.size.width/2 - size.width/2, self.frame.size.height/2 - size.height/2);
        [self.title drawAtPoint:textOrigin withAttributes:self.attributes];
    }
    else
    {
        // Drawing the border
        CGContextRef context=UIGraphicsGetCurrentContext();
        UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:7.5];
        CGContextSetFillColorWithColor(context, self.tintColor.CGColor);
        [bezierPath fill];
        CGContextSaveGState(context);
        CGContextSetBlendMode(context, kCGBlendModeClear);
        CGSize size = [self.title sizeWithAttributes:self.attributes];
        NSMutableDictionary *attr = [self.attributes mutableCopy];
        attr[NSForegroundColorAttributeName] = [UIColor clearColor];
        CGPoint textOrigin = CGPointMake(self.frame.size.width/2 - size.width/2, self.frame.size.height/2 - size.height/2);
        [self.title drawAtPoint:textOrigin withAttributes:attr];
        CGContextSaveGState(context);
        
    }
}


@end
