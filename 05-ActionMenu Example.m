#import <ActionMenu/ActionMenu.h>

// Drop dylib or bundle in /Library/ActionMenu/Actions

@interface UIResponder (ExplodeAction)

+ (void)load
{
	[[UIMenuController sharedMenuController]
		registerAction: @selector(explode)
		title: @"Explode"
		canPerform: @selector(always)
	];
}

- (void)explode
{
	UIAlertView *av = [[[UIAlertView alloc] init] autorelease];
	av.message = @"Oh noes, explosion!\nNow you're stuck!";
	[av show];
}

@end
