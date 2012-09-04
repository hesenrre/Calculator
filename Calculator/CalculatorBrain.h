//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Hesenrre on 8/29/12.
//  Copyright (c) 2012 Roonin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject
- (void) pushOperand:(double) operand;
- (double) performOperation:(NSString*) operation;
- (void) clearStack;
@end
