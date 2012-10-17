//
//  ULIThemeButtonCell.m
//  ULIThemeKitTestApp
//
//  Created by Uli Kusterer on 15.10.12.
//  Copyright (c) 2012 Uli Kusterer. All rights reserved.
//

#import "ULIThemeButtonCell.h"


@implementation ULIThemeButtonCell

-(void)	drawBezelWithFrame: (NSRect)frame inView: (NSView*)controlView
{
	BOOL		isPressed = self.isHighlighted;
	BOOL		showState = self.showsStateBy & NSChangeGrayCellMask;

	[NSColor.blueColor set];
	[NSBezierPath strokeRect: frame];
	if( (showState && self.state == NSOnState) || isPressed )
		[NSColor.blueColor set];
	else
		[NSColor.whiteColor set];
	[NSBezierPath fillRect: frame];
}


-(void)	drawImage: (NSImage*)image withFrame: (NSRect)frame inView: (NSView*)controlView
{
	if( [[self valueForKey: @"buttonType"] integerValue] == NSSwitchButton && self.showsStateBy & NSContentsCellMask )
	{
		BOOL		isPressed = self.isHighlighted;
		
		[NSColor.whiteColor set];
		[NSBezierPath fillRect: frame];

		if( self.state == NSOnState )
			[NSColor.blueColor set];
		else if( self.state == NSMixedState )
			[NSColor.redColor set];
		[[NSBezierPath bezierPathWithOvalInRect: NSInsetRect(frame,3,3)] fill];
		
		[NSColor.blueColor set];
		[NSBezierPath strokeRect: NSInsetRect(frame,1,1)];

		if( isPressed )
		{
			[NSColor.blueColor set];
			[NSBezierPath strokeRect: NSInsetRect(frame,2,2)];
		}
	}
	else
		[super drawImage: image withFrame: frame inView: controlView];
}


- (NSRect)drawTitle:(NSAttributedString*)title withFrame:(NSRect)frame inView:(NSView*)controlView
{
	BOOL		isPressed = self.isHighlighted;
	BOOL		showState = self.showsStateBy & NSChangeGrayCellMask;
	BOOL		textCanBePressed = [[self valueForKey: @"buttonType"] integerValue] != NSSwitchButton;

	NSMutableAttributedString	*	tintedTitle = [title mutableCopy];
	if( (showState && self.state == NSOnState) || (isPressed && textCanBePressed) )
	{
		[tintedTitle addAttribute: NSForegroundColorAttributeName value: NSColor.whiteColor range: NSMakeRange(0, tintedTitle.length)];
	}
	else
	{
		[tintedTitle addAttribute: NSForegroundColorAttributeName value: NSColor.blueColor range: NSMakeRange(0, tintedTitle.length)];
	}
	[tintedTitle drawInRect: frame];
	return frame;
}


-(NSUInteger) hitTestForEvent:(NSEvent *)event inRect:(NSRect)cellFrame ofView:(NSView *)controlView
{
	NSUInteger	hitPart = NSCellHitNone;
	NSPoint	pos = [controlView convertPoint: event.locationInWindow fromView: nil];
	if( NSPointInRect(pos, cellFrame) )
	{
		hitPart = NSCellHitContentArea;
		if( self.isEnabled )
			hitPart = NSCellHitTrackableArea;
	}
	
	return hitPart;
}

@end
