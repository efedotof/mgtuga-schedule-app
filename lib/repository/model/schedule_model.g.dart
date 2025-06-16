// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ScheduleModelImpl _$$ScheduleModelImplFromJson(Map<String, dynamic> json) =>
    _$ScheduleModelImpl(
      date: json['date'] as String,
      dayOfWeekString: json['dayOfWeekString'] as String,
      beginLesson: json['beginLesson'] as String,
      endLesson: json['endLesson'] as String,
      discipline: json['discipline'] as String,
      kindOfWork: json['kindOfWork'] as String,
      lecturer: json['lecturer'] as String,
      lecturer_title: json['lecturer_title'] as String,
      auditorium: json['auditorium'] as String,
      building: json['building'] as String,
      lessonNumberStart: (json['lessonNumberStart'] as num).toInt(),
      lessonNumberEnd: (json['lessonNumberEnd'] as num).toInt(),
    );

Map<String, dynamic> _$$ScheduleModelImplToJson(_$ScheduleModelImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'dayOfWeekString': instance.dayOfWeekString,
      'beginLesson': instance.beginLesson,
      'endLesson': instance.endLesson,
      'discipline': instance.discipline,
      'kindOfWork': instance.kindOfWork,
      'lecturer': instance.lecturer,
      'lecturer_title': instance.lecturer_title,
      'auditorium': instance.auditorium,
      'building': instance.building,
      'lessonNumberStart': instance.lessonNumberStart,
      'lessonNumberEnd': instance.lessonNumberEnd,
    };
