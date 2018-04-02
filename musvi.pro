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
    scoresaver.cpp \
    calibrator.cpp

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
    scoresaver.h \
    calibrator.h

RESOURCES += ressources.qrc


DISTFILES +=\
        config/config.ini \
        qml/PopUp.qml \
        qml/ArtistMode.qml \
        qml/Information.qml \
        qml/Init.qml \
        qml/Musvi_Controller \
        qml/Practice.qml \
        main.qml

INSTALLS += target


