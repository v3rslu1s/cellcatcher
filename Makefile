ARCHS = armv7 arm64 arm64e
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = CellCatcher

CellCatcher_FILES = Tweak.xm
CellCatcher_CFLAGS = -fobjc-arc
CellCatcher_FRAMEWORKS = CoreTelephony
# CellCatcher_CODESIGN_FLAGS=-Sentitlements.xml

include $(THEOS_MAKE_PATH)/tweak.mk

THEOS_DEVICE_IP=127.0.0.1
THEOS_DEVICE_PORT=2222
