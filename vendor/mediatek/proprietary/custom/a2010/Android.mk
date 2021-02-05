LOCAL_PATH:= $(call my-dir)
ifeq ($(MTK_PROJECT), a2010)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
