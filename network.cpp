#include "network.h"
#include <QTextStream>
#include <QDebug>
#include <QTimer>
#include <QNetworkInterface>
#include <QDateTime>

Network::Network(QObject *parent) : QObject(parent)
    ,udpPort(45454)
{
    myIp = QNetworkInterface::allAddresses().at(1).toString();                      //获得本机 ip
    udpManager = new QUdpSocket(this);                                              //初始化 UDP
    udpManager->bind(udpPort, QUdpSocket::ShareAddress);                            //绑定端口号
    connect(udpManager, SIGNAL(readyRead()), this, SLOT(receiveUdpDatagram()));     //关联UDP数据接收数据
}

Network::~Network()
{
}

//设置用户名
void Network::setUserName(QString userName)
{
    myUserName = userName;
    sendUdp(NewParticipant);                //发送广播，通知上线
}

//发送 UDP 消息
void Network::sendUdp(int messageType, QString chatContent, QString destinationIp)
{
    //如果省略 IP 地址参数，则发广播
    QHostAddress destinationAddress;
    if (destinationIp.isEmpty())
    {
        destinationAddress = QHostAddress::Broadcast;
        qDebug() << "现在发送的是广播" << chatContent;
    }
    else
    {
        destinationAddress.setAddress(destinationIp);
        qDebug() << tr("现在发送的是P2P<%1>: %2").arg(destinationIp).arg(chatContent);
    }

    //构造数据[类型，IP，字符串]
    QByteArray datagram;
    QDataStream out(&datagram, QIODevice::WriteOnly);
    out << messageType << myIp << myUserName << chatContent;

    udpManager->writeDatagram(datagram, datagram.length(), destinationAddress, udpPort);
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
    while (udpManager->hasPendingDatagrams())
    {
        int messageType;
        QString ip;
        QString userName;
        QString chatContent;

        QByteArray datagram;
        datagram.resize(udpManager->pendingDatagramSize());
        udpManager->readDatagram(datagram.data(), datagram.size());

        QDataStream in(&datagram, QIODevice::ReadOnly);
        in >> messageType >> ip >> userName >> chatContent;

        QString time = QDateTime::currentDateTime().toString("yyyy-MM-dd hh:mm:ss");

        QStringList udpData;
        udpData.append(tr("%1").arg(messageType));      //类型
        udpData.append(ip);                             //ip
        udpData.append(userName);                       //userName
        udpData.append(chatContent);                    //chatContent
        udpData.append(time);                           //系统时间

        emit receivedMessage(udpData);                   //发送 [类型 + ip + userName + chatContent] 信号
    }    
}
