//
//  ULIThemeTextFieldCell.m
//  ULIThemeKitTestApp
//
//  Created by Uli Kusterer on 17.10.12.
//  Copyright (c) 2012 Uli Kusterer. All rights reserved.
//

#import "ULIThemeTextFieldCell.h"

@implementation ULIThemeTextFieldCell

-(id)	initWithCoder:(NSCoder *)aDecoder
{
	if(( self = [super initWithCoder: aDecoder] ))
	{
		[self commonInit];
	}
	
	return self;
}

-(id)	initTextCell:(NSString *)aString
{
	if(( self = [super initTextCell: aString] ))
	{
		[self commonInit];
	}
	
	return self;
}


-(void)	commonInit
{
	[self setDrawsBackground: NO];
	[self setTextColor: NSColor.whiteColor];
}


-(void) drawWithFrame:(NSRect)cellFrame inView:(NSView *)controlView
{
	[NSColor.blueColor setFill];
	[NSBezierPath fillRect: cellFrame];
	
	[self drawInteriorWithFrame: cellFrame inView: controlView];
}

@end
