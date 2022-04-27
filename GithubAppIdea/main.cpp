#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "githubrequesthandler.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    GithubRequestHandler *test = new GithubRequestHandler();

    QQmlApplicationEngine engine;
    const QUrl url(u"qrc:/GithubAppIdea/main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
