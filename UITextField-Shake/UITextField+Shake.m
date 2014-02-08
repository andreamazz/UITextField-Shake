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
	[self _shake:times direction:1 currentTimes:0 withDelta:delta andSpeed:0.03];
}

- (void)shake:(int)times withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval
{
	[self _shake:times direction:1 currentTimes:0 withDelta:delta andSpeed:interval];
}

- (void)_shake:(int)times direction:(int)direction currentTimes:(int)current withDelta:(CGFloat)delta andSpeed:(NSTimeInterval)interval
{
	[UIView animateWithDuration:interval animations:^{
		self.transform = CGAffineTransformMakeTranslation(delta * direction, 0);
	} completion:^(BOOL finished) {
		if(current >= times) {
			self.transform = CGAffineTransformIdentity;
			return;
		}
		[self _shake:(times - 1)
		   direction:direction * -1
		currentTimes:current + 1
		   withDelta:delta
			andSpeed:interval];
	}];
}

@end
