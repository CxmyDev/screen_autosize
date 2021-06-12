import 'package:flutter/material.dart';
import 'package:screen_autosize/screen_autosize.dart';
import 'dart:ui' as ui show window;

void main() => runApp(MyApp());

class Binding extends AutoSizeWidgetsFlutterBinding{
  static WidgetsBinding ensureInitialized() {
    if (WidgetsBinding.instance == null) Binding();
    return WidgetsBinding.instance;
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // builder: (context, widget) {
      //   return MediaQueryWrapper(builder: (BuildContext context){
      //     return widget;
      //   },);
      // },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter ScreenAutoSize示例'),
    );
  }
}

class ColorsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10), // 不需要转换，设计稿是多少，就写多少
      width: 100,  // 不需要转换，设计稿是多少，就写多少
      height: 100, // 不需要转换，设计稿是多少，就写多少
      color: Colors.orange,
      child: Text(
        '我是正方形,边长是100',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    printScreenInformation();
    var sysMediaData = MediaQueryData.fromWindow(ui.window);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(10),
                  width: 180,
                  height: 80,
                  color: Colors.red,
                  child: Text(
                    '实际宽度:${180}dp \n'
                        '实际高度:${80}dp',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  width: 180,
                  height: 80,
                  color: Colors.blue,
                  child: Text(
                      '设计稿宽度: 180dp \n'
                          '设计稿高度: 80dp',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12)),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 375,
              height: 80,
              color: Colors.blueGrey,
              child: Text(
                  '设计稿宽度: 375dp \n'
                      '设计稿高度: 80dp',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12)),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 80,
              color: Colors.green,
              child: Text(
                  '设计稿要求宽度撑满屏幕，使用 MediaQuery.of().size.width 设置 \n'
                      '设计稿高度: 80dp',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12)),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: 100,
              height: 100,
              color: Colors.orange,
              child: Text(
                '我是正方形,边长是100',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),

            Text('设备原始像素尺寸: ${ui.window.physicalSize.width} x ${ui.window.physicalSize.height} (px)'),
            Text('设备原始 density: ${sysMediaData.devicePixelRatio}dp'),
            Text('设备原始宽度: ${sysMediaData.size.width} dp'),
            Text('设备原始高度: ${sysMediaData.size.height} dp'),
          ],
        ),
      ),
    );
  }

  void printScreenInformation() {
    var sysMediaData = MediaQueryData.fromWindow(ui.window);
    print('设备原始像素尺寸: ${ui.window.physicalSize.width} x ${ui.window.physicalSize.height} (px)');
    print('设备原始 density: ${sysMediaData.devicePixelRatio}dp');
    print('设备原始宽度: ${sysMediaData.size.width} dp');
    print('设备原始高度: ${sysMediaData.size.height} dp');
    print("=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=");
    print('调整后的的像素密度: ${AutoSizeUtils.instance.devicePixelRatio}');
    print('调整后的宽度: ${AutoSizeUtils.instance.mediaWidth} dp');
    print('调整后的高度: ${AutoSizeUtils.instance.mediaHeight} dp');
    print('状态栏高度: ${AutoSizeUtils.instance.statusBarHeight} dp');
    print('底部安全区距离: ${AutoSizeUtils.instance.bottomBarHeight} dp');
  }
}