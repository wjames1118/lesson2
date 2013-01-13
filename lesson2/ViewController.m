//
//  ViewController.m
//  lesson2
//
//  Created by James on 12/11/12.
//  Copyright (c) 2012 James. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end



@implementation ViewController


@synthesize display = _display;

@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;

@synthesize brain = _brain;

- (CalculatorBrain *)brain

{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    
    return _brain;
    
}


- (IBAction)digitPressed:(UIButton *)sender
{
    
    NSString *digit = sender.currentTitle;
    //NSLog(@"digit pressed = %@", digit);
    
    //UILabel *myDisplay = self.display; //[self display];
    //NSString *currentText = self.display.text; //[myDisplay text];
    //NSString *newText = [currentText stringByAppendingString : digit];
    //myDisplay.Text = newText;
    
     if (self.userIsInTheMiddleOfEnteringANumber)
     {
    
         self.display.text = [self.display.text stringByAppendingString:digit];
     
     }
    
     else
        {
            self.display.text = digit;
            self.userIsInTheMiddleOfEnteringANumber = YES;
        }
}
- (IBAction)operationPressed:(UIButton *)sender
{
    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
    
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
    
    
}


- (IBAction)enterPressed
{
    [self.brain pushOperand: [self.display.text doubleValue]];
     self.userIsInTheMiddleOfEnteringANumber= NO;
    
}

@end