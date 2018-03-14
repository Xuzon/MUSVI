TEMPLATE = app

QT += core gui quick qml multimedia widgets

target.path = $$PWD

TARGET = Musvi

CONFIG += c++11

SOURCES += main.cpp \
    logic.cpp

HEADERS += \
    logic.h

RESOURCES += ressources.qrc


DISTFILES +=\
        config/config.ini

INSTALLS += target


