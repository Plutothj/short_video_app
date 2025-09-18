import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:short_video_flutter/theme/theme.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final VoidCallback? onHomeTap;
  final VoidCallback? onDiscoverTap;
  final VoidCallback? onAddTap;
  final VoidCallback? onInboxTap;
  final VoidCallback? onProfileTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    this.onHomeTap,
    this.onDiscoverTap,
    this.onAddTap,
    this.onInboxTap,
    this.onProfileTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: Color(0xFF181A20),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildItem(
            icon: 'assets/icons/Home_unselect.png',
            activeIcon: 'assets/icons/Home.png',
            label: 'Home',
            isActive: currentIndex == 0,
            onTap: onHomeTap,
          ),
          _buildItem(
            icon: 'assets/icons/Discovery_unselect.png',
            activeIcon: 'assets/icons/Discovery.png',
            label: 'Discover',
            isActive: currentIndex == 1,
            onTap: onDiscoverTap,
          ),
          // 中间的“+”按钮
          Padding(
            padding: EdgeInsets.only(bottom: 10.h),
            child: GestureDetector(
              onTap: onAddTap,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: Icon(Icons.add, color: Colors.white, size: 24),
                  onPressed: onAddTap,
                  padding: EdgeInsets.zero,
                ),
              ),
            ),
          ),

          _buildItem(
            icon: 'assets/icons/Chat_unselect.png',
            activeIcon: 'assets/icons/Chat.png',
            label: 'Inbox',
            isActive: currentIndex == 3,
            onTap: onInboxTap,
          ),
          _buildItem(
            icon: 'assets/icons/Profile_unselect.png',
            activeIcon: 'assets/icons/Profile.png',
            label: 'Profile',
            isActive: currentIndex == 4,
            onTap: onProfileTap,
          ),
        ],
      ),
    );
  }

  Widget _buildItem({
    required String icon,
    required String activeIcon,
    required String label,
    required bool isActive,
    required VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isActive
              ? Image.asset(activeIcon, width: 24.w, height: 24.h)
              : Image.asset(icon, width: 24.w, height: 24.h),
          Text(
            label,
            style: TextStyle(
              color: isActive ? AppColors.primary : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
