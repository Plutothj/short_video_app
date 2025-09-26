import 'package:equatable/equatable.dart';
import 'package:short_video_flutter/pages/home/model/comments_model.dart';
import 'package:short_video_flutter/pages/home/model/video_data_model.dart';

class HomeState extends Equatable {
  final List<VideoData> videos;

  final int currentIndex;

  const HomeState({required this.videos, required this.currentIndex});

  HomeState copyWith({List<VideoData>? videos, int? currentIndex}) {
    return HomeState(
      videos: videos ?? this.videos,

      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [videos, currentIndex];
}

class TabState extends Equatable {
  final int currentTab;
  final List<dynamic> tabList;

  const TabState({required this.currentTab, required this.tabList});

  TabState copyWith({
    int? currentTab,
    List<dynamic>? tabList,
    int? currentIndex,
  }) {
    return TabState(
      currentTab: currentTab ?? this.currentTab,
      tabList: tabList ?? this.tabList,
    );
  }

  @override
  List<Object?> get props => [currentTab, tabList];
}

class CommentsState extends Equatable {
  final List<Comments> comments;

  const CommentsState({required this.comments});

  CommentsState copyWith({List<Comments>? comments}) {
    return CommentsState(comments: comments ?? this.comments);
  }

  @override
  List<Object?> get props => [comments];
}
