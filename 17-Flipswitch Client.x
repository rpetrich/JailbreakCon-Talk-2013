#import <Flipswitch/FSSwitchPanel.h>

@implementation MyTweakView

- (id)initWithFrame:(CGRect)frame
{
	if ((self = [super initWithFrame:frame])) {
		// Log a list of switches
		NSLog(@"Switches: %@", [FSSwitchPanel sharedPanel].switchIdentifiers);
		// Add a Wi-Fi button
		UIButton *button = [[FSSwitchPanel sharedPanel]
			buttonForSwitchIdentifier: @"com.a3tweaks.switch.wifi"
			usingTemplate: [NSBundle bundleWithPath:@"/Library/Application Support/MyTweak/Template.bundle"]
		];
		[self addSubview:button];
	}
	return self;
}

@end
