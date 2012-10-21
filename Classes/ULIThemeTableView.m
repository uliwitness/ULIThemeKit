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
	if( inRow >= 0 && inRow <= self.numberOfRows )
	{
		NSArray	*	altRowColors = self.alternatingRowColors;
		NSRect		box = [self rectOfRow: inRow];
		if( [self.selectedRowIndexes containsIndex: inRow] )
		{
			if( self.window.isKeyWindow || self.window.isMainWindow )
				[NSColor.greenColor set];
			else
				[NSColor.lightGrayColor set];
		}
		else
		{
			NSColor	*	currColor = [altRowColors objectAtIndex: inRow % altRowColors.count];
			[currColor set];
		}
		[NSBezierPath fillRect: box];
		
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


-(NSArray*)	alternatingRowColors
{
	static NSArray*	sAltRowColors = nil;
	if( !sAltRowColors )
		sAltRowColors = [[NSArray alloc] initWithObjects: NSColor.blueColor, [NSColor colorWithCalibratedRed: 0 green: 0 blue: 0.8 alpha: 1.0], nil];
	return sAltRowColors;
}


-(void)	drawBackgroundInClipRect: (NSRect)inClipRect
{
	NSRect		lastRowBox = self.bounds;
	if( self.numberOfRows > 0 )
		lastRowBox = [self rectOfRow: self.numberOfRows -1];
	else
	{
		lastRowBox.origin.y = lastRowBox.size.height;
		lastRowBox.size.height = self.rowHeight;
	}
	
	NSArray	*	altRowColors = self.alternatingRowColors;
	NSInteger	currFakeRowIndex = self.numberOfRows;
	NSRect		currRowBox = lastRowBox;
	currRowBox.origin.y += lastRowBox.size.height;
		
	while( NSMinY(currRowBox) < NSMaxY(inClipRect) )
	{
		NSColor*	currColor = [altRowColors objectAtIndex: currFakeRowIndex % altRowColors.count];
		[currColor set];
		[NSBezierPath fillRect: currRowBox];
		
		currRowBox.origin.y += currRowBox.size.height;
		currFakeRowIndex++;
	}
}

@end
