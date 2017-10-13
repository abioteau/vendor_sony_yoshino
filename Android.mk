# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

ifneq ($(filter yoshino,$(PRODUCT_PLATFORM)),)

# If exist, include ODM image on target files as vendor image
ifneq ("$(wildcard $(PRODUCT_OUT)/odm.img)","")
    BOARD_PREBUILT_VENDORIMAGE := $(PRODUCT_OUT)/odm.img
endif

# Copy all files in order to rebuild ODM image with command "make custom_images"
$(shell mkdir -p $(PRODUCT_OUT)/odm/bin)
$(foreach p,$(wildcard $(LOCAL_PATH)/bin/*),$(shell cp -r $(LOCAL_PATH)/bin/$(notdir $(p)) $(PRODUCT_OUT)/odm/bin/. > /dev/null))
$(shell mkdir -p $(PRODUCT_OUT)/odm/firmware)
$(foreach p,$(wildcard $(LOCAL_PATH)/firmware/*),$(shell cp -r $(LOCAL_PATH)/firmware/$(notdir $(p)) $(PRODUCT_OUT)/odm/firmware/. > /dev/null))
$(shell mkdir -p $(PRODUCT_OUT)/odm/lib)
$(foreach p,$(wildcard $(LOCAL_PATH)/lib/*),$(shell cp -r $(LOCAL_PATH)/lib/$(notdir $(p)) $(PRODUCT_OUT)/odm/lib/. > /dev/null))
$(shell mkdir -p $(PRODUCT_OUT)/odm/lib64)
$(foreach p,$(wildcard $(LOCAL_PATH)/lib64/*),$(shell cp -r $(LOCAL_PATH)/lib64/$(notdir $(p)) $(PRODUCT_OUT)/odm/lib64/. > /dev/null))

endif
