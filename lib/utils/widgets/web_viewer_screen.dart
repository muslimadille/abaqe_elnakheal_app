import 'dart:convert';

import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

import '../../modules/cart/success_screen.dart';

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
        javascriptChannels: Set.from([
          JavascriptChannel(
              name: 'messageHandler',
              onMessageReceived: (JavascriptMessage message) {
                print(message.message);
                var jsonData = jsonDecode(message.message);
                if(jsonData['status'] == 'CANCELLED'){
                  // Your code
                }else if(jsonData['status'] == 'SUCCESS'){
                  // Your code
                }
              })
        ]),
      onPageFinished: (value){
        print("$value");

      },
      onWebViewCreated: (WebViewController webViewController) {
        webViewController!.currentUrl().then((value) {
          print("$value");
        });
      },
      navigationDelegate: (NavigationRequest request) {
        if (request.url.contains("success")){
          MyUtils.navigateReplaceCurrent(context, SuccessScreen());
          return NavigationDecision.prevent;
        }
        if(request.url.contains("cancel")){
          Navigator.pop(context);
        }
        return NavigationDecision.navigate;
      },
    )

      ,),);
  }
}
