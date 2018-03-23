TEMPLATE = app

QT += core gui quick qml multimedia widgets

target.path = $$PWD

TARGET = Musvi

CONFIG += c++11

SOURCES += main.cpp \
    logic.cpp \
    bufferprocessor.cpp \
    classifier.cpp \
    filter.cpp \
    highpassfilter.cpp \
    impulse.cpp \
    lowpassfilter.cpp \
    transcriptor.cpp \
    metronomethread.cpp \
    scoresaver.cpp

HEADERS += \
    logic.h \
    bufferprocessor.h \
    classifier.h \
    filter.h \
    highpassfilter.h \
    impulse.h \
    lowpassfilter.h \
    transcriptor.h \
    metronomethread.h \
    scoresaver.h

RESOURCES += ressources.qrc


DISTFILES +=\
        config/config.ini \
    PopUp.qml

INSTALLS += target


