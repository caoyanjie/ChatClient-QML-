#include "network.h"
#include <QTextStream>
#include <QDebug>
#include <QTimer>
#include <QNetworkInterface>

Network::Network(QObject *parent) : QObject(parent)
    ,udpPort(45454)
{
    myIp = "<ip:" + QNetworkInterface::allAddresses().at(1).toString() + ">";       //获得本机 ip
    udpManager = new QUdpSocket(this);                                              //初始化 UDP
    udpManager->bind(udpPort, QUdpSocket::ShareAddress);                            //绑定端口号
    connect(udpManager, SIGNAL(readyRead()), this, SLOT(receiveUdpDatagram()));     //关联UDP数据接收数据
}

Network::~Network()
{
}

//设置用户名
void Network::setUserName(QString name)
{
    myUserName = "<user:" + name + ">";
    sendUdp("I'm in!");                //发送广播，通知上线
}

//发送 UDP 消息
void Network::sendUdp(QString chatContent, QString destinationIp)
{
    //如果省略第二个参数，则发广播
    QHostAddress destinationAddress;
    if (destinationIp.isEmpty())
    {
        destinationAddress = QHostAddress::Broadcast;
    }
    else
    {
        destinationAddress.setAddress(destinationIp);
    }
    //构造数据
    QString content = myIp + myUserName + chatContent;
    QByteArray datagram;
    datagram.append(content);
    //发送数据
    udpManager->writeDatagram(datagram.data(), datagram.size(), destinationAddress, udpPort);
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
