import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/home_provider.dart';
import '../../utils/widgets/loading_widget.dart';
import 'items/ads_widget.dart';
import 'items/card_icon.dart';
import 'items/home_categories_list_widget/hom_gategories_list.dart';
import 'items/home_search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProvider;
  @override
  void initState() {
    super.initState();
    homeProvider=Provider.of<HomeProvider>(context,listen: false);
    homeProvider!.getHomeData();
  }
  @override
  Widget build(BuildContext context) {
    homeProvider=Provider.of<HomeProvider>(context,listen: true);
    return SafeArea(child: BaseScreen(body:
    Stack(children: [
      Container(
        child: Column(children: [
          _header(),
          Expanded(child: SingleChildScrollView(child:
          homeProvider!.homeData!=null? Column(children:  [
            AdsWidget(homeProvider!.homeData!.slider!),
            HomeCategoriesListWidget(homeProvider!.homeData!),
          ],):Container(),))

        ],),
      ),
      homeProvider!.isLoading?LoadingProgress():Container()
    ],)));
  }
  Widget _header(){
    return Container(
      margin: EdgeInsets.all(D.default_30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Row(children: [
          Expanded(child: Text(tr("wellcome"),style: S.h1(color: C.GREY_1),),),
          CardIconWidget(),
        ],),
        Text(tr("home_title"),style: S.h3(color: C.GREY_3),),
          SizedBox(height: D.default_20,),
          HomeSearchWidget(),
        ],),
    );
  }

}
