import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:short_video_flutter/utils/format.dart';
import 'package:short_video_flutter/pages/home/home_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';

class CommentsModal extends HookConsumerWidget {
  const CommentsModal({super.key, required this.videoId});
  final String videoId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentController = useTextEditingController();
    final comments = ref.watch(commentsProvider);
    useEffect(() {
      // 使用 addPostFrameCallback 来在构建完成后执行
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(commentsProvider.notifier).loadComments(videoId);
      });
      return null;
    }, [videoId]);
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40.r),
          topRight: Radius.circular(40.r),
        ),
      ),
      child: comments.when(
        data: (data) => Column(
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

            // 标题栏
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${Format.formatNumofW(data.comments.length)} 条评论',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () => Navigator.pop(context),
                  //   child: Icon(
                  //     Icons.close,
                  //     size: 24.sp,
                  //     color: Colors.grey[600],
                  //   ),
                  // ),
                ],
              ),
            ),
            Divider(height: 1.h, color: Colors.grey[200]),

            // 评论列表
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
                itemCount: data.comments.length,
                itemBuilder: (context, index) {
                  final comment = data.comments[index];
                  return _buildCommentItem(comment);
                },
              ),
            ),

            Divider(height: 1.h, color: Colors.grey[200]),

            // 输入框
            Container(
              padding: EdgeInsets.all(16.w),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 16.r,
                    backgroundImage: AssetImage('assets/images/avtar.png'),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: commentController,
                              decoration: InputDecoration(
                                hintText: '说点什么...',
                                hintStyle: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 14.sp,
                                ),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                              ),
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.black87,
                              ),
                              cursorColor: Colors.blue,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => {},
                            child: Container(
                              padding: EdgeInsets.all(6.w),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(12.r),
                              ),
                              child: Icon(
                                Icons.send,
                                color: Colors.white,
                                size: 16.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // 底部安全区域
            SizedBox(height: MediaQuery.of(context).padding.bottom),
          ],
        ),
        error: (error, stackTrace) => Center(child: Text(error.toString())),
        loading: () => Center(
          child: Lottie.asset(
            'assets/lottie/Loader.json',
            width: 200.w,
            height: 40.h,
          ),
        ),
      ),
    );
  }

  Widget _buildCommentItem(comment) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 18.r,
            backgroundImage: CachedNetworkImageProvider(comment.avatar),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.nickname,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      Format.formatTimestamp(comment.createTime),
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  comment.content,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        // 点赞逻辑
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 16.sp,
                            color: Colors.grey[600],
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            comment.diggCount,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap: () {
                        // 回复逻辑
                      },
                      child: Text(
                        '回复',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap: () {
                        // 展开回复逻辑
                      },
                      child: Text(
                        'IP: ${comment.ipLocation}',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Row(
                      children: [
                        SizedBox(width: 4.w),
                        Text(
                          '展开${comment.subCommentCount}条回复',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
