#import <libactivator/libactivator.h>

@interface ExampleListener : NSObject<LAListener>
@end

@implementation ExampleListener

- (void)activator:(LAActivator *)activator receiveEvent:(LAEvent *)event
{
	UIAlertView *av = [[[UIAlertView alloc] init] autorelease];
	av.message = @"Oh noes, explosion!\nNow you're stuck!";
	[av show];
}

+ (void)load
{
	@autoreleasepool {
		[LASharedActivator registerListener:[self new] forName:@"libactivator.examplelistener"];
	}
}

@end
