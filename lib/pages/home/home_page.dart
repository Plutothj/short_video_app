import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:short_video_flutter/provider/auth_provider.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player_manger.dart';
import 'package:short_video_flutter/pages/home/widgets/video_player.dart';
// import 'package:short_video_flutter/pages/home/widgets/video_player_controls.dart';
import 'package:short_video_flutter/pages/home/home_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late VideoPlayerManger playMuitManger;

  @override
  void initState() {
    super.initState();
    playMuitManger = VideoPlayerManger();
  }

  @override
  void dispose() {
    playMuitManger.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final authState = ref.watch(authProvider);
    final homeState = ref.watch(homeProvider);

    return Scaffold(
      // appBar: AppBar(title: const Text('Home')),
      body: VisibilityDetector(
        key: ObjectKey(playMuitManger),
        onVisibilityChanged: (visibility) {
          if (visibility.visibleFraction == 0 && context.mounted) {
            playMuitManger.pause();
          }
        },
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: homeState.videos.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 74.h),
              height: MediaQuery.of(context).size.height,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: VideoPlayer(
                  url: homeState.videos[index].toString(),
                  flickMultiManager: playMuitManger,
                  image:
                      "https:\/\/storage.clipdrama.com\/poster\/6874cd0708103.webp?Expires=1758193294&KeyName=storage&Signature=eTV45f2tXJmrolT10A4JPYuaYHw=",
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
