// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_boost/flutter_boost.dart';
//
//
// ///创建一个自定义的Binding，继承和with的关系如下，里面什么都不用写
// class CustomFlutterBinding extends WidgetsFlutterBinding with BoostFlutterBinding {}
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   /// 由于很多同学说没有跳转动画，这里是因为之前exmaple里面用的是 [PageRouteBuilder]，
//   /// 其实这里是可以自定义的，和Boost没太多关系，比如我想用类似iOS平台的动画，
//   /// 那么只需要像下面这样写成 [CupertinoPageRoute] 即可
//   /// (这里全写成[MaterialPageRoute]也行，这里只不过用[CupertinoPageRoute]举例子)
//   ///
//   /// 注意，如果需要push的时候，两个页面都需要动的话，
//   /// （就是像iOS native那样，在push的时候，前面一个页面也会向左推一段距离）
//   /// 那么前后两个页面都必须是遵循CupertinoRouteTransitionMixin的路由
//   /// 简单来说，就两个页面都是CupertinoPageRoute就好
//   /// 如果用MaterialPageRoute的话同理
//
//   Map<String, FlutterBoostRouteFactory> routerMap = {
//     // 'mainPage': (RouteSettings settings, String uniqueId) {
//     //   return CupertinoPageRoute(
//     //       settings: settings,
//     //       builder: (_) {
//     //         Map<String, Object> map = settings.arguments as Map<String, Object> ;
//     //         String data = map['data'] as String;
//     //         return MainPage(
//     //           data: data,
//     //         );
//     //       });
//     // },
//     'simplePage': (settings, uniqueId) {
//       return CupertinoPageRoute(
//           settings: settings,
//           builder: (_) {
//             Map<String, Object> map = settings.arguments as Map<String, Object>;
//             String data = map['data'] as String;
//             return SimplePage(
//               data: data,
//             );
//           });
//     },
//   };
//
//   Route? routeFactory(RouteSettings settings, String uniqueId) {
//     FlutterBoostRouteFactory func = routerMap[settings.name] as FlutterBoostRouteFactory;
//     return func(settings, uniqueId);
//   }
//
//   Widget appBuilder(Widget home) {
//     return MaterialApp(
//       home: home,
//       debugShowCheckedModeBanner: true,
//
//       ///必须加上builder参数，否则showDialog等会出问题
//       builder: (_, __) {
//         return home;
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FlutterBoostApp(
//       routeFactory,
//       appBuilder: appBuilder,
//     );
//   }
// }
//
// class MainPage extends StatelessWidget {
//   const MainPage({required Object data});
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(child: Text('Main Page')),
//     );
//   }
// }
//
// class SimplePage extends StatelessWidget {
//   const SimplePage({required Object data});
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body:  Center(child: Text('SimplePage')),
//     );
//   }
// }