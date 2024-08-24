##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# Updated with the correct git commit hash for assignment 3
AESD_ASSIGNMENTS_VERSION = '51ae4619780f164ede292dac1ff6eb07e2ac88a2'
# Ensure the SSH repository URL is correct
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-Dexatr.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

# Installation steps for writer, finder, and finder-test utilities/scripts
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Create necessary directories
	$(INSTALL) -d 0755 $(TARGET_DIR)/etc/finder-app/conf/
	# Install configuration files
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	# Install test scripts into /usr/bin
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/usr/bin/
	# Install the writer utility
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
	# Install the finder and finder-test scripts into /usr/bin
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))
