#import "ParmyLib.h"

void DefineParmyParms()
{
	[[NSDictionary dictionaryWithObjectsAndKeys: 

//		[NSNumber numberWithFloat:75.0], @"desc height",
//		[NSNumber numberWithFloat:65.0], @"desc width",
	  [NSNumber numberWithFloat:40], @"blocks x",
	  [NSNumber numberWithFloat:40], @"blocks y",
	  [NSNumber numberWithFloat:40], @"blocks width",
	  [NSNumber numberWithFloat:40], @"blocks height",
	  [NSNumber numberWithFloat:0.5], @"anim duration",
	  [NSNumber numberWithInt:1], @"anim curve",
		nil

	  ] setParmyLibSet:0];
}

