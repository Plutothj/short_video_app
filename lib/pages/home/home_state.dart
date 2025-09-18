import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final List<String> videos;
  final int currentTab;
  final List<Map<dynamic, dynamic>> tabList;

  const HomeState({
    required this.videos,
    required this.currentTab,
    required this.tabList,
  });

  HomeState copyWith({
    List<String>? videos,
    int? currentTab,
    List<Map<dynamic, dynamic>>? tabList,
  }) {
    return HomeState(
      videos: videos ?? this.videos,
      currentTab: currentTab ?? this.currentTab,
      tabList: tabList ?? this.tabList,
    );
  }

  @override
  List<Object?> get props => [videos, currentTab, tabList];
}
