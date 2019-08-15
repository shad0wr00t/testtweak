ARCH = armv7 arm64 arm64e


include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = testweakprefs

testweakprefs_FILES = TTPRootListController.m
testweakprefs_INSTALL_PATH = /Library/PreferenceBundles
testweakprefs_FRAMEWORKS = UIKit
testweakprefs_PRIVATE_FRAMEWORKS = Preferences
testweakprefs_CFLAGS = -fobjc-arc
testtweakprefs_LDFLAGS += -lCSColorPicker

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/testweakprefs.plist$(ECHO_END)
