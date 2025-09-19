import 'package:equatable/equatable.dart';
import 'package:short_video_flutter/pages/home/model/video_item_model.dart';

class HomeState extends Equatable {
  final List<VideoItemModel> videos;
  final int currentTab;
  final List<dynamic> tabList;
  final int currentIndex;

  const HomeState({
    required this.videos,
    required this.currentTab,
    required this.tabList,
    required this.currentIndex,
  });

  HomeState copyWith({
    List<VideoItemModel>? videos,
    int? currentTab,
    List<dynamic>? tabList,
    int? currentIndex,
  }) {
    return HomeState(
      videos: videos ?? this.videos,
      currentTab: currentTab ?? this.currentTab,
      tabList: tabList ?? this.tabList,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [videos, currentTab, tabList, currentIndex];
}
