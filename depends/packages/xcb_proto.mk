package=xcb_proto
$(package)_version=1.13
$(package)_download_path=http://xcb.freedesktop.org/dist
$(package)_file_name=xcb-proto-$($(package)_version).tar.bz2
$(package)_sha256_hash=7b98721e669be80284e9bbfeab02d2d0d54cd11172b72271e47a2fe875e2bde1
$(package)_patches=0001-xcb-proto-for-new-python.patch

define $(package)_set_vars
  $(package)_config_opts=--disable-shared
  $(package)_config_opts_linux=--with-pic
endef

define $(package)_preprocess_cmds
if  python3 -c 'import sys; assert sys.version_info >= (3,9)' > /dev/null; then \
 patch -p1 < $($(package)_patch_dir)/0001-xcb-proto-for-new-python.patch &&\
fi \
cp -f $(BASEDIR)/config.guess $(BASEDIR)/config.sub .
endef

define $(package)_config_cmds
  $($(package)_autoconf)
endef

define $(package)_build_cmds
  $(MAKE)
endef

define $(package)_stage_cmds
  $(MAKE) DESTDIR=$($(package)_staging_dir) install
endef

define $(package)_postprocess_cmds
  find -name "*.pyc" -delete && \
  find -name "*.pyo" -delete
endef
