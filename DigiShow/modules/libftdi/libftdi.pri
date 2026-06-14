CONFIG += c++17

SOURCES += \
    $$PWD/libftdi/src/ftdi.c \
    $$PWD/libftdi/src/ftdi_stream.c

HEADERS += \
    $$PWD/libftdi/src/ftdi.h \
    $$PWD/libftdi/src/ftdi_i.h

INCLUDEPATH += \
    $$PWD/libftdi/src \
    $$PWD/libusb/libusb

DEFINES += HAVE_LIBUSB_1_0

macx {
    LIBS += -framework IOKit -framework CoreFoundation

    contains(QT_ARCH, arm64) {
        # use system libusb from Homebrew if bundled lib is missing
        exists($$PWD/libusb/mac-arm64/libusb-1.0.a) | exists($$PWD/libusb/mac-arm64/libusb-1.0.dylib) {
            LIBS += -L$$PWD/libusb/mac-arm64 -lusb-1.0
        } else {
            LIBS += -L/opt/homebrew/lib -lusb-1.0
        }
    } else {
        exists($$PWD/libusb/mac-x64/libusb-1.0.a) | exists($$PWD/libusb/mac-x64/libusb-1.0.dylib) {
            LIBS += -L$$PWD/libusb/mac-x64 -lusb-1.0
        } else {
            LIBS += -L/opt/homebrew/lib -lusb-1.0
        }
    }
}

win32 {
    LIBS += -lsetupapi
    LIBS += -L$$PWD/libusb/win -llibusb-1.0

    # Link Windows high-precision timer library
    LIBS += -lwinmm
}

linux {
    LIBS += -lusb-1.0
}
