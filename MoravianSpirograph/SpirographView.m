//
//  SpirographView.m
//  MoravianSpirograph
//
//  Created by Lewis Cooper on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "SpirographView.h"

@implementation SpirographView

@synthesize l;
@synthesize k;
@synthesize numberOfSteps;
@synthesize stepSize;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) drawRect:(CGRect)rect
{
    CGFloat x,y;
    UIBezierPath *bz = [[UIBezierPath alloc] init];

    CGFloat R = 120;
    
    x = R * ((1 - k) * cos(0) + l * k * cos(((1-k)/k))*0);
    y = R * ((1 - k) * sin(0) - l * k * sin(((1-k)/k))*0);
    
    CGPoint p=CGPointMake(x, y);
    [bz moveToPoint:p];
    
    for (int i = 0; i < self.numberOfSteps*self.stepSize; i+=self.stepSize) {
                
        x = R * ((1 - k) * cos(i) + l * k * cos(((1-k)/k))*i);
        y = R * ((1 - k) * sin(i) - l * k * sin(((1-k)/k))*i);
        
        p=CGPointMake(x, y);
        [bz addLineToPoint:p];
    }
    [bz stroke];
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
