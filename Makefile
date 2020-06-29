ARCHS = arm64

include $(THEOS)/makefiles/common.mk

TOOL_NAME = fjc

fjc_FILES = Cryptor/NSString+AESCrypt.m Cryptor/NSData+AESCrypt.m main.m
FlyJBCryptor_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tool.mk
