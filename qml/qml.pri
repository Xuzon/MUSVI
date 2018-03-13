PATH = $$PWD

MAIN = main \

INCLUDEPATH += $${PATH}

for(file, MAIN){
    DISTFILES += $${PATH}/$${file}.qml
}

PATH = $$PWD/Screens

SCREENS = ArtistMode \
          Information \
          Practice \
          Musvi_Controller \

INCLUDEPATH += $${PATH}
for (file,SCREENS){
DISTFILES += $${PATH}/$${file}.qml
}

PATH = $$PWD\
$$PWD/imports \

IMPORT_PATH += $${PATH}
QML_IMPORT_PATH += $${PATH}

QMLDIR = Screens \

for (dir,QMLDIR){
DISTFILES+=$$PWD/$${dir}/qmldir
}

DISTFILES += \
    $$PWD/Screens/Init.qml

