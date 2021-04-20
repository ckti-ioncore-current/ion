RPM Installation
================
The rpms for ioncoincore are available in the copr repositories.  To enable these repositories on your system you need to install the dnf plugins package `dnf -y install dnf-plugins-core`, This will enable the copr dnf extension.  To install the precompiled rpm files you first need to add the copr repository to your system `dnf copr enable ck-ti/ioncoincore`. You can then install the packages with a dnf install ion-<install type> where install type is: ioncoin (all binaries), iond (only iond installed), or ion-qt (only qt wallet installed).
If a binary for your system is not available or you wish to compile on your own you can follow these instructions:
1) download a copy of ioncoincore `git clone https://github.com/ioncoincore/ion.git`
2)

