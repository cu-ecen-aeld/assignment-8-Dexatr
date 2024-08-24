##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

# Updated with the correct git commit hash for assignment 3
AESD_ASSIGNMENTS_VERSION = '1cfb8ff7fc4b1cceeb75e13b6e995088457ec3b3'
# Ensure the SSH repository URL is correct
AESD_ASSIGNMENTS_SITE = 'git@github.com:cu-ecen-aeld/assignments-3-and-later-Dexatr.git'
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/server all
endef

# Installation steps for aesdsocket utility and startup script
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# Install the aesdsocket executable to /usr/bin
	$(INSTALL) -D -m 755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	# Install the startup script to /etc/init.d/S99aesdsocket
	$(INSTALL) -D -m 755 $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	# Install any other necessary files (if required)
	# $(INSTALL) -m 755 $(@D)/other-files $(TARGET_DIR)/path/to/destination/
endef

$(eval $(generic-package))
