#import <libactivator/libactivator.h>

%hook SBIconView

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	LAEvent *event = [LAEvent eventWithName:@"com.rpetrich.icon-tapped" mode:LAEventModeSpringBoard];
	[LASharedActivator sendEventToListener:event];
}

%end
