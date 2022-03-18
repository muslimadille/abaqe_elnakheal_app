import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/home/items/card_icon.dart';
import 'package:abaqe_elnakheal_app/modules/login_screen/item/back_btn_widget.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/search_provider.dart';
import '../../utils/widgets/loading_widget.dart';
import '../../utils/widgets/no_data_widget.dart';
import '../home/items/home_search_widget.dart';
import 'items/products_list_widget.dart';

class ProductsListScreen extends StatefulWidget {
  int? gategoryId;
  String? title;
  bool isSearch;
  ProductsListScreen({this.gategoryId,this.title,this.isSearch=false}) ;

  @override
  State<ProductsListScreen> createState() => _ProductsListScreenState();
}

class _ProductsListScreenState extends State<ProductsListScreen> {
  TextEditingController? _searchController=TextEditingController();

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: SafeArea(child:
    Stack(children: [
      Container(
        child: Column(children:  [
          _header(context),
          SizedBox(height: D.default_10,),
          Expanded(child: ProductsBodyScreen(widget.isSearch,_searchController,widget.gategoryId))
        
        ],),
      ),
      //searchProvider!.isLoading?LoadingProgress():Container()
    ],),));
  }

  Widget _header(BuildContext ctx){
    return Container(
      height: D.default_160,
      padding: EdgeInsets.only(top:D.default_20,left:D.default_30,right:D.default_30),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BackBottonWidget(ctx),
              Expanded(child: Text(widget.title!,style: S.h1(color: C.GREY_1),textAlign: TextAlign.center,)),
              CardIconWidget(),

            ],),
          _search(),
        ],
      ),);

  }

  Widget _search(){
    return Container(
      height:D.default_60,
      padding: EdgeInsets.all(D.default_5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(D.default_20),
        color: C.GREY_5,
      ),
      child: Row(children: [
        SizedBox(width: D.default_10,),
        Icon(Icons.search,size: D.default_30,color: C.BLUE_1,),
        Expanded(
          child: Container(
            padding: EdgeInsets.all(D.default_10),
            child: TextFormField(
            controller: _searchController,
            onChanged: (value){
              setState(() {

              });
            },
            style: S.h2(color: C.GREY_1),
            decoration: InputDecoration(
              hintText: tr("search_for_product"),
              hintStyle: S.h3(color: C.GREY_3),
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              border:InputBorder.none,
              errorStyle: S.h4(color: Colors.red),
              contentPadding: EdgeInsets.fromLTRB(D.default_10,D.default_10, D.default_10, D.default_10),
            ),
            keyboardType:TextInputType.text,
            cursorColor: Colors.white,
            autofocus: false,
          ),),)
      ],),
    );

  }
}
class ProductsBodyScreen extends StatefulWidget {
  TextEditingController? _searchController=TextEditingController();
  bool isSearch;
  int? gategoryId;

  ProductsBodyScreen(this.isSearch,this._searchController,this.gategoryId);

  @override
  State<ProductsBodyScreen> createState() => _ProductsBodyScreenState();
}

class _ProductsBodyScreenState extends State<ProductsBodyScreen> {
  SearchProvider?searchProvider;

  @override
  void initState() {
    super.initState();
    searchProvider=Provider.of<SearchProvider>(context,listen: false);
    if(widget.gategoryId!=null){
      searchProvider!.search(categoryId: widget.gategoryId);
    }
    if(widget.isSearch){
      searchProvider!.searchModel=null;
    }
    widget._searchController!.addListener(() {
      searchProvider!.search(searchKey: widget._searchController!.text);
    });
  }
  @override
  Widget build(BuildContext context) {
    searchProvider=Provider.of<SearchProvider>(context,listen: true);
    return Column(children: [
      Expanded(child: _screenSelector())
    ],);
  }
  Widget _screenSelector(){
    if(widget.isSearch&&widget._searchController!.text.isEmpty){
      return NoDataWidget(image:"assets/lottie/search_lottie.json",title:tr("search"),subTitle:tr("start_search"),height: D.default_150,);
    }
    if(((widget.isSearch&&widget._searchController!.text.isNotEmpty)||(!widget.isSearch&&widget._searchController!.text.isEmpty))&&!searchProvider!.isLoading&&searchProvider!.searchModel!.data!.isEmpty){
      return NoDataWidget(image:"assets/lottie/shopping_error_bg.json",title:tr("no_search"),subTitle:tr(""),height: D.default_150,);
    }else{
      if(searchProvider!.isLoading){return Stack(
        fit:StackFit.expand,
        children: [
        Container(color: Colors.white,),
        LoadingProgress()
      ],);}else{
        return ProductsListWidget(searchProvider!.searchModel!.data!);
      }

    }
  }

}

