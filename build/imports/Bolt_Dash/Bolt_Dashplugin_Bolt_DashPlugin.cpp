// This file is autogenerated by CMake. Do not edit.

#include <QtQml/qqmlextensionplugin.h>

extern void qml_register_types_Bolt_Dash();
Q_GHS_KEEP_REFERENCE(qml_register_types_Bolt_Dash)

class Bolt_DashPlugin : public QQmlEngineExtensionPlugin
{
    Q_OBJECT
    Q_PLUGIN_METADATA(IID QQmlEngineExtensionInterface_iid)

public:
    Bolt_DashPlugin(QObject *parent = nullptr) : QQmlEngineExtensionPlugin(parent)
    {
        volatile auto registration = &qml_register_types_Bolt_Dash;
        Q_UNUSED(registration)
    }
};



#include "Bolt_Dashplugin_Bolt_DashPlugin.moc"
