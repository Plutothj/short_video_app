import 'package:equatable/equatable.dart';

class ProfileState extends Equatable {
  final List<dynamic> postsList;
  final List<dynamic> followersList;
  final List<dynamic> followingList;
  final List<dynamic> likesList;

  const ProfileState({
    required this.postsList,
    required this.followersList,
    required this.followingList,
    required this.likesList,
  });

  ProfileState copyWith({
    List<dynamic>? postsList,
    List<dynamic>? followersList,
    List<dynamic>? followingList,
    List<dynamic>? likesList,
  }) {
    return ProfileState(
      postsList: postsList ?? this.postsList,
      followersList: followersList ?? this.followersList,
      followingList: followingList ?? this.followingList,
      likesList: likesList ?? this.likesList,
    );
  }

  @override
  List<Object?> get props => [
    postsList,
    followersList,
    followingList,
    likesList,
  ];
}

class TabState extends Equatable {
  final int currentTab;
  final List<dynamic> tabList;
  final int currentIndex;

  const TabState({
    required this.currentTab,
    required this.tabList,
    required this.currentIndex,
  });

  TabState copyWith({
    int? currentTab,
    List<dynamic>? tabList,
    int? currentIndex,
  }) {
    return TabState(
      currentTab: currentTab ?? this.currentTab,
      tabList: tabList ?? this.tabList,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object?> get props => [currentTab, tabList, currentIndex];
}
