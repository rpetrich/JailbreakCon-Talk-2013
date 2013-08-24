#import <substrate.h>
#import <UIKit/UIKit.h>

@interface SBIconView : UIView
- (void)setIsJittering:(BOOL)jittering;
@end

static IMP _SBIconView_setIsJittering;

static void $SBIconView_setIsJittering(id self, SEL _cmd, BOOL newValue)
{
	[self setAlpha:(newValue ? 0.5 : 1.0)];
}

__attribute__((constructor))
static void fire_ze_missiles(void)
{
	MSHookMessageEx(
		objc_getClass("SBIconView"),
		@selector(setIsJittering:),
		(IMP)&$SBIconView_setIsJittering,
		&_SBIconView_setIsJittering
	);
}
