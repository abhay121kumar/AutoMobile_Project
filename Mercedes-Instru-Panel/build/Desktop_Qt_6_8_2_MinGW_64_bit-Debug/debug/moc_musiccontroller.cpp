/****************************************************************************
** Meta object code from reading C++ file 'musiccontroller.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.8.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Controllers/musiccontroller.h"
#include <QtCore/qmetatype.h>

#include <QtCore/qtmochelpers.h>

#include <memory>


#include <QtCore/qxptype_traits.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'musiccontroller.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.8.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
QT_WARNING_DISABLE_GCC("-Wuseless-cast")
namespace {
struct qt_meta_tag_ZN15MusicControllerE_t {};
} // unnamed namespace


#ifdef QT_MOC_HAS_STRINGDATA
static constexpr auto qt_meta_stringdata_ZN15MusicControllerE = QtMocHelpers::stringData(
    "MusicController",
    "playbackStateChanged",
    "",
    "currentTrackChanged",
    "play",
    "pause",
    "stop",
    "togglePlay",
    "next",
    "prev",
    "playTrack",
    "index",
    "trackList",
    "currentTitle",
    "isPlaying"
);
#else  // !QT_MOC_HAS_STRINGDATA
#error "qtmochelpers.h not found or too old."
#endif // !QT_MOC_HAS_STRINGDATA

Q_CONSTINIT static const uint qt_meta_data_ZN15MusicControllerE[] = {

 // content:
      12,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       3,   79, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   68,    2, 0x06,    4 /* Public */,
       3,    0,   69,    2, 0x06,    5 /* Public */,

 // methods: name, argc, parameters, tag, flags, initial metatype offsets
       4,    0,   70,    2, 0x02,    6 /* Public */,
       5,    0,   71,    2, 0x02,    7 /* Public */,
       6,    0,   72,    2, 0x02,    8 /* Public */,
       7,    0,   73,    2, 0x02,    9 /* Public */,
       8,    0,   74,    2, 0x02,   10 /* Public */,
       9,    0,   75,    2, 0x02,   11 /* Public */,
      10,    1,   76,    2, 0x02,   12 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   11,

 // properties: name, type, flags, notifyId, revision
      12, QMetaType::QStringList, 0x00015401, uint(-1), 0,
      13, QMetaType::QString, 0x00015001, uint(1), 0,
      14, QMetaType::Bool, 0x00015001, uint(0), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject MusicController::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_ZN15MusicControllerE.offsetsAndSizes,
    qt_meta_data_ZN15MusicControllerE,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_tag_ZN15MusicControllerE_t,
        // property 'trackList'
        QtPrivate::TypeAndForceComplete<QStringList, std::true_type>,
        // property 'currentTitle'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'isPlaying'
        QtPrivate::TypeAndForceComplete<bool, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<MusicController, std::true_type>,
        // method 'playbackStateChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'currentTrackChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'play'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'pause'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'stop'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'togglePlay'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'next'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'prev'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'playTrack'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<int, std::false_type>
    >,
    nullptr
} };

void MusicController::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    auto *_t = static_cast<MusicController *>(_o);
    if (_c == QMetaObject::InvokeMetaMethod) {
        switch (_id) {
        case 0: _t->playbackStateChanged(); break;
        case 1: _t->currentTrackChanged(); break;
        case 2: _t->play(); break;
        case 3: _t->pause(); break;
        case 4: _t->stop(); break;
        case 5: _t->togglePlay(); break;
        case 6: _t->next(); break;
        case 7: _t->prev(); break;
        case 8: _t->playTrack((*reinterpret_cast< std::add_pointer_t<int>>(_a[1]))); break;
        default: ;
        }
    }
    if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _q_method_type = void (MusicController::*)();
            if (_q_method_type _q_method = &MusicController::playbackStateChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _q_method_type = void (MusicController::*)();
            if (_q_method_type _q_method = &MusicController::currentTrackChanged; *reinterpret_cast<_q_method_type *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
    }
    if (_c == QMetaObject::ReadProperty) {
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QStringList*>(_v) = _t->trackList(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->currentTitle(); break;
        case 2: *reinterpret_cast< bool*>(_v) = _t->isPlaying(); break;
        default: break;
        }
    }
}

const QMetaObject *MusicController::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MusicController::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_ZN15MusicControllerE.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int MusicController::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
    if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 9;
    }
    if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    }
    return _id;
}

// SIGNAL 0
void MusicController::playbackStateChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void MusicController::currentTrackChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}
QT_WARNING_POP
