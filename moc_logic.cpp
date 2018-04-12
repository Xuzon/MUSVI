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
    QByteArrayData data[27];
    char stringdata0[244];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Musvi_Logic_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Musvi_Logic_t qt_meta_stringdata_Musvi_Logic = {
    {
QT_MOC_LITERAL(0, 0, 11), // "Musvi_Logic"
QT_MOC_LITERAL(1, 12, 15), // "sendPulseArtist"
QT_MOC_LITERAL(2, 28, 0), // ""
QT_MOC_LITERAL(3, 29, 5), // "pulse"
QT_MOC_LITERAL(4, 35, 17), // "sendPulsePractice"
QT_MOC_LITERAL(5, 53, 8), // "hasError"
QT_MOC_LITERAL(6, 62, 12), // "getScoreList"
QT_MOC_LITERAL(7, 75, 4), // "list"
QT_MOC_LITERAL(8, 80, 14), // "startRecording"
QT_MOC_LITERAL(9, 95, 13), // "stopRecording"
QT_MOC_LITERAL(10, 109, 4), // "mode"
QT_MOC_LITERAL(11, 114, 4), // "type"
QT_MOC_LITERAL(12, 119, 6), // "config"
QT_MOC_LITERAL(13, 126, 5), // "speed"
QT_MOC_LITERAL(14, 132, 6), // "compas"
QT_MOC_LITERAL(15, 139, 9), // "calibrate"
QT_MOC_LITERAL(16, 149, 4), // "time"
QT_MOC_LITERAL(17, 154, 11), // "setPractice"
QT_MOC_LITERAL(18, 166, 2), // "id"
QT_MOC_LITERAL(19, 169, 9), // "metronome"
QT_MOC_LITERAL(20, 179, 11), // "detectPulse"
QT_MOC_LITERAL(21, 191, 7), // "savePDF"
QT_MOC_LITERAL(22, 199, 4), // "name"
QT_MOC_LITERAL(23, 204, 11), // "saveExample"
QT_MOC_LITERAL(24, 216, 8), // "comments"
QT_MOC_LITERAL(25, 225, 6), // "folder"
QT_MOC_LITERAL(26, 232, 11) // "deleteScore"

    },
    "Musvi_Logic\0sendPulseArtist\0\0pulse\0"
    "sendPulsePractice\0hasError\0getScoreList\0"
    "list\0startRecording\0stopRecording\0"
    "mode\0type\0config\0speed\0compas\0calibrate\0"
    "time\0setPractice\0id\0metronome\0detectPulse\0"
    "savePDF\0name\0saveExample\0comments\0"
    "folder\0deleteScore"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Musvi_Logic[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      14,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   84,    2, 0x06 /* Public */,
       4,    2,   87,    2, 0x06 /* Public */,
       6,    1,   92,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       8,    0,   95,    2, 0x0a /* Public */,
       9,    0,   96,    2, 0x0a /* Public */,
      10,    1,   97,    2, 0x0a /* Public */,
      12,    2,  100,    2, 0x0a /* Public */,
      15,    1,  105,    2, 0x0a /* Public */,
      17,    1,  108,    2, 0x0a /* Public */,
      19,    0,  111,    2, 0x0a /* Public */,
      20,    1,  112,    2, 0x0a /* Public */,
      21,    1,  115,    2, 0x0a /* Public */,
      23,    3,  118,    2, 0x0a /* Public */,
      26,    1,  125,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString, QMetaType::Int,    3,    5,
    QMetaType::Void, QMetaType::QVariantList,    7,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   11,
    QMetaType::Void, QMetaType::Int, QMetaType::QString,   13,   14,
    QMetaType::Void, QMetaType::Int,   16,
    QMetaType::Void, QMetaType::Int,   18,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,   22,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,   22,   24,   25,
    QMetaType::Void, QMetaType::Int,   18,

       0        // eod
};

void Musvi_Logic::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Musvi_Logic *_t = static_cast<Musvi_Logic *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sendPulseArtist((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->sendPulsePractice((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 2: _t->getScoreList((*reinterpret_cast< QVariantList(*)>(_a[1]))); break;
        case 3: _t->startRecording(); break;
        case 4: _t->stopRecording(); break;
        case 5: _t->mode((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 6: _t->config((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 7: _t->calibrate((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 8: _t->setPractice((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 9: _t->metronome(); break;
        case 10: _t->detectPulse((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 11: _t->savePDF((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 12: _t->saveExample((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3]))); break;
        case 13: _t->deleteScore((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            typedef void (Musvi_Logic::*_t)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Musvi_Logic::sendPulseArtist)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (Musvi_Logic::*_t)(QString , int );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Musvi_Logic::sendPulsePractice)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (Musvi_Logic::*_t)(QVariantList );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Musvi_Logic::getScoreList)) {
                *result = 2;
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
        if (_id < 14)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 14;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 14)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 14;
    }
    return _id;
}

// SIGNAL 0
void Musvi_Logic::sendPulseArtist(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void Musvi_Logic::sendPulsePractice(QString _t1, int _t2)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)), const_cast<void*>(reinterpret_cast<const void*>(&_t2)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void Musvi_Logic::getScoreList(QVariantList _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
