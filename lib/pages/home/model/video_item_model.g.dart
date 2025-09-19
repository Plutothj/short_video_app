// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoItemModel _$VideoItemModelFromJson(Map<String, dynamic> json) =>
    _VideoItemModel(
      ep: json['ep'] as String,
      coverUrl: json['coverUrl'] as String,
      like: (json['like'] as num).toInt(),
      like_number: (json['like_number'] as num).toInt(),
      collect: (json['collect'] as num).toInt(),
      collect_number: (json['collect_number'] as num).toInt(),
    );

Map<String, dynamic> _$VideoItemModelToJson(_VideoItemModel instance) =>
    <String, dynamic>{
      'ep': instance.ep,
      'coverUrl': instance.coverUrl,
      'like': instance.like,
      'like_number': instance.like_number,
      'collect': instance.collect,
      'collect_number': instance.collect_number,
    };
