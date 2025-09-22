import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:short_video_flutter/theme/theme.dart';
import 'package:go_router/go_router.dart';

class HashlogListItem extends StatelessWidget {
  const HashlogListItem({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h),
      child: Column(
        spacing: 20.h,
        children: [
          Row(
            spacing: 10.w,
            children: [
              Image.asset(
                'assets/images/jinghao.webp',
                width: 80.w,
                height: 80.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'amazingfood',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: AppColors.grey900,
                      ),
                    ),
                    Text(
                      'Trending Hashtag',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.normal,
                        color: AppColors.grey600,
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                children: [
                  Text(
                    '387.5M',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grey900,
                    ),
                  ),
                  IconButton(
                    onPressed: () => {context.push('/trending-sounds')},
                    icon: Image.asset(
                      'assets/icons/light_arrow.webp',
                      width: 24.w,
                      height: 24.h,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: 200.w,
            child: ListView.builder(
              // 横向滑动
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                  width: 122.w,
                  height: 200.w,
                  margin: EdgeInsets.only(right: 10.w),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/foods.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/icons/bold_play.webp',
                              width: 16.w,
                              height: 16.h,
                            ),
                            Text(
                              '736.2k',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
