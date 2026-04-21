# Referenced from the following Claude chat log: https://claude.ai/share/dc9a855f-d345-41b9-8189-024ec6f2104e
# Note: the code was originally sourced from https://github.com/adafruit/Raspberry-Pi-Installer-Scripts/

FB_ST7789V_VERSION = main
FB_ST7789V_SITE = https://github.com/alken2/AESD-Final-Project-Drivers
FB_ST7789V_SITE_METHOD = git
FB_ST7789V_LICENSE = GPL-2.0
FB_ST7789V_MODULE_SUBDIRS = st7789_module

$(eval $(kernel-module))
$(eval $(generic-package))