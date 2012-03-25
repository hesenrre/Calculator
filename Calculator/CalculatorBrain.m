//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Hesenrre Crane on 3/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end

@implementation CalculatorBrain

@synthesize operandStack = _operandStack;
-(NSMutableArray *) operandStack{
    if(_operandStack == nil) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

-(void) pushOperand:(double) operand{
    [self.operandStack addObject: [NSNumber numberWithDouble:operand]];
}

-(double) popOperand{
    NSNumber *operandObject = [self.operandStack lastObject];
    if(operandObject) [self.operandStack removeLastObject];
    return [operandObject doubleValue];
}

-(double)performOperation:(NSString *) operation{
    double result = 0;
    
    double last = [self popOperand];
    double first = [self popOperand];
    
    if ([operation isEqualToString:@"+"]) {
        result = first + last;
        NSLog(@"%f + %f = %f",first,last,result);
    }else if ([operation isEqualToString:@"-"]) {
        result = first - last;
        NSLog(@"%f - %f = %f",first,last,result);
    }else if ([operation isEqualToString:@"/"]) {
        result = first / last;
        NSLog(@"%f / %f = %f",first,last,result);
    }else if ([operation isEqualToString:@"*"]) {
        result = first * last;
        NSLog(@"%f * %f = %f",first,last,result);
    }
    [self pushOperand:result];
    return result;
}
@end
