import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:short_video_flutter/theme/theme.dart';
import 'package:short_video_flutter/pages/discover/widgets/sounds_list_item.dart';
import 'package:short_video_flutter/pages/discover/widgets/hashlog_list_item.dart';

class DiscoverPage extends HookConsumerWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 使用 useTabController Hook 来创建 TabController
    final tabController = useTabController(initialLength: 2);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // 👇 关键：不用 leading + title + actions，改用 flexibleSpace 完全自定义
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Row(
              children: [
                // 左侧 Logo
                SizedBox(
                  width: 32.w,
                  height: 32.h,
                  child: Image.asset(
                    'assets/icons/app_logo_1.webp',
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(width: 8.w), // Logo 和标题之间加点间距
                // 标题 —— 紧跟在 Logo 后面，左对齐
                Text(
                  'Trending',
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
                      'assets/icons/search_icon.webp',
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
            // 👇 TabBar：显示标签
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: TabBar(
                controller: tabController,
                labelColor: AppColors.primary,
                // 选中颜色
                indicatorColor: AppColors.primary,
                unselectedLabelColor: Colors.grey[600], // 未选中颜色
                labelStyle: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
                indicatorWeight: 4.h,
                indicatorPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'Sounds'),
                  Tab(text: 'Hashtag'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  // Sounds 页面
                  ListView.builder(
                    itemCount: 10,

                    itemBuilder: (context, index) {
                      return SoundsListItem();
                    },
                  ),
                  // Hashtag 页面
                  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return HashlogListItem();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
