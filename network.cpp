#include "network.h"
#include <QTextStream>
#include <QDebug>

Network::Network(QObject *parent) : QObject(parent)
{
    udpManager = new QUdpSocket(this);
    udpManager->bind(45454, QUdpSocket::ShareAddress);
    connect(udpManager, SIGNAL(readyRead()), this, SLOT(receiveUdpDatagram()));
}

Network::~Network()
{
}

//初始化网络
void Network::initNetwork()
{
    qDebug() << "已进入C++类进行网络初始化";
}

//UDP 广播
int Network::udpBroadcast(QString senderData)
{
    QByteArray datagram;
    datagram.append(senderData);
    return udpManager->writeDatagram(datagram.data(), datagram.size(), QHostAddress::Broadcast, 45454);
}

void Network::sendUdp()
{

}

void Network::receiveUdp()
{

}

void Network::sendTcp()
{

}

void Network::receiveTcp()
{

}

//接收 UDP 数据
QString Network::receiveUdpDatagram()
{
    QString stringReceived;
    while (udpManager->hasPendingDatagrams())
    {
        QByteArray datagram;
        datagram.resize(udpManager->pendingDatagramSize());
        udpManager->readDatagram(datagram.data(), datagram.size());
        stringReceived.append(datagram);
    }
    return stringReceived;
}

