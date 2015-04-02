TEMPLATE = app

QT += qml quick widgets
QT += network

SOURCES += main.cpp \
    network.cpp \
    p2p.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
RC_ICONS = logo.ico

HEADERS += \
    network.h \
    p2p.h
