#ifndef NETWORK_H
#define NETWORK_H

#include <QObject>

class Network : public QObject
{
    Q_OBJECT
public:
    explicit Network(QObject *parent = 0);
    ~Network();

signals:

public slots:
    void initNetwork();
};

#endif // NETWORK_H
