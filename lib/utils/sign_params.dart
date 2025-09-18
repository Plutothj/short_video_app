import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:short_video_flutter/utils/logger.dart';

class SignParams {
  static String key =
      '7ee6435d86e82eca1046eea5a81a6c1d1919ad88c3669e7adbbb3a608f6cfd42';

  /// 对参数进行签名，返回带sign的参数Map
  static Map<String, dynamic> signParams(Map<String, dynamic> params) {
    // 1. 过滤掉空值参数
    final filtered = params.entries
        .where((e) => e.value != null && e.value.toString().isNotEmpty)
        .toList();
    // 2. 按参数名ASCII码排序
    filtered.sort((a, b) => a.key.compareTo(b.key));
    // 3. 拼接成stringA
    final stringA = filtered.map((e) => "${e.key}=${e.value}").join('&');
    // 4. 拼接key
    final stringSignTemp = '$stringA&$key';
    // 5. MD5签名
    final sign = md5.convert(utf8.encode(stringSignTemp)).toString();
    // 6. 返回带sign的参数
    final result = Map<String, dynamic>.from(params);
    result['sign'] = sign;
    logger.d('stringSignTemp: $stringSignTemp');
    logger.d('sign: $sign');
    return result;
  }
}
