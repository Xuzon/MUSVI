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
    QByteArrayData data[20];
    char stringdata0[165];
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
QT_MOC_LITERAL(4, 29, 14), // "startRecording"
QT_MOC_LITERAL(5, 44, 13), // "stopRecording"
QT_MOC_LITERAL(6, 58, 4), // "mode"
QT_MOC_LITERAL(7, 63, 4), // "type"
QT_MOC_LITERAL(8, 68, 6), // "config"
QT_MOC_LITERAL(9, 75, 5), // "speed"
QT_MOC_LITERAL(10, 81, 6), // "compas"
QT_MOC_LITERAL(11, 88, 9), // "calibrate"
QT_MOC_LITERAL(12, 98, 4), // "time"
QT_MOC_LITERAL(13, 103, 11), // "SetPractice"
QT_MOC_LITERAL(14, 115, 2), // "id"
QT_MOC_LITERAL(15, 118, 9), // "metronome"
QT_MOC_LITERAL(16, 128, 11), // "detectPulse"
QT_MOC_LITERAL(17, 140, 7), // "savePDF"
QT_MOC_LITERAL(18, 148, 4), // "name"
QT_MOC_LITERAL(19, 153, 11) // "deleteScore"

    },
    "Musvi_Logic\0sendPulse\0\0pulse\0"
    "startRecording\0stopRecording\0mode\0"
    "type\0config\0speed\0compas\0calibrate\0"
    "time\0SetPractice\0id\0metronome\0detectPulse\0"
    "savePDF\0name\0deleteScore"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Musvi_Logic[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      11,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   69,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    0,   72,    2, 0x0a /* Public */,
       5,    0,   73,    2, 0x0a /* Public */,
       6,    1,   74,    2, 0x0a /* Public */,
       8,    2,   77,    2, 0x0a /* Public */,
      11,    1,   82,    2, 0x0a /* Public */,
      13,    1,   85,    2, 0x0a /* Public */,
      15,    0,   88,    2, 0x0a /* Public */,
      16,    1,   89,    2, 0x0a /* Public */,
      17,    1,   92,    2, 0x0a /* Public */,
      19,    1,   95,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    7,
    QMetaType::Void, QMetaType::Int, QMetaType::QString,    9,   10,
    QMetaType::Void, QMetaType::Int,   12,
    QMetaType::Void, QMetaType::Int,   14,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,   18,
    QMetaType::Void, QMetaType::Int,   14,

       0        // eod
};

void Musvi_Logic::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Musvi_Logic *_t = static_cast<Musvi_Logic *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sendPulse((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->startRecording(); break;
        case 2: _t->stopRecording(); break;
        case 3: _t->mode((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->config((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 5: _t->calibrate((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: _t->SetPractice((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 7: _t->metronome(); break;
        case 8: _t->detectPulse((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 9: _t->savePDF((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 10: _t->deleteScore((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
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
        if (_id < 11)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 11;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 11)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 11;
    }
    return _id;
}

// SIGNAL 0
void Musvi_Logic::sendPulse(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
