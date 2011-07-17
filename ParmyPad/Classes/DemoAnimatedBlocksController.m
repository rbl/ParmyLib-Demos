    //
//  DemoAnimatedBlocksController.m
//  ParmyPad
//
//  Created by Tom Seago on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DemoAnimatedBlocksController.h"

#import "ParmyLib.h"

@implementation DemoAnimatedBlocksController

-(id) init
{
	if ((self = [super init]))
	{
		//[self viewDidLoad];
	}
	return self;
}

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(void) viewDidLoad 
{
    [super viewDidLoad];
	
	UIColor* gColors[] = {
		[UIColor redColor],
		[UIColor blueColor],
		[UIColor greenColor],
		[UIColor yellowColor],
		[UIColor purpleColor],
		[UIColor brownColor]
	};
	
	CGRect frame = CGRectMake([@"blocks x" pfvd:40.0], 
							  [@"blocks y" pfvd:40], 
							  [@"blocks width" pfvd:50], 
							  [@"blocks height" pfvd:80] );
	for(int i=0; i<6; i++) 
	{
		_blocks[i] = [[UIButton buttonWithType:UIButtonTypeCustom] retain];
		_blocks[i].backgroundColor = gColors[i];
		//NSValue* val = [_blocks[i] valueForKey:@"backgroundColor"];
		_blocks[i].frame = frame;
		[self.view addSubview:_blocks[i]];
		[_blocks[i] addTarget:self action:@selector(blockTouched:) forControlEvents:UIControlEventTouchDown];
		
		frame.origin.x += frame.size.width;
		
		[@"blocks y" bindOnto:@"y" ofObject:_blocks[i]];
	}	
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}


- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


-(void) blockTouched:(UIButton*)block
{
	// Curve selection
	int curve = 3;
	int opts = curve << 16;
	
	[self.view bringSubviewToFront:block];
	[UIView animateWithDuration:0.2 delay:0.0 options:opts animations:^{
		_expanded.transform = CGAffineTransformIdentity;
		block.transform = CGAffineTransformMakeScale(1.4, 1.4);
		_expanded = block;
		
	} completion:^(BOOL f) {
		
	}];
}

@end
