include @DVSDKDIR@/Rules.make

lib_LTLIBRARIES = libdm36x-codecs.la
libdm36x_codecs_la_SOURCES= dummy.c
libdm36x_codecs_la_LDFLAGS = -version-info 1:0:0 -Wl,dm36x/linker.cmd

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = libdm36x-codecs.pc

EXTRA_DIST = libdm36x-codecs.pc.in dm36x.cfg config.bld

BUILT_SOURCES = dm36x/linker.cmd

# We need to export this variables to allow the config.bld to work
export CSTOOL_DIR
export TOOLCHAIN_PREFIX=@TOOLCHAIN_PREFIX@
export XDCPATH=$(XDC_INSTALL_DIR)/packages;$(CE_INSTALL_DIR)/packages;$(FC_INSTALL_DIR)/packages;$(XDAIS_INSTALL_DIR)/packages;$(CODEC_INSTALL_DIR)/packages;$(CMEM_INSTALL_DIR)/packages

dm36x/linker.cmd : $(srcdir)/dm36x.cfg
	$(XDC_INSTALL_DIR)/xs xdc.tools.configuro -o dm36x \
	 -b $(srcdir)/config.bld \
	 -t gnu.targets.arm.GCArmv5T -p ti.platforms.evmDM365 \
	 $<

libdm36x-codecs.pc: $(srcdir)/libdm36x-codecs.pc.in dm36x
	sed -e "s?@&prefix@?@prefix@?" \
	    -e "s?@&exec_prefix@?@exec_prefix@?" \
	    -e "s?@&libdir@?@libdir@?" \
	    -e "s?@&VERSION@?@VERSION@?" \
	    -e "s?@CONFIGURO_CFLAGS@?$(shell cat dm36x/compiler.opt)?" \
	    $< > $@

clean-local:
	rm -f libdm36x-codecs.pc dm36x
