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

+(void) load
{
	[self setCellClass: ULIThemeButtonCell.class];
}

@end
