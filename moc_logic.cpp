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
    QByteArrayData data[26];
    char stringdata0[220];
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
QT_MOC_LITERAL(4, 29, 8), // "hasError"
QT_MOC_LITERAL(5, 38, 12), // "getScoreList"
QT_MOC_LITERAL(6, 51, 4), // "list"
QT_MOC_LITERAL(7, 56, 14), // "startRecording"
QT_MOC_LITERAL(8, 71, 13), // "stopRecording"
QT_MOC_LITERAL(9, 85, 4), // "mode"
QT_MOC_LITERAL(10, 90, 4), // "type"
QT_MOC_LITERAL(11, 95, 6), // "config"
QT_MOC_LITERAL(12, 102, 5), // "speed"
QT_MOC_LITERAL(13, 108, 6), // "compas"
QT_MOC_LITERAL(14, 115, 9), // "calibrate"
QT_MOC_LITERAL(15, 125, 4), // "time"
QT_MOC_LITERAL(16, 130, 11), // "setPractice"
QT_MOC_LITERAL(17, 142, 2), // "id"
QT_MOC_LITERAL(18, 145, 9), // "metronome"
QT_MOC_LITERAL(19, 155, 11), // "detectPulse"
QT_MOC_LITERAL(20, 167, 7), // "savePDF"
QT_MOC_LITERAL(21, 175, 4), // "name"
QT_MOC_LITERAL(22, 180, 11), // "saveExample"
QT_MOC_LITERAL(23, 192, 8), // "comments"
QT_MOC_LITERAL(24, 201, 6), // "folder"
QT_MOC_LITERAL(25, 208, 11) // "deleteScore"

    },
    "Musvi_Logic\0sendPulse\0\0pulse\0hasError\0"
    "getScoreList\0list\0startRecording\0"
    "stopRecording\0mode\0type\0config\0speed\0"
    "compas\0calibrate\0time\0setPractice\0id\0"
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
       1,    2,   79,    2, 0x06 /* Public */,
       5,    1,   84,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       7,    0,   87,    2, 0x0a /* Public */,
       8,    0,   88,    2, 0x0a /* Public */,
       9,    1,   89,    2, 0x0a /* Public */,
      11,    2,   92,    2, 0x0a /* Public */,
      14,    1,   97,    2, 0x0a /* Public */,
      16,    1,  100,    2, 0x0a /* Public */,
      18,    0,  103,    2, 0x0a /* Public */,
      19,    1,  104,    2, 0x0a /* Public */,
      20,    1,  107,    2, 0x0a /* Public */,
      22,    3,  110,    2, 0x0a /* Public */,
      25,    1,  117,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::Int,    3,    4,
    QMetaType::Void, QMetaType::QVariantList,    6,

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
        case 0: _t->sendPulse((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 1: _t->getScoreList((*reinterpret_cast< QVariantList(*)>(_a[1]))); break;
        case 2: _t->startRecording(); break;
        case 3: _t->stopRecording(); break;
        case 4: _t->mode((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 5: _t->config((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 6: _t->calibrate((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 7: _t->setPractice((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 8: _t->metronome(); break;
        case 9: _t->detectPulse((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 10: _t->savePDF((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 11: _t->saveExample((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 12: _t->deleteScore((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            typedef void (Musvi_Logic::*_t)(QString , int );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Musvi_Logic::sendPulse)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (Musvi_Logic::*_t)(QVariantList );
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
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 13;
    }
    return _id;
}

// SIGNAL 0
void Musvi_Logic::sendPulse(QString _t1, int _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void Musvi_Logic::getScoreList(QVariantList _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
