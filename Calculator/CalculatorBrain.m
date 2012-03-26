//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Hesenrre Crane on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"
#import <math.h>

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
-(void) pushDoubleOperand:(double)operand;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;
-(NSMutableArray *) operandStack{
    if(_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

-(void) pushOperand:(NSString *) operand{
    double operandValue = [operand isEqualToString:@"π"] ? M_PI : [operand doubleValue];
    [self.operandStack addObject: [NSNumber numberWithDouble:operandValue]];
}

-(void) pushDoubleOperand:(double)operand{
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

-(double) popOperand{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

-(double)performOperation:(NSString *) operation{
    double result = 0;
    
    if ([operation isEqualToString:@"+"]) {
        result = [self popOperand] + [self popOperand];
    }else if ([operation isEqualToString:@"-"]) {
        result = [self popOperand];
        result = [self popOperand] - result;
    }else if ([operation isEqualToString:@"/"]) {
        result = [self popOperand];
        result = [self popOperand] / result;
    }else if ([operation isEqualToString:@"*"]) {
        result = [self popOperand] * [self popOperand];
    }else if([operation isEqualToString:@"sin"]){
        result = sin([self popOperand]);
    }else if([operation isEqualToString:@"cos"]){
        result = cos([self popOperand]);
    }else if([operation isEqualToString:@"sqrt"]){
        result = sqrt([self popOperand]);
    }

    [self pushDoubleOperand:result];
    return result;
}
@end
