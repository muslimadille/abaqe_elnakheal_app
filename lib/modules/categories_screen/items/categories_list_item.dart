import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:flutter/material.dart';
import '../../../dio/models/home_category_model.dart';
import '../../../main.dart';

class CategoryListItem extends StatefulWidget {
  int index;
  OnItemClickListener? onItemClickListener;
  List<HomeCategoryModel>? categories;
  
  CategoryListItem(this.categories,this.index,this.onItemClickListener) ;

  @override
  _CategoryListItemState createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  _CategoryListItemState();
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onItemClickListener,
      child:_body() ,
    );
  }
  Widget _body(){
    return Container(child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Container(
          margin:EdgeInsets.only(left:D.default_5,right:D.default_5,top: D.default_10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_10),
          ),
          child: TransitionImage(
            widget.categories![widget.index].photo??"assets/images/bzor.png",
            fit: BoxFit.cover,
            height:D.default_100,
            radius: D.default_10,
          )),
      Text(widget.categories![widget.index].name??"",style: S.h4(color: C.GREY_1),)
    ],),) ;
  }

}


