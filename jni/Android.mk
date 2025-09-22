LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_C_INCLUDES := $(LOCAL_PATH)/c/include
LOCAL_CFLAGS := -O2
LOCAL_MODULE := brotli
LOCAL_LDLIBS :=-lm 

#source code
LOCAL_SRC_FILES := c/tools/brotli.c \
    $(wildcard c/enc/*.c) \
    $(wildcard c/dec/*.c) \
    $(wildcard c/common/*.c)
   


ifeq ($(TARGET_ARCH_ABI),x86)
    LOCAL_CFLAGS += -ffast-math -mtune=atom -mssse3 -mfpmath=sse
endif

include $(BUILD_EXECUTABLE)
