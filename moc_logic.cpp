/****************************************************************************
** Meta object code from reading C++ file 'logic.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.9.4)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "logic.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'logic.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.9.4. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Musvi_Logic_t {
    QByteArrayData data[26];
    char stringdata0[231];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Musvi_Logic_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Musvi_Logic_t qt_meta_stringdata_Musvi_Logic = {
    {
QT_MOC_LITERAL(0, 0, 11), // "Musvi_Logic"
QT_MOC_LITERAL(1, 12, 9), // "sendPulse"
QT_MOC_LITERAL(2, 22, 0), // ""
QT_MOC_LITERAL(3, 23, 5), // "pulse"
QT_MOC_LITERAL(4, 29, 12), // "getScoreList"
QT_MOC_LITERAL(5, 42, 18), // "QList<QJsonObject>"
QT_MOC_LITERAL(6, 61, 5), // "jsons"
QT_MOC_LITERAL(7, 67, 14), // "startRecording"
QT_MOC_LITERAL(8, 82, 13), // "stopRecording"
QT_MOC_LITERAL(9, 96, 4), // "mode"
QT_MOC_LITERAL(10, 101, 4), // "type"
QT_MOC_LITERAL(11, 106, 6), // "config"
QT_MOC_LITERAL(12, 113, 5), // "speed"
QT_MOC_LITERAL(13, 119, 6), // "compas"
QT_MOC_LITERAL(14, 126, 9), // "calibrate"
QT_MOC_LITERAL(15, 136, 4), // "time"
QT_MOC_LITERAL(16, 141, 11), // "SetPractice"
QT_MOC_LITERAL(17, 153, 2), // "id"
QT_MOC_LITERAL(18, 156, 9), // "metronome"
QT_MOC_LITERAL(19, 166, 11), // "detectPulse"
QT_MOC_LITERAL(20, 178, 7), // "savePDF"
QT_MOC_LITERAL(21, 186, 4), // "name"
QT_MOC_LITERAL(22, 191, 11), // "saveExample"
QT_MOC_LITERAL(23, 203, 8), // "comments"
QT_MOC_LITERAL(24, 212, 6), // "folder"
QT_MOC_LITERAL(25, 219, 11) // "deleteScore"

    },
    "Musvi_Logic\0sendPulse\0\0pulse\0getScoreList\0"
    "QList<QJsonObject>\0jsons\0startRecording\0"
    "stopRecording\0mode\0type\0config\0speed\0"
    "compas\0calibrate\0time\0SetPractice\0id\0"
    "metronome\0detectPulse\0savePDF\0name\0"
    "saveExample\0comments\0folder\0deleteScore"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Musvi_Logic[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      13,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   79,    2, 0x06 /* Public */,
       4,    1,   82,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       7,    0,   85,    2, 0x0a /* Public */,
       8,    0,   86,    2, 0x0a /* Public */,
       9,    1,   87,    2, 0x0a /* Public */,
      11,    2,   90,    2, 0x0a /* Public */,
      14,    1,   95,    2, 0x0a /* Public */,
      16,    1,   98,    2, 0x0a /* Public */,
      18,    0,  101,    2, 0x0a /* Public */,
      19,    1,  102,    2, 0x0a /* Public */,
      20,    1,  105,    2, 0x0a /* Public */,
      22,    3,  108,    2, 0x0a /* Public */,
      25,    1,  115,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, 0x80000000 | 5,    6,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   10,
    QMetaType::Void, QMetaType::Int, QMetaType::QString,   12,   13,
    QMetaType::Void, QMetaType::Int,   15,
    QMetaType::Void, QMetaType::Int,   17,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,   21,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,   21,   23,   24,
    QMetaType::Void, QMetaType::Int,   17,

       0        // eod
};

void Musvi_Logic::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Musvi_Logic *_t = static_cast<Musvi_Logic *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sendPulse((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->getScoreList((*reinterpret_cast< QList<QJsonObject>(*)>(_a[1]))); break;
        case 2: _t->startRecording(); break;
        case 3: _t->stopRecording(); break;
        case 4: _t->mode((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->config((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 6: _t->calibrate((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 7: _t->SetPractice((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 8: _t->metronome(); break;
        case 9: _t->detectPulse((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 10: _t->savePDF((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 11: _t->saveExample((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 12: _t->deleteScore((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 1:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QJsonObject> >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            typedef void (Musvi_Logic::*_t)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Musvi_Logic::sendPulse)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (Musvi_Logic::*_t)(QList<QJsonObject> );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Musvi_Logic::getScoreList)) {
                *result = 1;
                return;
            }
        }
    }
}

const QMetaObject Musvi_Logic::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_Musvi_Logic.data,
      qt_meta_data_Musvi_Logic,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *Musvi_Logic::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Musvi_Logic::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Musvi_Logic.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Musvi_Logic::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 13)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 13;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 13)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 13;
    }
    return _id;
}

// SIGNAL 0
void Musvi_Logic::sendPulse(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void Musvi_Logic::getScoreList(QList<QJsonObject> _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE