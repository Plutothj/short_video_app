import 'package:logger/logger.dart';

// 1. 创建一个 Logger 实例
final logger = Logger(
  // 2. 配置打印器
  printer: PrettyPrinter(
    methodCount: 1, // 每个日志输出显示的方法调用数
    errorMethodCount: 8, // 错误日志中显示的堆栈跟踪层数
    lineLength: 120, // 每行的宽度
    colors: true, // 为不同级别的日志启用颜色
    printEmojis: true, // 为日志消息打印表情符号
    // ignore: deprecated_member_use
    printTime: false, // 是否打印时间戳
  ),
  // 3. 配置输出级别
  // 在Debug模式下，打印所有级别的日志
  // 在Release模式下，只打印警告及以上级别的日志
  level: Level.debug,
  // level: kReleaseMode ? Level.warning : Level.debug,
  // 如果你想在release模式下也看到日志，可以注释掉上面一行，使用下面这行
  // level: Level.verbose,
);
