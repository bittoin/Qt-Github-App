#include "githubrequesthandler.h"
#include <QDebug>
#include <QJsonDocument>
#include <QJsonValue>
#include <QJsonObject>
#include <QJsonArray>

GithubRequestHandler::GithubRequestHandler(QObject *parent)
    : QObject{parent}
{
    QNetworkRequest request;
    //request.setUrl(QUrl("https://www.githubstatus.com/"));
    request.setUrl(QUrl("https://www.githubstatus.com/api/v2/components.json"));
    //request.setRawHeader("User-Agent", "MyOwnBrowser 1.0");

    QNetworkAccessManager *manager = new QNetworkAccessManager(this);
    connect(manager, &QNetworkAccessManager::finished,
            this, &GithubRequestHandler::replyFinished);

    reply = manager->get(request);

    //connect(reply, &QIODevice::readyRead, this, &GithubRequestHandler::readyRead);
}

void GithubRequestHandler::replyFinished(QNetworkReply *reply)
{
    QByteArray buffer = reply->readAll();
//       qDebug() << buffer;
    QJsonDocument jsonDoc(QJsonDocument::fromJson(buffer));
    QJsonObject jsonReply = jsonDoc.object();
    qDebug() << jsonReply.keys();
    QJsonObject page = jsonReply["page"].toObject();
    QJsonArray components = jsonReply["components"].toArray();

    for (auto item: components){
        qDebug() << item.toObject()["name"].toString();
    }
}

void GithubRequestHandler::readyRead()
{
    QJsonDocument document = QJsonDocument::fromJson(reply->readAll());
    qDebug() << document.toJson();
}
