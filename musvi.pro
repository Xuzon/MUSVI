TEMPLATE = app

QT += core gui quick qml multimedia widgets

target.path = $$PWD

TARGET = Musvi


CONFIG += c++11

#static {
#    QTPLUGIN += qtvirtualkeyboardplugin
#    QT += svg
#}

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
    calibrator.cpp \
    scorechecker.cpp

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
    calibrator.h \
    scorechecker.h

RESOURCES += ressources.qrc


#Todos los qml están añadidos aquí para que sea más sencillo acceder a ellos
DISTFILES +=\
        config/config.ini \
        qml/ArtistMode.qml \
        qml/Menu.qml \
        qml/Information.qml \
        qml/Init.qml \
        qml/Musvi_Controller.qml \
        qml/Practice.qml \
        qml/PopUp.qml \
        main.qml

INSTALLS += target


