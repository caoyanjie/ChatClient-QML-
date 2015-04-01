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
    QString myUserName;
    int udpPort;
    QString myIp;

signals:
    void receivedMessage(QStringList message);

public slots:
    void setUserName(QString name);
    void sendUdp(QString chatContent, QString destinationIp = "");
    void receiveUdp();
    void sendTcp();
    void receiveTcp();
    void receiveUdpDatagram();

};

#endif // NETWORK_H
