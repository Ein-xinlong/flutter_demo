import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'BasicMessageChannelPage.dart';
import 'CustomFlutterBinding.dart';
import 'EventChannelPage.dart';
import 'MethodChannelPage.dart';

// 必须要使用window.defaultRouteName来获取从native层传递过来的参数
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     //Map<String, dynamic> data = json.decode(window.defaultRouteName);
//     // print(data["routeName"]);
//     // print(data["id"]);
//     // print(data["type"]);
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       routes: <String,WidgetBuilder>{
//         '/a':(context)=> MyPage(title:'Page A'),
//         '/b':(context)=> MethodChannelPage()
//       },
//       //home: MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
class MyPage extends StatelessWidget {
  var title;

  MyPage({Key? key, required this.title}) : super(key: key);
  final BasicMessageChannel _basicMessageChannel =
      const BasicMessageChannel("101", StandardMessageCodec());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("我是android发送的消息"+title),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            children: [
              TextButton(
                  onPressed: () async {
                    sendMessage();
                  },
                  child: Text("点击我给原生发送消息"))
            ],
          ),
        ));
  }

  void sendMessage() async {
    var rest = await _basicMessageChannel.send("我是flutter发送的消息");
    print("rest+$rest");
  }
}

void main() {
  runApp(_widgetForRoute(window.defaultRouteName));
}

Widget _widgetForRoute(String route) {
  print("asdfasdfsadf$route");
  switch (route) {
    case '/a':
      return MaterialApp(
        home: Scaffold(
          body: MyPage(title: 'Page A'),
        ),
      );
    default:
      return MaterialApp(
        home: Scaffold(
          body: MyPage(title: route),
        ),
      );
  }
}
