#include "network.h"
#include <QDebug>

Network::Network(QObject *parent) : QObject(parent)
{

}

Network::~Network()
{
}

void Network::initNetwork()
{
    qDebug() << "已进入C++类进行网络初始化";
}

