//
//  ULITableViewDataSourceTest.m
//  ULIThemeKitTestApp
//
//  Created by Uli Kusterer on 21.10.12.
//  Copyright (c) 2012 Uli Kusterer. All rights reserved.
//

#import "ULITableViewDataSourceTest.h"
#import "ULIThemeTableView.h"

@implementation ULITableViewDataSourceTest

-(id)	init
{
	if(( self = [super init] ))
	{
		mItems = [[NSMutableArray alloc] initWithObjects: @"Eins", @"Zwei", @"Freddy", @"kommt", @"vorbei", nil];
	}
	
	return self;
}

-(NSInteger)	numberOfRowsInTableView: (NSTableView *)tableView
{
	return mItems.count;
}

/* This method is required for the "Cell Based" TableView, and is optional for the "View Based" TableView. If implemented in the latter case, the value will be set to the view at a given row/column if the view responds to -setObjectValue: (such as NSControl and NSTableCellView).
 */
- (id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
	return [mItems objectAtIndex: row];
}

-(void)	awakeFromNib
{
	[super awakeFromNib];
	
	[mTableView reloadData];
}


- (void)tableView:(NSTableView *)tableView didAddRowView:(NSTableRowView *)rowView forRow:(NSInteger)row
{
	NSArray	*	altRowColors = ((ULIThemeTableView*)tableView).alternatingRowColors;
	rowView.backgroundColor = [altRowColors objectAtIndex: row % altRowColors.count];
}

@end
