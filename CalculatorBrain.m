//
//  CalculatorBrain.m
//  lesson2
//
//  Created by James on 12/13/12.
//  Copyright (c) 2012 James. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()

//@property(nonatomic, strong) NSMutableArray *operandStack;

@property(nonatomic, strong) NSMutableArray *programStack;

@end

@implementation CalculatorBrain

@synthesize programStack = _programStack;


-(NSMutableArray *)programStack
{
    
if (_programStack == nil) _programStack = [[NSMutableArray alloc] init];
    
    
    return _programStack;

}


- (void)pushOperand:(double)operend
{
//  NSNumber *operandObject = [NSNumber numberWithDouble:operend];
[self.programStack addObject:[NSNumber numberWithDouble:operend]];
    
}

 -(double)popOperand

  {
   NSNumber *operandObject = [self.operandStack lastObject];
   if (operandObject)[self.operandStack removeLastObject];
   return [operandObject doubleValue];

  }


- (double)performOperation:(NSString *)operation;
{

    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
    
    
}
    
    
-(id)program
{
    return [self.programStack copy];

    
}

+(NSString *)descriptionOfProgram:(id)program
{
    return @"Implement this is Assignment 2";
}


+(double)popOperandOffStack:(NSMutableArray *)stack
{
    
    double result = 0;
    
    id topOfStack = [stack lastObject];
    if (topOfStack) [stack removeLastObject];
    
    if ([topOfStack isKindOfClass:[NSNumber class]]){
        result = [topOfStack doubleValue];
    }
    
    
    else if ([topOfStack isKindOfClass:[NSString class]]){
    
        NSString *operation = topOfStack;
        
    if([ operation isEqualToString:@"+"]){
        result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        
    }
    
    
    else if ([@"*" isEqualToString:operation]){
        result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
    }
    
    
    else if([@"-" isEqualToString:operation]){
        double subtrahend = [self popOperandOffStack:stack];
        result = [self popOperandOffStack:stack] - subtrahend;
        
    }
    
    else if([@"/" isEqualToString:operation]){
        
        //result = [self popOperand] / [self popOperand];
        double divisor = [self popOperandOffStack:stack];
        if (divisor) result = [self popOperandOffStack:stack]/divisor;
    }
    
    }
    
    return result;
    
    
}

+(double)runProgram:(id)program
{
    
    NSMutableArray *stack;
    if([program isKindOfClass:[NSArray class]])
    {
        stack = [program mutableCopy];
        
    }
    
    return [self popOperandOffStack:stack];
}

@end
