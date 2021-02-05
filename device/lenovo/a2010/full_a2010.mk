
# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Set target and base project for flavor build
MTK_TARGET_PROJECT := $(subst full_,,$(TARGET_PRODUCT))
MTK_BASE_PROJECT := $(MTK_TARGET_PROJECT)
MTK_PROJECT_FOLDER := $(shell find device/* -maxdepth 1 -name $(MTK_BASE_PROJECT))
MTK_TARGET_PROJECT_FOLDER := $(shell find device/* -maxdepth 1 -name $(MTK_TARGET_PROJECT))

# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
# Inherit from maguro device
$(call inherit-product, device/lenovo/$(MTK_TARGET_PROJECT)/device.mk)

# set locales & aapt config.
include $(MTK_TARGET_PROJECT_FOLDER)/ProjectConfig.mk
ifneq (,$(filter OP01%, $(OPTR_SPEC_SEG_DEF)))
  ifeq ($(OP01_COMPATIBLE), yes)
    PRODUCT_LOCALES:=zh_CN en_US zh_TW ja_JP en_GB fr_FR
  else
    PRODUCT_LOCALES:=zh_CN en_US zh_TW en_IN
  endif
else ifneq (,$(filter OP09%, $(OPTR_SPEC_SEG_DEF)))
  PRODUCT_LOCALES:=zh_CN zh_HK zh_TW en_US pt_BR pt_PT en_GB fr_FR ja_JP
else
  PRODUCT_LOCALES := en_IN en_US
endif


# Set those variables here to overwrite the inherited values.
PRODUCT_MANUFACTURER := Lenovo
PRODUCT_NAME := full_a2010
PRODUCT_DEVICE := $(strip $(MTK_BASE_PROJECT))
PRODUCT_MODEL := Lenovo A2010-a
PRODUCT_POLICY := android.policy_phone
PRODUCT_BRAND := Lenovo
BUILD_FINGERPRINT := Lenovo/A2010-a/A2010-a:5.1/LMY47D/A2010-a-t_S255_151022.151022:user/release-keys
#PRIVATE_BUILD_DESC := "full_aeon6735m_65u_n_l1-user" "5.1" "LMY47D" "1448612642" "release-keys"
PRODUCT_DEFAULT_LOCALE := ru_RU

ifeq ($(TARGET_BUILD_VARIANT), eng)
KERNEL_DEFCONFIG ?= a2010_defconfig
else
KERNEL_DEFCONFIG ?= a2010_defconfig
endif
PRELOADER_TARGET_PRODUCT ?= a2010
LK_PROJECT ?= a2010
TRUSTY_PROJECT ?= a2010
