#include <QApplication>
#include <QQmlApplicationEngine>

#include <QtQml>
#include "network.h"
#include "p2p.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    qmlRegisterType<Network>("QtCPlusPlus.Network", 1, 0, "Network");
    qmlRegisterType<P2P>("QtCPlusPlus.P2P", 1, 0, "P2P");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
