#import <FSSwitchDataSource.h>
#import <FSSwitchPanel.h>
#import <notify.h>

// Drop bundle in /Library/Flipswitch/Switches

@interface ExampleSwitch : NSObject <FSSwitchDataSource>
@end

#define kSettingsFilePath @"/var/mobile/Library/Preferences/com.rpetrich.dietbulletin.plist"
#define kSettingsKey @"DBBulletinStyle"
#define kChangeNotification "com.rpetrich.dietbulletin.settingschanged"

@implementation ExampleSwitch

- (FSSwitchState)stateForSwitchIdentifier:(NSString *)switchIdentifier
{
	NSDictionary *settings = [NSDictionary dictionaryWithContentsOfFile:kSettingsFilePath];
	return [[settings objectForKey:kSettingsKey] intValue] == 0 ? FSSwitchStateOn : FSSwitchStateOff;
}

- (void)applyState:(FSSwitchState)newState forSwitchIdentifier:(NSString *)switchIdentifier
{
	NSMutableDictionary *settings = [NSMutableDictionary dictionaryWithContentsOfFile:kSettingsFilePath];
		?: [NSMutableDictionary dictionary];
	[settings setObject:[NSNumber numberWithInt:newState ? 0 : 1] forKey:kSettingsKey];
	notify_post(kChangeNotification);
	[[FSSwitchPanel sharedPanel] stateDidChangeForSwitchIdentifier:switchIdentifier];
}

@end
