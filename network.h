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

signals:

public slots:
    void initNetwork();
    int udpBroadcast(QString senderData);
    void sendUdp();
    void receiveUdp();
    void sendTcp();
    void receiveTcp();
    QString receiveUdpDatagram();
};

#endif // NETWORK_H
