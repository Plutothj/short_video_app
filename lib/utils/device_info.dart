import 'dart:io';
import 'dart:convert';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

class DeviceInfoUtil {
  static Future<Map<String, dynamic>> getDeviceInfo() async {
    final deviceInfo = DeviceInfoPlugin();
    final packageInfo = await PackageInfo.fromPlatform();

    late Map<String, dynamic> deviceData;

    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      deviceData = <String, dynamic>{
        'device_model': '${androidInfo.brand} ${androidInfo.model}',
        'device_brand': 'Android',
        'os_version': 'android:${androidInfo.version.sdkInt}',
        'cpu_abis': androidInfo.supportedAbis.join(','),
      };
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      deviceData = <String, dynamic>{
        'device_model': iosInfo.name,
        'device_brand': 'iOS',
        'os_version': 'iOS ${iosInfo.systemVersion}',
        'cpu_abis': 'arm64',
      };
    }

    // 屏幕信息（Flutter 提供）
    final displayW = WidgetsBinding
        .instance
        .platformDispatcher
        .views
        .first
        .physicalSize
        .width
        .toStringAsFixed(0);
    final displayH = WidgetsBinding
        .instance
        .platformDispatcher
        .views
        .first
        .physicalSize
        .height
        .toStringAsFixed(0);

    // 时区
    final timeZone = await FlutterTimezone.getLocalTimezone();

    // 网络类型
    final connectivityResults = await Connectivity().checkConnectivity();
    String networkType = "unknown";
    if (connectivityResults.contains(ConnectivityResult.mobile)) {
      networkType = "NETWORK_MOBILE";
    } else if (connectivityResults.contains(ConnectivityResult.wifi)) {
      networkType = "NETWORK_WIFI";
    } else {
      networkType = "NETWORK_UNKNOWN";
    }

    // 国家代码
    final countryCode = Platform.localeName.split('_').last;

    // 语言
    final sysLang = Platform.localeName.split('_').first;

    final finalAndroidID = const Uuid().v4();
    final finalPseudoID = const Uuid().v4();
    final finalOaid = const Uuid().v4();
    final code =
        "${base64Encode(utf8.encode(finalAndroidID))},${base64Encode(utf8.encode(finalPseudoID))},${base64Encode(utf8.encode(finalOaid))}";
    final encodedStr = base64Encode(utf8.encode(code)).replaceAll('\n', '');

    // 存到本地
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('rbstdc', encodedStr);
    await prefs.setString('platform', Platform.isAndroid ? "1" : "2");

    return {
      "rbstdc": encodedStr,
      "platform": Platform.isAndroid ? "1" : "2",
      "display_w": displayW,
      "display_h": displayH,
      "device_model": deviceData['device_model'] ?? "",
      "time_zone": timeZone,
      "device_brand": deviceData['device_brand'] ?? "",
      "timestamp": DateTime.now().millisecondsSinceEpoch.toString(),
      "country_code": countryCode,
      "sys_lang": sysLang,
      "os_version": deviceData['os_version'] ?? "",
      "version_code": packageInfo.buildNumber,
      "version_name": packageInfo.version,
      "network_type": networkType,
      "cpu_abis": deviceData['cpu_abis'] ?? "",
    };
  }
}
