import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:short_video_flutter/theme/theme.dart';
import 'package:short_video_flutter/provider/theme_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:short_video_flutter/pages/profile/provider/profile_provider.dart';

class ProfileScreen extends HookConsumerWidget {
  final String userId;

  const ProfileScreen({super.key, required this.userId});

  Widget _buildProfileTopInfo() {
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
                child: Image.asset(
                  'assets/images/Ellipse.webp',
                  fit: BoxFit.contain,
                  width: 120.w,
                  height: 120.h,
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
          '@Andrewkhan',
          style: TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 0,
          ),
        ),
        Text(
          'Designer & Videographer',
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
  Widget _buildProfileNumberInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20.w,
      children: [
        Column(
          children: [
            Text(
              '247',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
            Text(
              'Posts',
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
              '368K',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
            Text(
              'Followers',
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
              '374',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
            Text(
              'Following',
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
              '3.7M',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                letterSpacing: 0,
              ),
            ),
            Text(
              'Likes',
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
  Widget _buildTabSwitch(TabController tabController) {
    return Consumer(
      builder: (context, ref, child) {
        final tabList = ref.watch(tabProvider).tabList;

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
          child: TabBar(
            controller: tabController,
            // 让底部横条充满子元素宽度
            indicatorWeight: 4.h,
            indicatorPadding: EdgeInsets.zero,
            indicatorSize: TabBarIndicatorSize.tab,
            tabs: List.generate(tabList.length, (index) {
              return Tab(
                child: AnimatedBuilder(
                  animation: tabController,
                  builder: (context, child) {
                    return SvgPicture.asset(
                      tabList[index],
                      width: 24.w,
                      height: 24.h,
                      colorFilter: tabController.index == index
                          ? ColorFilter.mode(AppColors.primary, BlendMode.srcIn)
                          : ColorFilter.mode(
                              AppColors.grey300,
                              BlendMode.srcIn,
                            ),
                      fit: BoxFit.contain,
                    );
                  },
                ),
              );
            }),
          ),
        );
      },
    );
  }

  // 四个tab容器
  Widget _buildTabContainer(TabController tabController, WidgetRef ref) {
    return TabBarView(
      controller: tabController,
      children: [
        _buildPostsTab(),
        _buildFollowersTab(),
        _buildFollowingTab(),
        _buildLikesTab(),
      ],
    );
  }

  // 四个tab内容
  Widget _buildPostsTab() {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(), // 禁用内部滚动，跟随外层滚动
        shrinkWrap: true, // 让GridView根据内容自适应高度
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10, // 👉 主轴方向间距（垂直方向 item 上下间距）
          crossAxisSpacing: 10, // 👉 交叉轴方向间距（水平方向 item 左右间距）
          childAspectRatio: 3 / 5,
        ),
        itemCount: 60,
        itemBuilder: (context, index) {
          return Container(
            width: 120.w,
            height: 200.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/girls_2.webp'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.r),
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

  Widget _buildUserModal(BuildContext context) {
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
              Image.asset(
                'assets/images/Ellipse.webp',
                width: 60.w,
                height: 60.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    'Andrewkhan',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Designer & Videographer',
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
              Image.asset(
                'assets/images/Ellipse.webp',
                width: 60.w,
                height: 60.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    'Andrewkhan',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Designer & Videographer',
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
              Image.asset(
                'assets/images/Ellipse.webp',
                width: 60.w,
                height: 60.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4.h,
                children: [
                  Text(
                    'Andrewkhan',
                    style: TextStyle(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Designer & Videographer',
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

    final tabController = useTabController(initialLength: 4);
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
                'Andrewkhan',
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
                  builder: (context) => _buildUserModal(context),
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
              _buildProfileTopInfo(),
              SizedBox(height: 20.h),
              _buildProfileNumberInfo(),

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

              _buildTabSwitch(tabController),

              // TabBarView 需要明确的高度约束
              SizedBox(
                height: 600.h, // 给TabBarView设置一个足够的高度
                child: _buildTabContainer(tabController, ref),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
