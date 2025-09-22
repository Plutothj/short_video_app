import 'package:equatable/equatable.dart';

class DiscoverState extends Equatable {
  final List<dynamic> soundsList;
  final List<dynamic> hashtagList;

  final int currentTab;
  final List<dynamic> tabList;
  final int currentIndex;

  const DiscoverState({
    required this.soundsList,
    required this.hashtagList,
    required this.currentTab,
    required this.tabList,
    required this.currentIndex,
  });

  DiscoverState copyWith({
    List<dynamic>? soundsList,
    List<dynamic>? hashtagList,
    int? currentTab,
    List<dynamic>? tabList,
    int? currentIndex,
  }) {
    return DiscoverState(
      soundsList: soundsList ?? this.soundsList,
      hashtagList: hashtagList ?? this.hashtagList,
      currentTab: currentTab ?? this.currentTab,
      tabList: tabList ?? this.tabList,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [
    soundsList,
    hashtagList,
    currentTab,
    tabList,
    currentIndex,
  ];
}
