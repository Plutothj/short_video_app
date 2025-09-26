import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:short_video_flutter/theme/theme.dart';
import 'package:short_video_flutter/provider/theme_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:short_video_flutter/pages/profile/provider/profile_provider.dart';
import 'package:short_video_flutter/provider/auth_provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:short_video_flutter/utils/format.dart';

class ProfileScreen extends HookConsumerWidget {
  final String userId;

  const ProfileScreen({super.key, required this.userId});

  Widget _buildProfileTopInfo(WidgetRef ref) {
    final user = ref.watch(authProvider).value?.user;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 8.h,
      children: [
        SizedBox(
          width: 120.w,
          height: 120.h,

          child: Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(120.r),
                  child: CachedNetworkImage(
                    imageUrl: Uri.encodeFull(
                      'https://p3-pc.douyinpic.com/img/aweme-avatar/tos-c…436a9ca62c0902595~c5_168x168.jpeg?from=2956013662',
                    ),
                    fit: BoxFit.contain,
                    width: 120.w,
                    height: 120.h,
                    errorWidget: (context, error, stackTrace) => Container(
                      width: 120.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, size: 60.w),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: -8.w,
                bottom: -8.h,
                child: IconButton(
                  onPressed: () => {},
                  icon: Image.asset(
                    'assets/icons/Bold_Edit_Square.webp',
                    width: 30.w,
                    height: 30.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          '@${user?.nickname ?? ''}',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0,
          ),
        ),
        Text(
          user?.signature ?? '',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            color: Colors.black,
            letterSpacing: 0,
          ),
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Container(
      width: 1.w, // 线宽
      height: 32.h, // 高度（根据你的文字高度调整，比如 24.sp + 14.sp + 间距）
      color: AppColors.grey300,
    );
  }

  // 数字信息展示
  Widget _buildProfileNumberInfo(WidgetRef ref) {
    final user = ref.watch(authProvider).value?.user;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20.w,
      children: [
        Column(
          children: [
            Text(
              Format.formatNumofW(user?.awemeCount ?? 0),
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
            Text(
              '获赞',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
        _buildDivider(),
        Column(
          children: [
            Text(
              Format.formatNumofW(user?.followingCount ?? 0),
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
            Text(
              '朋友',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
        _buildDivider(),
        Column(
          children: [
            Text(
              Format.formatNumofW(user?.followingCount ?? 0),
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
            Text(
              '关注',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
        _buildDivider(),
        Column(
          children: [
            Text(
              Format.formatNumofW(user?.followerCount ?? 0),
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
            Text(
              '粉丝',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // 四个tab切换
  Widget _buildTabSwitch(PageController pageController) {
    return Consumer(
      builder: (context, ref, child) {
        final tabList = ref.watch(tabProvider).tabList;
        final currentPageIndex = ref.watch(tabProvider).currentTab;

        // // 加载或空数据时，避免渲染空 TabBar 造成与 TabController 长度不一致
        // if (tabList.isEmpty) {
        //   return Container(
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
        //     ),
        //     height: 48.0, // 固定高度占位，保持布局稳定
        //     alignment: Alignment.center,
        //     child: SizedBox(
        //       width: 20,
        //       height: 20,
        //       child: CircularProgressIndicator(strokeWidth: 2),
        //     ),
        //   );
        // }

        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
          ),
          child: Row(
            children: List.generate(tabList.length, (index) {
              final isSelected = currentPageIndex == index;
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    ref.read(tabProvider.notifier).setCurrentPage(index);
                    pageController.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Container(
                    height: 48.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          tabList[index],
                          width: 24.w,
                          height: 24.h,
                          colorFilter: isSelected
                              ? ColorFilter.mode(
                                  AppColors.primary,
                                  BlendMode.srcIn,
                                )
                              : ColorFilter.mode(
                                  AppColors.grey300,
                                  BlendMode.srcIn,
                                ),
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 4.h),
                        Container(
                          height: 4.h,
                          width: 24.w,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(2.r),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }

  // 四个页面容器
  Widget _buildPageContainer(PageController pageController, WidgetRef ref) {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        // 同步更新当前页面状态
        final currentPage = ref.read(tabProvider).currentTab;
        if (currentPage != index) {
          ref.read(tabProvider.notifier).setCurrentPage(index);
        }
      },
      children: [
        _buildPostsTab(ref),
        _buildFollowersTab(),
        _buildFollowingTab(),
        _buildLikesTab(),
      ],
    );
  }

  // 四个tab内容
  Widget _buildPostsTab(WidgetRef ref) {
    final postsList = ref.watch(profileProvider).value?.postsList ?? [];
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: AlignedGridView.count(
        itemCount: postsList.length,
        crossAxisCount: 3,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        itemBuilder: (context, index) {
          return Container(
            width: 120.w,
            height: 200.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                  Format.formatImageUrl(
                    postsList[index].video.cover.urlList[0],
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                postsList[index].isTop == 1
                    ? Container(
                        width: 36.w,
                        height: 20.h,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(4.r),
                        ),

                        child: Center(
                          child: Text(
                            '置顶',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    : Container(),
                Row(
                  spacing: 4.w,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/heart.svg',
                      width: 14.w,
                      height: 14.h,
                      colorFilter: ColorFilter.mode(
                        Colors.white,
                        BlendMode.srcIn,
                      ),
                    ),
                    Text(
                      Format.formatNumofW(
                        postsList[index].statistics.diggCount,
                      ),
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildFollowersTab() {
    return Container();
  }

  Widget _buildFollowingTab() {
    return Container();
  }

  Widget _buildLikesTab() {
    return Container();
  }

  Widget _buildUserModal(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authProvider).value?.user;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12.h,
        children: [
          // 顶部拖拽指示器
          Container(
            margin: EdgeInsets.only(top: 12.h),
            width: 40.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          Text(
            'Switch Account',
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 12.h),
          Divider(height: 1.h, color: Colors.grey[200]),
          Row(
            spacing: 12.w,
            children: [
              user?.avatar168X168.uri != null &&
                      user!.avatar168X168.uri.isNotEmpty
                  ? Image.network(
                      user.avatar168X168.uri,
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.person, size: 30.w),
                      ),
                    )
                  : Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, size: 30.w),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    user?.nickname ?? '',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    user?.signature ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(height: 1.h, color: Colors.grey[200]),
          Row(
            spacing: 12.w,
            children: [
              user?.avatar168X168.uri != null &&
                      user!.avatar168X168.uri.isNotEmpty
                  ? Image.network(
                      user.avatar168X168.uri,
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.person, size: 30.w),
                      ),
                    )
                  : Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, size: 30.w),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    user?.nickname ?? '',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    user?.signature ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Divider(height: 1.h, color: Colors.grey[200]),
          Row(
            spacing: 12.w,
            children: [
              user?.avatar168X168.uri != null &&
                      user!.avatar168X168.uri.isNotEmpty
                  ? Image.network(
                      user.avatar168X168.uri,
                      width: 60.w,
                      height: 60.h,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.person, size: 30.w),
                      ),
                    )
                  : Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.person, size: 30.w),
                    ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    user?.nickname ?? '',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    user?.signature ?? '',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),

          Row(
            spacing: 12.w,
            children: [
              Image.asset(
                'assets/icons/plus_circle.webp',
                width: 60.w,
                height: 60.h,
              ),
              Text(
                'Add Account',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(isDarkModeProvider);

    final pageController = usePageController(initialPage: 0);

    final user = ref.watch(authProvider).value?.user;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(profileProvider.notifier).loadPostsList();
      });
      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Image.asset(
            'assets/icons/add_user.webp',
            width: 28.w,
            height: 28.h,
          ),
        ),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 109.w,
              child: Text(
                user?.nickname ?? '',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Urbanist',

                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0,
                ),
              ),
            ),

            IconButton(
              onPressed: () => {
                // 显示一个modal
                showModalBottomSheet(
                  // r如何让modal的高度 适应元素的高度 自适应高度
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  barrierColor: Colors.black.withValues(alpha: 0.5),
                  useRootNavigator: true,
                  builder: (context) => _buildUserModal(context, ref),
                ),
              },
              icon: Image.asset(
                'assets/icons/Light_Arrow_Down.webp',
                width: 24.w,
                height: 24.h,
              ),
              tooltip: isDarkMode ? '切换到亮色模式' : '切换到暗色模式',
            ),
          ],
        ),
        actions: [
          // 主题切换按钮
          IconButton(
            onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
            icon: Image.asset(
              'assets/icons/Curved_Setting.webp',
              width: 28.w,
              height: 28.h,
            ),
          ),
          // IconButton(
          //   onPressed: () => ref.read(themeProvider.notifier).toggleTheme(),
          //   icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
          //   tooltip: isDarkMode ? '切换到亮色模式' : '切换到暗色模式',
          // ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProfileTopInfo(ref),
              SizedBox(height: 20.h),
              _buildProfileNumberInfo(ref),

              SizedBox(height: 20.h),

              OutlinedButton.icon(
                onPressed: () => {},
                label: Text(
                  'Edit Profile',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                icon: Image.asset(
                  'assets/icons/Iconly_Bold_Chat.webp',
                  width: 16.w,
                  height: 16.h,
                  fit: BoxFit.contain,
                ),
                style: ButtonStyle(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.r),
                    ),
                  ),
                  minimumSize: WidgetStateProperty.all(Size(380.w, 45.h)),
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                  ),
                ),
              ),

              SizedBox(height: 20.h),

              _buildTabSwitch(pageController),

              // 使用固定高度的 PageView 容器，避免高度约束问题
              SizedBox(
                height:
                    MediaQuery.of(context).size.height *
                    0.6, // 给 PageView 一个固定高度
                child: _buildPageContainer(pageController, ref),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
