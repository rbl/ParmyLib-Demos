//
//  ParmyPadAppDelegate.m
//  ParmyPad
//
//  Created by Tom Seago on 7/17/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ParmyPadAppDelegate.h"


#import "RootViewController.h"
#import "DetailViewController.h"

#import "ParmyLib.h"
#import "ParmyParms.h"

@implementation ParmyPadAppDelegate

@synthesize window, splitViewController, rootViewController, detailViewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
	// Initialize that library eh?...
	DefineParmyParms();
	
    // Override point for customization after app launch.
    
	// Set the split view controller as the window's root view controller and display.
    self.window.rootViewController = self.splitViewController;
    [self.window makeKeyAndVisible];
	
	// Let's see if a gesture recognizer on the main window ever gets called
	UITapGestureRecognizer* tap = [[[UITapGestureRecognizer alloc] init] autorelease];
	[tap addTarget:self action:@selector(launchParmy:)];
	tap.numberOfTapsRequired = 3;
	tap.numberOfTouchesRequired = 2;
	[self.window addGestureRecognizer:tap];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive.
     */
}


- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     */
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc {
    [splitViewController release];
    [window release];
    [super dealloc];
}


-(void) launchParmy:(id)sender
{
	[ParmyLib toggleInWindow:nil];
}

@end

