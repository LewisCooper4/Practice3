//
//  SpirographViewController.h
//  MoravianSpirograph
//
//  Created by Michael Toth on 2/21/14.
//  Copyright (c) 2014 Michael Toth. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SpirographView.h"

@interface SpirographViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet SpirographView *spirographView;
@property (weak, nonatomic) IBOutlet UISlider *lSlider;
@property (weak, nonatomic) IBOutlet UISlider *kSlider;
@property (weak, nonatomic) IBOutlet UITextField *stepSizeTextField;
@property (weak, nonatomic) IBOutlet UITextField *numStepsTextField;
- (IBAction)redraw:(id)sender;

@end
