#include <QApplication>
#include <QQmlApplicationEngine>

#include <QtQml>
#include "network.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<Network>("QtCPlusPlus.Network", 1, 0, "Network");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
