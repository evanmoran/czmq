################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################

TEMPLATE = lib

CONFIG += plugin
QT += qml quick

TARGET = $$qtLibraryTarget(qml_czmq)
uri = QmlCZMQ

DESTDIR   = $$[QT_INSTALL_QML]/$$replace(uri, \., /)
SRCDIR    = $$PWD/src
BUILDDIR  = $$PWD/build/native

android {
  # Use a default value assuming the czmq project sits outside this one
  isEmpty(CZMQ_ROOT) {
    CZMQ_ROOT = $$clean_path($$PWD/../..)
  }
  !exists($$CZMQ_ROOT) {
    error(The CZMQ_ROOT directory does not exist: $$CZMQ_ROOT)
  }
  # Build the czmq library for android unless it is already built
  !system(bash $$CZMQ_ROOT/builds/android/build.sh) {
    error(Failed to build the czmq library with $$CZMQ_ROOT/builds/android/build.sh)
  }
  
  VENDOR_PREFIX = $$CZMQ_ROOT/builds/android/prefix/$(TOOLCHAIN_NAME)
  BUILDDIR  = $$PWD/build/$(TOOLCHAIN_NAME)
  QMAKE_LIBDIR += $$VENDOR_PREFIX/lib
  QMAKE_INCDIR += $$VENDOR_PREFIX/include
}

LIBS += -lczmq

HEADERS += \
  $$SRCDIR/qml_czmq_plugin.h \
  $$SRCDIR/QmlZactor.h \
  $$SRCDIR/QmlZarmour.h \
  $$SRCDIR/QmlZcert.h \
  $$SRCDIR/QmlZcertstore.h \
  $$SRCDIR/QmlZchunk.h \
  $$SRCDIR/QmlZclock.h \
  $$SRCDIR/QmlZconfig.h \
  $$SRCDIR/QmlZdigest.h \
  $$SRCDIR/QmlZdir.h \
  $$SRCDIR/QmlZdirPatch.h \
  $$SRCDIR/QmlZfile.h \
  $$SRCDIR/QmlZframe.h \
  $$SRCDIR/QmlZhash.h \
  $$SRCDIR/QmlZhashx.h \
  $$SRCDIR/QmlZiflist.h \
  $$SRCDIR/QmlZlist.h \
  $$SRCDIR/QmlZlistx.h \
  $$SRCDIR/QmlZloop.h \
  $$SRCDIR/QmlZmsg.h \
  $$SRCDIR/QmlZpoller.h \
  $$SRCDIR/QmlZproc.h \
  $$SRCDIR/QmlZsock.h \
  $$SRCDIR/QmlZstr.h \
  $$SRCDIR/QmlZtrie.h \
  $$SRCDIR/QmlZuuid.h 

SOURCES += \
  $$SRCDIR/QmlZactor.cpp \
  $$SRCDIR/QmlZarmour.cpp \
  $$SRCDIR/QmlZcert.cpp \
  $$SRCDIR/QmlZcertstore.cpp \
  $$SRCDIR/QmlZchunk.cpp \
  $$SRCDIR/QmlZclock.cpp \
  $$SRCDIR/QmlZconfig.cpp \
  $$SRCDIR/QmlZdigest.cpp \
  $$SRCDIR/QmlZdir.cpp \
  $$SRCDIR/QmlZdirPatch.cpp \
  $$SRCDIR/QmlZfile.cpp \
  $$SRCDIR/QmlZframe.cpp \
  $$SRCDIR/QmlZhash.cpp \
  $$SRCDIR/QmlZhashx.cpp \
  $$SRCDIR/QmlZiflist.cpp \
  $$SRCDIR/QmlZlist.cpp \
  $$SRCDIR/QmlZlistx.cpp \
  $$SRCDIR/QmlZloop.cpp \
  $$SRCDIR/QmlZmsg.cpp \
  $$SRCDIR/QmlZpoller.cpp \
  $$SRCDIR/QmlZproc.cpp \
  $$SRCDIR/QmlZsock.cpp \
  $$SRCDIR/QmlZstr.cpp \
  $$SRCDIR/QmlZtrie.cpp \
  $$SRCDIR/QmlZuuid.cpp 

OBJECTS_DIR = $$BUILDDIR/.obj
MOC_DIR     = $$BUILDDIR/.moc
RCC_DIR     = $$BUILDDIR/.rcc
UI_DIR      = $$BUILDDIR/.ui

target.path  = $$DESTDIR
qmldir.files = $$PWD/qmldir
qmldir.path  = $$DESTDIR

OTHER_FILES += $$SRCDIR/qmldir \
               $$SRCDIR/qml/*
#*/

INSTALLS    += target qmldir

# Copy the qmldir file to the same folder as the plugin binary
QMAKE_POST_LINK += \
  $$QMAKE_COPY $$replace($$list($$quote($$SRCDIR/qmldir) $$DESTDIR), /, $$QMAKE_DIR_SEP)

# Copy the dependency shared libraries to the plugin folder (on android only)
android {
  QMAKE_POST_LINK += \
  && $$QMAKE_COPY $$replace($$list($$quote($$VENDOR_PREFIX/lib/*.so)  $$DESTDIR), /, $$QMAKE_DIR_SEP)
}
#*/

# Copy the qml implementation directory to the plugin folder
copyqml.commands = $(COPY_DIR) $$SRCDIR/qml $$DESTDIR
first.depends = $(first) copyqml
export(first.depends)
export(copyqml.commands)
QMAKE_EXTRA_TARGETS += first copyqml

################################################################################
#  THIS FILE IS 100% GENERATED BY ZPROJECT; DO NOT EDIT EXCEPT EXPERIMENTALLY  #
#  Read the zproject/README.md for information about making permanent changes. #
################################################################################
