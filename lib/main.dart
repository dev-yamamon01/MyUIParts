import 'package:flutter/material.dart';
import 'router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'flavors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/constants/app_color.dart';

void main() {
  //ここにflavorの分岐を追加
  F().initByFlavor(); //何かflavorごとに初期化したいことがあればここで書く
  runApp(const ProviderScope(child: MyApp()));
}

final navigatorKey = GlobalKey<NavigatorState>(); //このキーを使うことで各Viewでcontextを動的に取得できる

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(820, 1180), // 縦向き（portrait）のiPad A16を基準にする
      minTextAdapt: true, //小さい画面でのフォントサイズの下限値を決めて可読性を向上
      splitScreenMode: true, //画面分割で使用される際はデバイスのスクリーンサイズではなく実際のウィンドウサイズで調整する
      builder: (context, child){
        return MaterialApp.router(
          //debugShowCheckedModeBanner: false, //debugフラッグを消すためのコード
          themeMode: ThemeMode.light,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
          ),
          routerConfig: router,
        );
      },
    );
  }
}
