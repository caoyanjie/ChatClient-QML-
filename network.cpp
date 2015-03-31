#include "network.h"
#include <QTextStream>
#include <QDebug>
#include <QTimer>
#include <QNetworkInterface>

Network::Network(QObject *parent) : QObject(parent)
    ,udpPort(45454)
{
    ip = "<ip:" + QNetworkInterface::allAddresses().at(1).toString() + ">";         //获得本机 ip
    udpManager = new QUdpSocket(this);                                              //初始化 UDP
    udpManager->bind(udpPort, QUdpSocket::ShareAddress);                            //绑定端口号
    connect(udpManager, SIGNAL(readyRead()), this, SLOT(receiveUdpDatagram()));     //关联UDP数据接收数据
}

Network::~Network()
{
}

//UDP 广播
int Network::udpBroadcast(QString senderData)
{
    QString content = ip + userName + senderData;
    QByteArray datagram;
    datagram.append(content);
    return udpManager->writeDatagram(datagram.data(), datagram.size(), QHostAddress::Broadcast, udpPort);
}

//设置用户名
void Network::setUserName(QString name)
{
    userName = "<user:" + name + ">";
    udpBroadcast("I'm in!");                //通知上线
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
void Network::receiveUdpDatagram()
{
    /*
    qDebug() << "peerAddress: " << udpManager->peerAddress();
    qDebug() << "peerName: " << udpManager->peerName();
    qDebug() << "peerPort: " << udpManager->peerPort();

    qDebug() << "localAddress: " << udpManager->localAddress();
    qDebug() << "localPort: " << udpManager->localPort();
    */

    QString stringReceived;
    QStringList split;              //分离 ip 和 字符串

    while (udpManager->hasPendingDatagrams())
    {
        QByteArray datagram;
        datagram.resize(udpManager->pendingDatagramSize());
        udpManager->readDatagram(datagram.data(), datagram.size());
        stringReceived.append(datagram);
    }

    int indexIp = stringReceived.indexOf(">");
    int indexUser = stringReceived.indexOf(">", indexIp+1);
    split.append(stringReceived.mid(4, indexIp-4));
    split.append(stringReceived.mid(indexIp+7, indexUser-indexIp-7));
    split.append(stringReceived.mid(indexUser+1));
    emit receivedMessage(split);                   //发送 ip + userName + string 信号
}
