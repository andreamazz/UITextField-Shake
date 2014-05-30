//
//  UITextField+Shake.m
//  UITextField+Shake
//
//  Created by Andrea Mazzini on 08/02/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.
//

#import "UITextField+Shake.h"

@implementation UITextField (Shake)

- (void)shake:(int)times withDelta:(CGFloat)delta
{
    [self shake:times withDelta:delta andCompletion:nil];
}

-(void)shake:(int)times withDelta:(CGFloat)delta andCompletion:(CompletionHandler)handler
{
    [self _shake:times direction:1 currentTimes:0 withDelta:delta andSpeed:0.03 shakeDirection:ShakeDirectionHorizontal andCompletionHandler:handler];

}

- (void)shake:(int)times withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval
{
    [self shake:times withDelta:delta speed:interval andCompletion:nil];
}

- (void)shake:(int)times withDelta:(CGFloat)delta speed:(NSTimeInterval)interval andCompletion:(CompletionHandler)handler
{
	[self _shake:times direction:1 currentTimes:0 withDelta:delta andSpeed:interval shakeDirection:ShakeDirectionHorizontal andCompletionHandler:handler];
}

- (void)shake:(int)times withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)shakeDirection
{
    [self shake:times withDelta:delta andSpeed:interval shakeDirection:ShakeDirectionHorizontal andCompletion:nil];
}

- (void)shake:(int)times withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)shakeDirection andCompletion:(CompletionHandler)handler
{
    [self _shake:times direction:1 currentTimes:0 withDelta:delta andSpeed:interval shakeDirection:shakeDirection andCompletionHandler:handler];
}

- (void)_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval shakeDirection:(ShakeDirection)shakeDirection andCompletionHandler:(CompletionHandler)handler
{
	[UIView animateWithDuration:interval animations:^{
		self.transform = (shakeDirection == ShakeDirectionHorizontal) ? CGAffineTransformMakeTranslation(delta * direction, 0) : CGAffineTransformMakeTranslation(0, delta * direction);
	} completion:^(BOOL finished) {
		if(current >= times) {
			[UIView animateWithDuration:interval animations:^{
				self.transform = CGAffineTransformIdentity;
			} completion:^(BOOL finished) {
                
                if (handler)
                {
                    handler();
                }
            }];
			return;
		}
		[self _shake:(times - 1)
		   direction:direction * -1
		currentTimes:current + 1
		   withDelta:delta
			andSpeed:interval
         shakeDirection:shakeDirection andCompletionHandler:handler];
	}];
}

@end
