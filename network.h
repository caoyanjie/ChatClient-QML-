#ifndef NETWORK_H
#define NETWORK_H

#include <QObject>

#include <QUdpSocket>

//枚举：发送数据的类型
typedef enum MessageType {
    Message,
    NewParticipant,
    ParticipantLeft,
    FileName,
    Refuse
}MessageType;

class Network : public QObject
{
    Q_OBJECT
public:
    explicit Network(QObject *parent = 0);
    ~Network();

private:
    QUdpSocket *udpManager;
    QString myUserName;
    int udpPort;
    QString myIp;

signals:
    void receivedMessage(QStringList message);

public slots:
    void setUserName(QString userName);
    void sendUdp(int messageType, QString chatContent = "", QString destinationIp = "");
    void receiveUdp();
    void sendTcp();
    void receiveTcp();
    void receiveUdpDatagram();

};

#endif // NETWORK_H
