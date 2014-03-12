//
//  SpirographViewController.m
//  MoravianSpirograph
//
//  Created by Michael Toth on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import "SpirographViewController.h"
#import "SpirographView.h"

@interface SpirographViewController ()

@end

@implementation SpirographViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.spirographView.l = .4;
    self.spirographView.k = .6;
    self.spirographView.numberOfSteps = 2000;
    self.spirographView.stepSize = .02;
    
    NSLog(@"It started");
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardAppearance:) name:UIKeyboardDidShowNotification object:nil];
    
	// Do any additional setup after loading the view, typically from a nib.    
}

- (void) viewDidAppear:(BOOL)animated
{
    NSLog(@"It is here now");
}

- (void) keyboardAppeared:(NSNotification *) note
{
    CGFloat keyboardHeight = [[[note userInfo] objectForKey:UIKeyboardFrameEndUserInfoKey] CGSizeValue].height;
    CGRect newFrame = self.view.frame;
    newFrame.origin.y -= keyboardHeight;
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setSpirographView:nil];
    [self setLSlider:nil];
    [self setKSlider:nil];
    [self setStepSizeTextField:nil];
    [self setNumStepsTextField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void) viewDidLayoutSubviews
{
    [[self scrollView] setContentSize:CGSizeMake(560, 280)];
}

- (IBAction)redraw:(id)sender {
    self.spirographView.l = self.lSlider.value;
    self.spirographView.k = self.kSlider.value;
    self.spirographView.numberOfSteps = [self.numStepsTextField.text integerValue];
    self.spirographView.stepSize = [self.stepSizeTextField.text floatValue];
    
    [self.spirographView setNeedsDisplay];
}
@end
