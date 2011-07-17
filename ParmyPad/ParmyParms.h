#import "ParmyLib.h"

void DefineParmyParms()
{
	[[NSDictionary dictionaryWithObjectsAndKeys: 

		[NSNumber numberWithFloat:75.0], @"desc height",
		[NSNumber numberWithFloat:65.0], @"desc width",
		nil

	  ] setParmyLibSet:0];
}

