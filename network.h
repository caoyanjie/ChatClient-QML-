#ifndef NETWORK_H
#define NETWORK_H

#include <QObject>

#include <QUdpSocket>

class Network : public QObject
{
    Q_OBJECT
public:
    explicit Network(QObject *parent = 0);
    ~Network();

private:
    QUdpSocket *udpManager;
    QString userName;
    int udpPort;
    QString ip;

signals:
    void receivedMessage(QStringList message);

public slots:
    int udpBroadcast(QString senderData);
    void setUserName(QString name);
    void sendUdp();
    void receiveUdp();
    void sendTcp();
    void receiveTcp();
    void receiveUdpDatagram();
};

#endif // NETWORK_H
