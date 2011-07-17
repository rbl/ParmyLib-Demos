//
//  DetailViewController.m
//  ParmyPad
//
//  Created by Tom Seago on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"


@interface DetailViewController ()

@property (nonatomic, retain) UIPopoverController *popoverController;
- (void)configureView;

@end



@implementation DetailViewController

@synthesize toolbar, popoverController;

@synthesize demoController = _demoController;

#pragma mark -
#pragma mark Managing the detail item

/*
 When setting the detail item, update the view and dismiss the popover controller if it's showing.
 */
-(void) setDemoController:(UIViewController*)demo
{
	if (demo != _demoController) {
		if (_demoController) {
			[_demoController viewWillDisappear:NO];
			[_demoController.view removeFromSuperview];
			[_demoController viewDidDisappear:NO];
		}
		
		[_demoController release];
		_demoController = [demo retain];
	}

    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }
	
	if (!_demoController) return;
	
	// Get the view and configure it
	CGRect frame = self.view.bounds;
	CGRect toolbarFrame = toolbar.bounds;
	frame.origin.y += toolbarFrame.size.height;
	frame.size.height -= toolbarFrame.size.height;
	
	UIView* view = _demoController.view;
	view.frame = frame;
	
	[_demoController viewWillAppear:NO];
	[self.view addSubview:view];
	[_demoController viewDidAppear:NO];
}


#pragma mark -
#pragma mark Split view support

- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc {
    
    barButtonItem.title = @"Demos";
    NSMutableArray *items = [[toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = pc;
}


// Called when the view is shown again in the split view, invalidating the button and popover controller.
- (void)splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    
    NSMutableArray *items = [[toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [toolbar setItems:items animated:YES];
    [items release];
    self.popoverController = nil;
}


#pragma mark -
#pragma mark Rotation support

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


#pragma mark -
#pragma mark View lifecycle

/*
 // Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
 */

/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.popoverController = nil;
}


#pragma mark -
#pragma mark Memory management

/*
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
*/

- (void)dealloc {
    [popoverController release];
    [toolbar release];
    
	self.demoController = nil;
	
    [super dealloc];
}

@end
