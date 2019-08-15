ARCH = armv7 arm64 arm64e


GO_EASY_ON_ME = 1
DEBUG = 0

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = testtweak

testtweak_FILES = Tweak.x
testtweak_CFLAGS = -fobjc-arc
testtweak_LDFLAGS += -lCSColorPicker

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += testweakprefs
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
