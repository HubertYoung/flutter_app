import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/blocs/application_bloc.dart';
import 'package:flutter_app/blocs/bloc_provider.dart';
import 'package:flutter_app/common/common.dart';
import 'package:flutter_app/data/net/dio_util.dart';
import 'package:flutter_app/res/colors.dart';
import 'package:flutter_app/ui/pages/page_index.dart';

void main() => runApp(BlocProvider<ApplicationBloc>(
  bloc: ApplicationBloc(),
  child: BlocProvider(child: MyApp(), bloc: MyHomePage()),

));

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{
  Color _themeColor = Colours.app_main;
  @override
  void initState() {
    super.initState();
    _init();
    _initAsync();
    _initListener();
  }

  void _init() {
    //    DioUtil.openDebug();
    Options options = DioUtil.getDefOptions();
    options.baseUrl = Constant.SERVER_ADDRESS;
    HttpConfig config = new HttpConfig(options: options);
    DioUtil().setConfig(config);
  }
  void _initAsync() async {
    await SpUtil.getInstance();
    if (!mounted) return;
  }
  void _initListener() {
    final ApplicationBloc bloc = BlocProvider.of<ApplicationBloc>(context);
    bloc.appEventStream.listen((value) {
//      _loadLocale();
      LogUtil.e("_loadLocale......");
    });
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
//      routes: {
//        '/MainPage': (ctx) => MainPage(),
//      },
      home: new SplashPage(),
      theme: ThemeData.light().copyWith(
        primaryColor: _themeColor,
        accentColor: _themeColor,
        indicatorColor: Colors.white,
      ),
    );
  }

}


class MyHomePage implements BlocBase {
  MyHomePage() {
    LogUtil.e("MainBloc......");
  }

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  String title;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future getData({String labelId, int page}) {
    // TODO: implement getData
    return null;
  }

  @override
  Future onLoadMore({String labelId}) {
    // TODO: implement onLoadMore
    return null;
  }

  @override
  Future onRefresh({String labelId}) {
    // TODO: implement onRefresh
    return null;
  }
}
