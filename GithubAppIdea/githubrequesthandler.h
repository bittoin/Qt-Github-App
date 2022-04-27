#ifndef GITHUBREQUESTHANDLER_H
#define GITHUBREQUESTHANDLER_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QNetworkReply>
#include <QUrl>

class GithubRequestHandler : public QObject
{
    Q_OBJECT
public:
    explicit GithubRequestHandler(QObject *parent = nullptr);

private slots:
    void replyFinished(QNetworkReply *reply);
    void readyRead();

signals:

private:
    QUrl m_githubStatusURL;
    QNetworkReply *reply;
};

#endif // GITHUBREQUESTHANDLER_H
