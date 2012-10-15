//
//  ULIThemeButton.m
//  ULIThemeKitTestApp
//
//  Created by Uli Kusterer on 15.10.12.
//  Copyright (c) 2012 Uli Kusterer. All rights reserved.
//

#import "ULIThemeButton.h"
#import "ULIThemeButtonCell.h"


@implementation ULIThemeButton

+(void) initialize
{
	[self setCellClass: ULIThemeButtonCell.class];
}

//-(NSView *)	hitTest: (NSPoint)aPoint
//{
//	if( NSPointInRect( aPoint, self.frame )/*[self.cell hitTestForEvent: NSApplication.sharedApplication.currentEvent inRect: [self.cell drawingRectForBounds: self.bounds] ofView: self] != NSCellHitNone*/ )
//	{
//		NSLog( @"hit %@", self.title );
//		return self;
//	}
//	else
//	{
//		NSLog( @"NOT hit %@", self.title );
//		return nil;
//	}
//}

@end
