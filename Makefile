ARCHS = arm64 arm64e
TARGET = iphone:clang:latest:10.0

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = TrollNFCVietHoa

TrollNFCVietHoa_FILES = Tweak.xm
TrollNFCVietHoa_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
