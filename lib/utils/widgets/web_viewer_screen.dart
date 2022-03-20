import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  String link;
   WebPage(this.link,{Key? key}) : super(key: key);
  @override
  _WebPageState createState() => _WebPageState();
}


class _WebPageState extends State<WebPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: SafeArea(child:
    WebView(
      initialUrl: widget.link,
    ) ,),);
  }
}
