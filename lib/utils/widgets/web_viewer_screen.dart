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
  WebViewController? _controller;
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
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
       // _controller!.currentUrl();
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.contains("success")){

          //You can do anything

          //Prevent that url works
          return NavigationDecision.prevent;
        }
        //Any other url works
        return NavigationDecision.navigate;
      },
    )

      ,),);
  }
}
