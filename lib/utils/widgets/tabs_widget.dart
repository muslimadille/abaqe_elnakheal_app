
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:flutter/material.dart';

import '../baseDimentions.dart';
import '../my_colors.dart';

class TabsPagesWidget extends StatefulWidget {
  List<Widget>? pages=[];
  List<String>? tabsTexts=[];
  bool isLandScape=false;
  bool isTapsScrollable=true;
  int selectedIndex=0;
  Color tapsBgdColor = Colors.transparent;
  double tapsWidth = double.infinity;

  TabsPagesWidget(
      { Key? key,
        this.pages,
        this.tabsTexts,
        this.tapsBgdColor=Colors.transparent,
        this.tapsWidth=double.infinity,
        this.selectedIndex = 0,
        this.isTapsScrollable=true, this.isLandScape = false})
      : super(key: key);

  @override
  _TabsPagesWidgetState createState() =>
      _TabsPagesWidgetState();
}

class _TabsPagesWidgetState extends State<TabsPagesWidget> {
  int selectedIndex=0;
  PageController _pageController=PageController();
  double _indecatorWidth=0;
  _TabsPagesWidgetState();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: D.default_60,
          width: double.infinity,
          child:createStaticListOFTabs(),
        ),
        Expanded(
          flex:1,
          child: Container(
            color: C.GREY_2,
            margin: EdgeInsets.all(D.default_10),
            child: PageView(
              controller: _pageController,
              children: widget.pages!,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ],
    );
  }



  Widget createStaticListOFTabs() {
    return Row(children: widget.tabsTexts!.asMap().entries.map((entry) {
      int index = entry.key;
      String text = entry.value;
      return Expanded(
        child: InkWell(
          onTap: (){
            setState(() {
              selectedIndex=index;
              _pageController.jumpToPage(index);
            });
          },
          child: Container(
            height: D.default_80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
            Expanded(child: Container(
              margin: EdgeInsets.symmetric(horizontal: D.default_5),
              child: Center(child: Text(text,style: S.h2(color: index==selectedIndex?C.BLUE_1:C.GREY_3),),),
            ),),
            Stack(children: [
              Container(color: C.GREY_3,height: D.default_1,),
              Container(
                color: C.BLUE_1,height: D.default_2,
                width: selectedIndex==index?double.infinity:0,
              )
            ],)
          ],),),),
      );
    }).toList());
  }
}