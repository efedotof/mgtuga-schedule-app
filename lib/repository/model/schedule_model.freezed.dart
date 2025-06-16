// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ScheduleModel _$ScheduleModelFromJson(Map<String, dynamic> json) {
  return _ScheduleModel.fromJson(json);
}

/// @nodoc
mixin _$ScheduleModel {
  String get date => throw _privateConstructorUsedError;
  String get dayOfWeekString => throw _privateConstructorUsedError;
  String get beginLesson => throw _privateConstructorUsedError;
  String get endLesson => throw _privateConstructorUsedError;
  String get discipline => throw _privateConstructorUsedError;
  String get kindOfWork => throw _privateConstructorUsedError;
  String get lecturer =>
      throw _privateConstructorUsedError; // ignore: non_constant_identifier_names
  String get lecturer_title => throw _privateConstructorUsedError;
  String get auditorium => throw _privateConstructorUsedError;
  String get building => throw _privateConstructorUsedError;
  int get lessonNumberStart => throw _privateConstructorUsedError;
  int get lessonNumberEnd => throw _privateConstructorUsedError;

  /// Serializes this ScheduleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ScheduleModelCopyWith<ScheduleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScheduleModelCopyWith<$Res> {
  factory $ScheduleModelCopyWith(
    ScheduleModel value,
    $Res Function(ScheduleModel) then,
  ) = _$ScheduleModelCopyWithImpl<$Res, ScheduleModel>;
  @useResult
  $Res call({
    String date,
    String dayOfWeekString,
    String beginLesson,
    String endLesson,
    String discipline,
    String kindOfWork,
    String lecturer,
    String lecturer_title,
    String auditorium,
    String building,
    int lessonNumberStart,
    int lessonNumberEnd,
  });
}

