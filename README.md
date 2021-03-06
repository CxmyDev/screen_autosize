# screen_autosize

<p align="center">
   <a href="https://pub.flutter-io.cn/packages/screen_autosize">
    <img src="https://img.shields.io/pub/v/screen_autosize.svg" alt="pub package" />
  </a>
  <a href="http://www.apache.org/licenses/LICENSE-2.0">
    <img src="http://img.shields.io/badge/License-Apache%202.0-blue.svg?style=flat-square" alt="License" />
  </a>
  <a href="https://juejin.cn/user/3227821828236392">
    <img src="https://img.shields.io/badge/Author-CxmyDev-orange" alt="Author" />
  </a>
</p>


ð¥ A low-cost Flutter screen adaptation solution (åèä»æ¥å¤´æ¡ Android å±å¹ééæ¹æ¡çå®ç°åçï¼å®ç°çä¸ä¸ªæä½ææ¬ç Flutter å±å¹ééæ¹æ¡)ã

Flutter å±å¹ééæ¹æ¡ï¼å¯åå° 100% è¿åè®¾è®¡ç¨¿ã


## Notice

- ä½¿ç¨æ¹æ³
- å®ç°åçï¼æååè¡¥ï¼

## ä¼å¿ & å£å¿

### ä¼å¿ï¼

1. ééææï¼100% è¿å UIï¼
2. ç¨³å®æ§é«ï¼åçç®åï¼æ ä»»ä½ Framework ç Hookï¼
3. ä¾µå¥æ§ä½ï¼ä¿®æ¹ç¹å°ä¸ç»ä¸ï¼æ¥å¸¸ç¼å UI æ éç¹æ®æ³¨æï¼
4. ä½¿ç¨ææ¬ä½ï¼ç»ä¸ä¿®æ¹ï¼å¨å±ææï¼
5. æ§è½æèï¼å ä¹æ²¡æï¼
6. ä¸ç ´å const Widget å¸¸éä¼åï¼

### å£å¿ï¼

1. å¨å±ææï¼æ æ³åé¡µé¢è®¾ç½®ï¼éç»ä¸åé¡¹ç®ä¸åæ¨¡åçè®¾è®¡åå¼åæ åï¼
2. ç¼ç æ³¨æç¹ï¼ä¸è½ä½¿ç¨ window ç±» Api è·åå°ºå¯¸ä¿¡æ¯ï¼
3. éè¦éå WidgetsFlutterBindingï¼å¯è½ä¸é¨ååºå­å¨å²çªï¼éç¹æ®å¤çï¼

## ä½¿ç¨æ¹æ³

### ä¸ãå®è£ä¾èµ

å®è£ä¹åï¼è¯·æ¥çææ°çæ¬ï¼æ°çæ¬å¦æé®é¢ï¼è¯·ä½¿ç¨ä¸ä¸çæ¬ï¼ã

```yaml
dependencies:
    flutter:
      sdk: flutter
    # æ·»å ä¾èµ
    screen_autosize: ^{latest version}
```

### äºãä½¿ç¨å¯¼å

```dart
import 'package:screen_autosize/screen_autosize.dart';
```

### ä¸ãåå§å

**Step1ï¼è®¾å®åºåå±å¹å®½åº¦**

éè¦å¨ `runApp()` ä¹åè®¾ç½®ï¼ä½¿ç¨ AutoSizeUtils ç initConfig() è®¾ç½®è®¾è®¡ç¨¿çåºåå®½åº¦ã

```dart
void main() {
  // è¿éä½¿ç¨ iPhone ä¸åçå®½åº¦ä½ä¸ºåºåå®½åº¦ï¼
  AutoSizeUtils.instance.initConfig(375);
  // ...
}
```

**Step2ï¼æ¿æ¢ runApp()**

å°åæ¬ç `runApp()` ç¨ `runAutoSizeApp(MyApp())` æ¿æ¢ã

