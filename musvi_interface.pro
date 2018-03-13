TEMPLATE = app

QT += core gui quick qml multimedia widgets

target.path = $$PWD

TARGET = interface

CONFIG += c++11



SOURCES += main.cpp \
    logic.cpp

HEADERS += \
    logic.h

#RESOURCES += ressources.qrc


#include(qml/qml.pri)

DISTFILES +=\
        config/config.ini \

OTHER_FILES += \
    qml/main.qml \
    qml/Screens/Practice.qml \
    qml/Screens/Information.qml \
    qml/Screens/Init.qml \
    qml/Screens/Musvi_Controller.qml \
    qml/Screens/ArtistMode.qml \
    functions.js \
    images/.

INSTALLS += target

#qmldir.files=$$PWD/qml/qmldir

#INSTALLS +=qmldir
