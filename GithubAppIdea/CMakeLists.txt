cmake_minimum_required(VERSION 3.16)

project(GithubAppIdea VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#set(OPENSSL_ROOT_DIR "/home/mateus/Qt/Tools/OpenSSL/")
#set(OPENSSL_ROOT_DIR "/home/mateus/Android/Sdk/android_openssl/latest/x86_64/")
#include_directories(/home/mateus/Qt/Tools/OpenSSL/src/)

if (ANDROID)
    include(/home/mateus/Android/Sdk/android_openssl/CMakeLists.txt)
endif()

#find_package(OpenSSL REQUIRED)
find_package(Qt6 6.2 COMPONENTS Quick Network Core REQUIRED)

#qt_add_resources(GithubAppIdea assets.qrc)

qt_add_executable(appGithubAppIdea
    assets.qrc
    githubrequesthandler.cpp
    main.cpp
)

qt_add_qml_module(appGithubAppIdea
    URI GithubAppIdea
    VERSION 1.0
    QML_FILES main.qml 
)

set_target_properties(appGithubAppIdea PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER my.example.com
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_compile_definitions(appGithubAppIdea
    PRIVATE $<$<OR:$<CONFIG:Debug>,$<CONFIG:RelWithDebInfo>>:QT_QML_DEBUG>)
target_link_libraries(appGithubAppIdea
    PRIVATE Qt6::Quick Qt6::Network
)#OpenSSL::SSL)
