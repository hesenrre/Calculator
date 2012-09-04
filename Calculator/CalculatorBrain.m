//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Hesenrre on 8/29/12.
//  Copyright (c) 2012 Roonin. All rights reserved.
//

#import "CalculatorBrain.h"
#import <math.h>

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain
@synthesize operandStack = _operandStack;

-(NSMutableArray*) operandStack{
    if(!_operandStack){
        _operandStack = [[NSMutableArray alloc] init];
    }
    return _operandStack;
}

-(void) pushOperand:(double)operand{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.operandStack addObject:operandObject];
}

-(double) popOperand{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

-(double) performOperation:(NSString *)operation{
    double result = 0;
    
    if([operation isEqualToString:@"+"]){
        result = [self popOperand]+ [self popOperand];
    }else if ([@"*" isEqualToString: operation]){
        result = [self popOperand] * [self popOperand];
    }else if ([@"-" isEqualToString: operation]){
        double subtrahend = [self popOperand];
        result = [self popOperand] - subtrahend;
    }else if ([@"/" isEqualToString: operation]){
        double divisor = [self popOperand];
        if(divisor) result = [self popOperand] / divisor;
    }else if ([@"sin" isEqualToString:operation]){
        double operand = [self popOperand];
        if(operand) result = sin(operand);
    }else if ([@"cos" isEqualToString:operation]){
        double operand = [self popOperand];
        if(operand) result = cos(operand);
    }else if ([@"sqrt" isEqualToString:operation]){
        double operand = [self popOperand];
        if(operand) result = sqrt(operand);
    }else if ([@"∏" isEqualToString: operation]){
        result = M_PI;
    }
    
    [self pushOperand:result];
    return result;
}

-(void) clearStack{
    [self.operandStack removeAllObjects];
}

@end
