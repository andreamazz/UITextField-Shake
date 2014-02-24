//
//  AMViewController.m
//  Sample
//
//  Created by Andrea Mazzini on 08/02/14.
//  Copyright (c) 2014 Fancy Pixel. All rights reserved.
//

#import "AMViewController.h"
#import "UITextField+Shake.h"

@interface AMViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textShakes;
@property (weak, nonatomic) IBOutlet UITextField *textSpeed;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textDelta;
@property (weak, nonatomic) IBOutlet UISegmentedControl *shakeDirection;

@end

@implementation AMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	[self setTitle:@"Demo"];
	[@[_textDelta, _textField, _textShakes, _textSpeed] enumerateObjectsUsingBlock:^(UITextField* obj, NSUInteger idx, BOOL *stop) {
		[obj.layer setBorderWidth:2];
		[obj.layer setBorderColor:[UIColor colorWithRed:49.0/255.0 green:186.0/255.0 blue:81.0/255.0 alpha:1].CGColor];
		[obj setDelegate:self];
	}];
	[self.shakeDirection.layer setBorderWidth:2];
	[self.shakeDirection.layer setBorderColor:self.shakeDirection.tintColor.CGColor];
    self.shakeDirection.selectedSegmentIndex = 0;
}

- (IBAction)actionShake:(id)sender
{
	[self shake];
}

- (void)shake
{
	[self.textField shake:[self.textShakes.text intValue]
				withDelta:[self.textDelta.text floatValue]
				 andSpeed:[self.textSpeed.text floatValue]
           shakeDirection:(self.shakeDirection.selectedSegmentIndex == 0) ? ShakeDirectionHorizontal : ShakeDirectionVertical];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	if (textField != _textField) {
		[textField resignFirstResponder];
	} else {
		[self shake];
	}
	
	return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self.view.subviews enumerateObjectsUsingBlock:^(UIView* obj, NSUInteger idx, BOOL *stop) {
		if ([obj isKindOfClass:[UITextField class]]) {
			[obj resignFirstResponder];
		}
	}];
}

@end
