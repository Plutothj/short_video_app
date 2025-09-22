import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:short_video_flutter/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TrendingSoundsPage extends HookConsumerWidget {
  const TrendingSoundsPage({super.key});

  Widget _buildSoundsTopInfo() {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      child: Row(
        spacing: 20.w,
        children: [
          Container(
            width: 140.w,
            height: 140.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/avtar_2.webp'),
                fit: BoxFit.contain,
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/white_bold_play.webp',
                fit: BoxFit.contain,
                width: 32.w,
                height: 32.h,
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              spacing: 10.h,
              children: [
                Text(
                  'Favorite Girl by Justin Bieber',
                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.grey900,
                  ),
                ),
                Text(
                  '387.5M Videos',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal,
                    color: AppColors.grey700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSoundsButtons() {
    return Column(
      children: [
        Row(
          spacing: 8.w,
          children: [
            OutlinedButton.icon(
              onPressed: () => {},
              label: Text(
                'Play Song',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              icon: Image.asset(
                'assets/icons/circle_bold_play.webp',
                width: 16.w,
                height: 16.h,
                fit: BoxFit.contain,
              ),
              style: ButtonStyle(
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                minimumSize: WidgetStateProperty.all(Size(186.w, 32.h)),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: () => {},
              label: Text(
                'Add to Favorites',
                style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
              ),
              icon: Image.asset(
                'assets/icons/tag.webp',
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
                minimumSize: WidgetStateProperty.all(Size(186.w, 32.h)),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/images/nova_avatar.webp',
                  width: 60.w,
                  height: 60.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 5.h,
                  children: [
                    Text(
                      'Justin Bieber',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey900,
                      ),
                    ),
                    Text(
                      'Professional Singer',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.grey700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            TextButton(
              onPressed: () => {},

              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(AppColors.primary),
                foregroundColor: WidgetStateProperty.all(AppColors.white),
                shape: WidgetStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.r),
                  ),
                ),
                minimumSize: WidgetStateProperty.all(Size(73.w, 32.h)),
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                ),
              ),
              child: Text('Follow'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSoundsGridView() {
    return Expanded(
      child: Stack(
        children: [
          GridView.builder(
            padding: EdgeInsets.only(top: 20.h),
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
          Positioned(
            bottom: 20.h,
            child: Container(
              width: 380.w,
              height: 58.h,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(29.r),
                color: AppColors.primary,
              ),
              child: Row(
                spacing: 10.w,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/svg/music.svg',
                    width: 20.w,
                    height: 20.h,
                  ),
                  Text('Use this Sound'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        // 👇 关键：不用 leading + title + actions，改用 flexibleSpace 完全自定义
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                // 左侧 Logo
                IconButton(
                  onPressed: () => context.pop(),
                  icon: Image.asset(
                    'assets/icons/arrow-left.webp',
                    width: 28.w,
                    height: 28.h,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 8.w), // Logo 和标题之间加点间距
                // 标题 —— 紧跟在 Logo 后面，左对齐
                Text(
                  'Trending Sounds',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                // 中间用 Expanded 占满剩余空间
                Expanded(child: Container()),

                // 右侧搜索图标
                IconButton(
                  padding: EdgeInsets.zero, // 去除默认内边距
                  constraints: BoxConstraints(), // 去除最小尺寸限制
                  icon: SizedBox(
                    width: 28.w,
                    height: 28.h,
                    child: Image.asset(
                      'assets/icons/share_forward.webp',
                      fit: BoxFit.contain,
                    ),
                  ),
                  onPressed: () {
                    // 打开搜索页
                  },
                ),
              ],
            ),
          ),
        ),
        // ⚠️ 注意：使用 flexibleSpace 后，leading/title/actions 不要再设置，否则会冲突
      ),
      body: Container(
        padding: EdgeInsets.all(24.w),
        child: Column(
          children: [
            _buildSoundsTopInfo(),
            _buildSoundsButtons(),
            _buildSoundsGridView(),
          ],
        ),
      ),
    );
  }
}
