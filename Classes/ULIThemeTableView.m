//
//  ULIThemeTableView.m
//  ULIThemeKitTestApp
//
//  Created by Uli Kusterer on 21.10.12.
//  Copyright (c) 2012 Uli Kusterer. All rights reserved.
//

#import "ULIThemeTableView.h"

@implementation ULIThemeTableView

-(void)	drawRow: (NSInteger)inRow clipRect: (NSRect)inClipRect
{
	NSRect		box = [self rectOfRow: inRow];
	if( [self.selectedRowIndexes containsIndex: inRow] )
		[NSColor.greenColor set];
	else
		[NSColor.blueColor set];
	[NSBezierPath fillRect: box];
	
	if( inRow >= 0 && inRow <= self.numberOfRows )
	{
		for( NSInteger x = 0; x < self.numberOfColumns; x++ )
		{
			NSCell	*	theCell = [self preparedCellAtColumn: x row: inRow];
			NSRect		cellBox = [self frameOfCellAtColumn: x row: inRow];
			[theCell setHighlighted: NO];
			[theCell drawWithFrame: cellBox inView: self];
		}
	}
}


-(void)	highlightSelectionInClipRect: (NSRect)inClipRect
{
	NSInteger	currSelRow = [self.selectedRowIndexes firstIndex];
	while( true )
	{
		NSRect		box = [self rectOfRow: currSelRow];
		
		[NSColor.greenColor set];
		[NSBezierPath fillRect: box];
		
		if( currSelRow == self.selectedRowIndexes.lastIndex )
			break;
		currSelRow = [self.selectedRowIndexes indexGreaterThanIndex: currSelRow];
	}
}


-(void)	drawBackgroundInClipRect: (NSRect)inClipRect
{
	[NSColor.redColor set];
	[NSBezierPath fillRect: inClipRect];
}

@end
