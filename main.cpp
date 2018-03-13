#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDebug>
#include <logic.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    //engine.addImportPath("qml/");

    /* SOUND PROCESS */
    //transcriptor->loadData();
    engine.load(QUrl("qml/main.qml"));
    Musvi_Logic *logic = new Musvi_Logic();
    engine.rootContext()->setContextProperty("Logic", logic);


    //iniciar algo si hay que iniciar en el c++
    return app.exec();
}
