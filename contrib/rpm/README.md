RPM Installation
================
The rpms for ioncoincore are available in the copr repositories for fedora, centos, epel, mageia and opensuse.  To enable these repositories on your system you need to install the dnf plugins package `dnf -y install dnf-plugins-core`, This will enable the copr dnf extension.  To install the precompiled rpm files you first need to add the copr repository to your system `dnf copr enable ck-ti/ioncoincore`. You can then install the packages with a dnf install ion-<install type> where install type is: ioncoin (all binaries), iond (only iond installed), or ion-qt (only qt wallet installed).
If a binary for your system is not available or you wish to compile on your own you can follow these instructions:
1) download a copy of ioncoincore to a a directory named after the version found in the spec file `git clone https://github.com/ioncoincore/ion.git ion-<version>`
2) copy the files in the add-to-source directory to the root of the source directory `cp add-to-source/* ion-<version>`
3) create a compressed tarball of this directory `tar -zxf ion-<version>.tar.gz ion-<version>`
4) copy this file to your rpm SOURCES directory `cp ion-<version>.tar.gz <location of rpm build files>/SOURCES`
5) copy all the patches in the /contrib/rpm/depends/patches to your rpm SOURCES directory `cp /contrib/rpm/depends/patches/* <location of rpm build files>/SOURCES`
6) copy the ion.spec file to your rpm SPECS directory `cp /contrib/rpm/ion.spec <location of rpm build files>/SPECS`
7) build the binaries using rpmbuild `rpm -ba <location of rpm build files>/SPECS/ion.spec`
8) you will now have binaries in <location of rpm build files>/RPMS/<architecture of build>