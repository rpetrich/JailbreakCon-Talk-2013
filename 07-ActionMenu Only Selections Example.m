#import <ActionMenu/ActionMenu.h>

// Drop dylib or bundle in /Library/ActionMenu/Actions

@interface UIResponder (ExplodeAction)

+ (void)load
{
	[[UIMenuController sharedMenuController]
		registerAction: @selector(explode)
		title: @"Explode"
		canPerform: @selector(canExplode)
	];
}

- (BOOL)canExplode
{
	return [[self textualRepresentation] length] != 0;
}

- (void)explode
{
	UIAlertView *av = [[[UIAlertView alloc] init] autorelease];
	av.message = [self selectedTextualRepresentation];
	[av show];
	[av addButtonWithTitle:@"OK"];
}

@end