/// @nodoc
class _$ScheduleModelCopyWithImpl<$Res, $Val extends ScheduleModel>
    implements $ScheduleModelCopyWith<$Res> {
  _$ScheduleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dayOfWeekString = null,
    Object? beginLesson = null,
    Object? endLesson = null,
    Object? discipline = null,
    Object? kindOfWork = null,
    Object? lecturer = null,
    Object? lecturer_title = null,
    Object? auditorium = null,
    Object? building = null,
    Object? lessonNumberStart = null,
    Object? lessonNumberEnd = null,
  }) {
    return _then(
      _value.copyWith(
            date:
                null == date
                    ? _value.date
                    : date // ignore: cast_nullable_to_non_nullable
                        as String,
            dayOfWeekString:
                null == dayOfWeekString
                    ? _value.dayOfWeekString
                    : dayOfWeekString // ignore: cast_nullable_to_non_nullable
                        as String,
            beginLesson:
                null == beginLesson
                    ? _value.beginLesson
                    : beginLesson // ignore: cast_nullable_to_non_nullable
                        as String,
            endLesson:
                null == endLesson
                    ? _value.endLesson
                    : endLesson // ignore: cast_nullable_to_non_nullable
                        as String,
            discipline:
                null == discipline
                    ? _value.discipline
                    : discipline // ignore: cast_nullable_to_non_nullable
                        as String,
            kindOfWork:
                null == kindOfWork
                    ? _value.kindOfWork
                    : kindOfWork // ignore: cast_nullable_to_non_nullable
                        as String,
            lecturer:
                null == lecturer
                    ? _value.lecturer
                    : lecturer // ignore: cast_nullable_to_non_nullable
                        as String,
            lecturer_title:
                null == lecturer_title
                    ? _value.lecturer_title
                    : lecturer_title // ignore: cast_nullable_to_non_nullable
                        as String,
            auditorium:
                null == auditorium
                    ? _value.auditorium
                    : auditorium // ignore: cast_nullable_to_non_nullable
                        as String,
            building:
                null == building
                    ? _value.building
                    : building // ignore: cast_nullable_to_non_nullable
                        as String,
            lessonNumberStart:
                null == lessonNumberStart
                    ? _value.lessonNumberStart
                    : lessonNumberStart // ignore: cast_nullable_to_non_nullable
                        as int,
            lessonNumberEnd:
                null == lessonNumberEnd
                    ? _value.lessonNumberEnd
                    : lessonNumberEnd // ignore: cast_nullable_to_non_nullable
                        as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ScheduleModelImplCopyWith<$Res>
    implements $ScheduleModelCopyWith<$Res> {
  factory _$$ScheduleModelImplCopyWith(
    _$ScheduleModelImpl value,
    $Res Function(_$ScheduleModelImpl) then,
  ) = __$$ScheduleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String date,
    String dayOfWeekString,
    String beginLesson,
    String endLesson,
    String discipline,
    String kindOfWork,
    String lecturer,
    String lecturer_title,
    String auditorium,
    String building,
    int lessonNumberStart,
    int lessonNumberEnd,
  });
}

/// @nodoc
class __$$ScheduleModelImplCopyWithImpl<$Res>
    extends _$ScheduleModelCopyWithImpl<$Res, _$ScheduleModelImpl>
    implements _$$ScheduleModelImplCopyWith<$Res> {
  __$$ScheduleModelImplCopyWithImpl(
    _$ScheduleModelImpl _value,
    $Res Function(_$ScheduleModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? dayOfWeekString = null,
    Object? beginLesson = null,
    Object? endLesson = null,
    Object? discipline = null,
    Object? kindOfWork = null,
    Object? lecturer = null,
    Object? lecturer_title = null,
    Object? auditorium = null,
    Object? building = null,
    Object? lessonNumberStart = null,
    Object? lessonNumberEnd = null,
  }) {
    return _then(
      _$ScheduleModelImpl(
        date:
            null == date
                ? _value.date
                : date // ignore: cast_nullable_to_non_nullable
                    as String,
        dayOfWeekString:
            null == dayOfWeekString
                ? _value.dayOfWeekString
                : dayOfWeekString // ignore: cast_nullable_to_non_nullable
                    as String,
        beginLesson:
            null == beginLesson
                ? _value.beginLesson
                : beginLesson // ignore: cast_nullable_to_non_nullable
                    as String,
        endLesson:
            null == endLesson
                ? _value.endLesson
                : endLesson // ignore: cast_nullable_to_non_nullable
                    as String,
        discipline:
            null == discipline
                ? _value.discipline
                : discipline // ignore: cast_nullable_to_non_nullable
                    as String,
        kindOfWork:
            null == kindOfWork
                ? _value.kindOfWork
                : kindOfWork // ignore: cast_nullable_to_non_nullable
                    as String,
        lecturer:
            null == lecturer
                ? _value.lecturer
                : lecturer // ignore: cast_nullable_to_non_nullable
                    as String,
        lecturer_title:
            null == lecturer_title
                ? _value.lecturer_title
                : lecturer_title // ignore: cast_nullable_to_non_nullable
                    as String,
        auditorium:
            null == auditorium
                ? _value.auditorium
                : auditorium // ignore: cast_nullable_to_non_nullable
                    as String,
        building:
            null == building
                ? _value.building
                : building // ignore: cast_nullable_to_non_nullable
                    as String,
        lessonNumberStart:
            null == lessonNumberStart
                ? _value.lessonNumberStart
                : lessonNumberStart // ignore: cast_nullable_to_non_nullable
                    as int,
        lessonNumberEnd:
            null == lessonNumberEnd
                ? _value.lessonNumberEnd
                : lessonNumberEnd // ignore: cast_nullable_to_non_nullable
                    as int,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ScheduleModelImpl implements _ScheduleModel {
  const _$ScheduleModelImpl({
    required this.date,
    required this.dayOfWeekString,
    required this.beginLesson,
    required this.endLesson,
    required this.discipline,
    required this.kindOfWork,
    required this.lecturer,
    required this.lecturer_title,
    required this.auditorium,
    required this.building,
    required this.lessonNumberStart,
    required this.lessonNumberEnd,
  });

  factory _$ScheduleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ScheduleModelImplFromJson(json);

  @override
  final String date;
  @override
  final String dayOfWeekString;
  @override
  final String beginLesson;
  @override
  final String endLesson;
  @override
  final String discipline;
  @override
  final String kindOfWork;
  @override
  final String lecturer;
  // ignore: non_constant_identifier_names
  @override
  final String lecturer_title;
  @override
  final String auditorium;
  @override
  final String building;
  @override
  final int lessonNumberStart;
  @override
  final int lessonNumberEnd;

  @override
  String toString() {
    return 'ScheduleModel(date: $date, dayOfWeekString: $dayOfWeekString, beginLesson: $beginLesson, endLesson: $endLesson, discipline: $discipline, kindOfWork: $kindOfWork, lecturer: $lecturer, lecturer_title: $lecturer_title, auditorium: $auditorium, building: $building, lessonNumberStart: $lessonNumberStart, lessonNumberEnd: $lessonNumberEnd)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ScheduleModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dayOfWeekString, dayOfWeekString) ||
                other.dayOfWeekString == dayOfWeekString) &&
            (identical(other.beginLesson, beginLesson) ||
                other.beginLesson == beginLesson) &&
            (identical(other.endLesson, endLesson) ||
                other.endLesson == endLesson) &&
            (identical(other.discipline, discipline) ||
                other.discipline == discipline) &&
            (identical(other.kindOfWork, kindOfWork) ||
                other.kindOfWork == kindOfWork) &&
            (identical(other.lecturer, lecturer) ||
                other.lecturer == lecturer) &&
            (identical(other.lecturer_title, lecturer_title) ||
                other.lecturer_title == lecturer_title) &&
            (identical(other.auditorium, auditorium) ||
                other.auditorium == auditorium) &&
            (identical(other.building, building) ||
                other.building == building) &&
            (identical(other.lessonNumberStart, lessonNumberStart) ||
                other.lessonNumberStart == lessonNumberStart) &&
            (identical(other.lessonNumberEnd, lessonNumberEnd) ||
                other.lessonNumberEnd == lessonNumberEnd));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    date,
    dayOfWeekString,
    beginLesson,
    endLesson,
    discipline,
    kindOfWork,
    lecturer,
    lecturer_title,
    auditorium,
    building,
    lessonNumberStart,
    lessonNumberEnd,
  );

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      __$$ScheduleModelImplCopyWithImpl<_$ScheduleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ScheduleModelImplToJson(this);
  }
}

abstract class _ScheduleModel implements ScheduleModel {
  const factory _ScheduleModel({
    required final String date,
    required final String dayOfWeekString,
    required final String beginLesson,
    required final String endLesson,
    required final String discipline,
    required final String kindOfWork,
    required final String lecturer,
    required final String lecturer_title,
    required final String auditorium,
    required final String building,
    required final int lessonNumberStart,
    required final int lessonNumberEnd,
  }) = _$ScheduleModelImpl;

  factory _ScheduleModel.fromJson(Map<String, dynamic> json) =
      _$ScheduleModelImpl.fromJson;

  @override
  String get date;
  @override
  String get dayOfWeekString;
  @override
  String get beginLesson;
  @override
  String get endLesson;
  @override
  String get discipline;
  @override
  String get kindOfWork;
  @override
  String get lecturer; // ignore: non_constant_identifier_names
  @override
  String get lecturer_title;
  @override
  String get auditorium;
  @override
  String get building;
  @override
  int get lessonNumberStart;
  @override
  int get lessonNumberEnd;

  /// Create a copy of ScheduleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ScheduleModelImplCopyWith<_$ScheduleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
