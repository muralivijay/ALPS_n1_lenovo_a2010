LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE = emdlogger1
LOCAL_MODULE_CLASS = EXECUTABLES
LOCAL_MODULE_OWNER = mtk
LOCAL_PROPRIETARY_MODULE = true
LOCAL_MODULE_TAGS = optional
LOCAL_SHARED_LIBRARIES = libselinux libccci_util libmdloggerrecycle libc++
LOCAL_MULTILIB = 64
LOCAL_SRC_FILES_64 = arm64/emdlogger1
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE = emdlogger1
LOCAL_MODULE_CLASS = EXECUTABLES
LOCAL_MODULE_OWNER = mtk
LOCAL_PROPRIETARY_MODULE = true
LOCAL_MODULE_TAGS = optional
LOCAL_SHARED_LIBRARIES = libselinux libccci_util libmdloggerrecycle libc++
LOCAL_MULTILIB = 32
LOCAL_SRC_FILES_32 = arm/emdlogger1
include $(BUILD_PREBUILT)
