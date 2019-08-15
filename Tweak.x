#include <CSColorPicker/CSColorPicker.h>
#define PLIST_PATH @"/User/Library/Preferences/com.shad0wr00t.testtweak.plist"

inline NSString *StringForPreferenceKey(NSString *key) {
    NSDictionary *prefs = [NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] ? : [NSDictionary new];
    return prefs[key];
}




// source code from creaturesurvive CSColorPicker

// to change com.apple.mobilephone call dialer button from green to any color
%hook PHBottomBarButton


- (void)setBackgroundColor:(UIColor *)color {

  color = [UIColor cscp_colorFromHexString:StringForPreferenceKey(@"k_myTweakBackgroundColor")];

  NSString *hex = [UIColor cscp_hexStringFromColor:color];
     NSLog(@"%@", hex);

     hex = ...
NSLog(@"%@", hex);

   // we can also validate our hex string if we need
   BOOL valid = [UIColor cscp_isValidHexString:@"FFFFFF"];
}


- (void)setGradientView {
// get an array of CGColors from a preference value, the value is a comma separated string of hex colors eg" FFFFFF,000000,111111
NSArray<id> *gradientColors = [StringForPreferenceKey(@"k_myTweakBackgroundGradient") cscp_gradientStringCGColors];

CAGradientLayer *gradient = [CAGradientLayer layer];
  gradient.frame = self.bounds;

// left to right gradient
  gradient.startPoint = CGPointMake(0, 0.5);
  gradient.endPoint = CGPointMake(1, 0.5);

// set the gradient colors
gradient.colors = gradientColors;

// add the gradient to the view
[self addSublayer:gradient];


}

%end
