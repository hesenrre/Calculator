//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Hesenrre on 8/28/12.
//  Copyright (c) 2012 Roonin. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (weak, nonatomic) IBOutlet UILabel *brainHistory;

@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController
@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber=_userIsInTheMiddleOfEnteringANumber;
@synthesize brainHistory = _brainHistory;
@synthesize brain = _brain;

- (CalculatorBrain *)brain{
    if(!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber && ![self.display.text isEqualToString:@"0"]) {
        self.display.text = [self.display.text stringByAppendingString:digit];
    }else{
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }

}

- (IBAction)enterPressed:(id)sender {
    self.brainHistory.text = [self.brainHistory.text stringByAppendingFormat:@"%@ ",self.display.text];
    if ([sender isKindOfClass:[NSString class]]) {
        self.brainHistory.text = [self.brainHistory.text stringByAppendingFormat:@"%@ ",(NSString*)sender];
    }
    
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender {
    if(self.userIsInTheMiddleOfEnteringANumber) [self enterPressed: [sender currentTitle]];
    
    double result = [self.brain performOperation:[sender currentTitle]];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

- (IBAction)dotPressed:(UIButton *)sender {
    
    if([self.display.text rangeOfString:@"."].location == NSNotFound){
        self.display.text = [self.display.text stringByAppendingString:@"."];
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
}
@end
