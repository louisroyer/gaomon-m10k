prefix = /usr/local
exec_prefix = $(prefix)
bindir = $(exec_prefix)/bin

SYSTEMD_DIR = /etc/systemd/user/
UDEV_DIR = /etc/udev/rules.d/

RM = rm -f
CP = cp -r --preserve=mode
MKDIR_P = mkdir -p
RMDIR = rmdir

.PHONY: install uninstall installdirs uninstalldirs

installdirs: 
	$(MKDIR_P) \
		$(DESTDIR)$(bindir) \
		$(DESTDIR)$(SYSTEMD_DIR) \
		$(DESTDIR)$(UDEV_DIR)
uninstalldirs:
	$(RMDIR) \
		$(DESTDIR)$(bindir) \
		$(DESTDIR)$(SYSTEMD_DIR) \
		$(DESTDIR)$(UDEV_DIR)

uninstall:
	$(RM) $(realpath $(DESTDIR)$(SYSTEMD_DIR)/gaomon-m10k.service)
	$(RM) $(realpath $(DESTDIR)$(UDEV_DIR)/99-gaomon-m10k.rules)
	$(RM) $(realpath $(DESTDIR)$(bindir)/gaomon-m10k.sh)

install: installdirs 
	$(CP) gaomon-m10k.service $(DESTDIR)$(SYSTEMD_DIR)
	$(CP) 99-gaomon-m10k.rules $(DESTDIR)$(UDEV_DIR)
	$(CP) gaomon-m10k.sh $(DESTDIR)$(bindir)