```dart
void main() {
  // è¿éä½¿ç¨ iPhone ä¸åçå®½åº¦ä½ä¸ºåºåå®½åº¦ï¼
  AutoSizeUtils.instance.initConfig(375);
  // runApp(MyApp());
  runAutoSizeApp(MyApp());
}
```

**Step3: æ¿æ¢ MaterialApp çæç MediaQuery**

MaterialApp åé¨ä¼çæ MediaQueryï¼éè¦å°å¶éè¿ MediaQueryWrapper æ¿æ¢ã

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (context, widget) {
        // æ¿æ¢æ ¹ç MediaQuery
        return MediaQueryWrapper(builder: (BuildContext context){
          return widget;
        },);
      },
      home: HomePage(title: 'Flutter ScreenAutoSizeç¤ºä¾'),
    );
  }
}
// ...
```

### Step3: å¼å§å UI

ç¼ç æ¶ï¼æ ä»»ä½æ³¨æç¹ï¼ç´æ¥æç§è®¾è®¡å¾çå°ºå¯¸åå°±è¡ã

eg. å¨ 375 å®½åº¦ï¼iPhone 1 åå°ºå¯¸ï¼çè®¾è®¡ç¨¿ä¸ï¼ä¸ä¸ª 100x100 é»è²åºåï¼ç´æ¥ååæ°å°±è¡ï¼æ éä»»ä½æ³¨æç¹ã

```dart
class ColorsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10), // ä¸éè¦è½¬æ¢ï¼è®¾è®¡ç¨¿æ¯å¤å°ï¼å°±åå¤å°
      width: 100,  // ä¸éè¦è½¬æ¢ï¼è®¾è®¡ç¨¿æ¯å¤å°ï¼å°±åå¤å°
      height: 100, // ä¸éè¦è½¬æ¢ï¼è®¾è®¡ç¨¿æ¯å¤å°ï¼å°±åå¤å°
      color: Colors.orange,
      child: Text(
        'ææ¯æ­£æ¹å½¢,è¾¹é¿æ¯100',
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
      ),
    );
  }
}
```

å¦æè¦åæ»¡å±çå°ºå¯¸ï¼ä¾å¦æä¸ª Widget å®½åº¦éè¦ææ»¡å±å¹ï¼å¯ä»¥ä½¿ç¨ 2 ç§æ¹æ³ã

1. å©ç¨ MediaQuery è·åï¼`MediaQuery.of(context).size.width`;
2. å©ç¨ AutoSizeUtils è·åï¼`AutoSizeUtils.instance.mediaWidth`;

ä¸å®½åº¦ï¼widthï¼å¯¹åºçè¿æé«åº¦ï¼heightï¼çå°ºå¯¸ã

Tipsï¼éè¦æ³¨æï¼å ä¸ºåºéæ¹åäº devicePixelRatioï¼æä»¥ä¸è½ç´æ¥ä» window ä¸­è·åå¯¹åºåæ°ã

## ææ

æªééåï¼ä»å·¦å°å³ç dip åå«æ¯ 375 â 392 â 440

![old_size](https://raw.githubusercontent.com/CxmyDev/screen_autosize/main/art/old_size.jpg)

ä½¿ç¨ screen_autosize ééåï¼ä»å·¦å°å³ç dip åå«æ¯ 375 â 392 â 440

![auto_size](https://raw.githubusercontent.com/CxmyDev/screen_autosize/main/art/auto_size.jpg)

## Roadmap

- æ¯ææ¨ªç«å±åæ¢ï¼èªå¨è°æ´åæ°ï¼ï¼ææªæ¯æï¼
- æ¯æå­ä½å°ºå¯¸åæ°è®¾ç½®ï¼å¯éµå¾ªç³»ç»è®¾ç½®ï¼ä¹å¯èªå®ä¹ï¼ï¼ææªæ¯æï¼

## About Me

- Email: plokmju@gmail.com
- æéï¼https://juejin.cn/user/3227821828236392
- å¬ä¼å·ï¼æ¿é¦å¢¨å½±ï¼ID:cxmyDevï¼