import "package:freezed_annotation/freezed_annotation.dart";

part 'video_item_model.freezed.dart';
part 'video_item_model.g.dart';

@freezed
abstract class VideoItemModel with _$VideoItemModel {
  const factory VideoItemModel({
    required String ep,
    required String coverUrl,
    required int like,
    required int like_number,
    required int collect,
    required int collect_number,
  }) = _VideoItemModel;

  factory VideoItemModel.fromJson(Map<String, dynamic> json) =>
      _$VideoItemModelFromJson(json);
}
