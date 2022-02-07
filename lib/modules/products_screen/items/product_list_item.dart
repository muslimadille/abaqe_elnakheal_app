import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';

class ProductsListItem extends StatefulWidget {
  int index;
  OnItemClickListener? onItemClickListener;

  ProductsListItem(this.index,this.onItemClickListener) ;

  @override
  _ProductsListItemState createState() => _ProductsListItemState();
}

class _ProductsListItemState extends State<ProductsListItem> {
  _ProductsListItemState();
  bool _showCounter=false;

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
    return Container(
      margin: EdgeInsets.all(D.default_10),
      width: D.default_150,
      height: D.default_200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_10),
          color: Colors.white,
          boxShadow:[BoxShadow(
              color: C.BLUE_1.withOpacity(0.3),
              offset:Offset(1,1),
              blurRadius:5,
              spreadRadius: 1
          )]
      ),
      child: Stack(
        children: [

          Container(
            margin: EdgeInsets.all(D.default_10),
            child:Column(children: [
              _image(),
              _description(),
              _coast(),
              _addToCard()

            ],),
          ),_discoundWidget(),
        ],
      ),
    ) ;
  }
  Widget _image(){
    return TransitionImage(
      "assets/images/rice_img.png",
      height: D.default_120,
      width: double.infinity,
      fit: BoxFit.cover,
      radius: D.default_10,
    );
  }
  Widget _discoundWidget(){
    return Container(
      height: D.default_30,
      width: D.default_80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(D.default_10),bottomLeft: Radius.circular(D.default_10)),
        color: C.BLUE_1,
      ),
      child: Center(child: Text("خصم10%",style: S.h5(color: Colors.white),),),
    );
  }
  Widget _description(){
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top:D.default_10),
        child: Text("سماد طبيعي للتزهير بتركيز 10%",style: S.h4(color: C.GREY_3),),),
    );
  }
  Widget _coast(){
    return Container(child:
    Row(children: [
      Text("10جم",style: S.h4(color: C.BLUE_1),),
      Text("/",style: S.h4(color: C.BLUE_1),),
      Text("15جم",style: S.h4(color: C.GREY_3,decoration: TextDecoration.lineThrough),)
    ],),);
  }
  Widget _addToCard(){
    return Container(child:
    _showCounter?
    _counter()
        :BaseButton(onItemClickListener: () {
          setState(() {
            _showCounter? _showCounter=false:_showCounter=true;
          });
    }, title:tr("add_to_crd"),height: D.default_40,),);
    
  }
  Widget _counter(){
    return Container(
      margin: EdgeInsets.only(top:D.default_12,bottom:D.default_12),
      child: Row(children: [
      _bottonWidget(Icons.add,(){
        setState(() {
          _showCounter? _showCounter=false:_showCounter=true;
        });
      }),
      Expanded(child: Text("1 كيلو",style: S.h4(color: C.GREY_3),textAlign: TextAlign.center,)),
      _bottonWidget(Icons.delete_outlined,(){
        setState(() {
          _showCounter? _showCounter=false:_showCounter=true;
        });
      }),

    ],),);
  }
  Widget _bottonWidget(IconData icon,Function onClick){
    return Container(
      height: D.default_35,
        width: D.default_35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(D.default_5),
          color: C.BLUE_2.withOpacity(0.4),
        ),
        child: InkWell(
          onTap: (){onClick();},
          child: Center(child:  Icon(icon,color: C.BLUE_1,size: D.default_25,),),)) ;
  }
}
