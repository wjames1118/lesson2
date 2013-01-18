//
//  CalculatorBrain.h
//  lesson2
//
//  Created by James on 12/13/12.
//  Copyright (c) 2012 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operend;

- (double)performOperation:(NSString *)operation;



@property (readonly) id program;

+ (double) runProgram : (id) program;

+ (NSString *) descriptionOfProgram:(id)program;

@end
