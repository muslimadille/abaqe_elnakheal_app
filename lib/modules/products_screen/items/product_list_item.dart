import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../dio/models/product_model.dart';
import '../../../main.dart';
import '../../../providers/cart_provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/myUtils.dart';
import '../../../utils/widgets/loading_widget.dart';
import '../../login_screen/login_screen.dart';

class ProductsListItem extends StatefulWidget {
  int index;
  ProductModel productModel;
  OnItemClickListener? onItemClickListener;

  ProductsListItem(this.productModel,this.index,this.onItemClickListener,key):super(key: key) ;

  @override
  _ProductsListItemState createState() => _ProductsListItemState();
}

class _ProductsListItemState extends State<ProductsListItem> {
  _ProductsListItemState();
  bool _showCounter=false;
  CartProvider? cartProvider;

  @override
  void initState() {
    super.initState();
    cartProvider=Provider.of<CartProvider>(context,listen: false);
    WidgetsBinding.instance!.addPostFrameCallback((_) async {

    });
  }
  @override
  Widget build(BuildContext context) {
    cartProvider=Provider.of<CartProvider>(context,listen: true);
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
          cartProvider!.clickedIndex==widget.index&&cartProvider!.isLoading?LoadingProgress(onlyProgress: true,):Container()
        ],
      ),
    ) ;
  }
  Widget _image(){
    return TransitionImage(
      widget.productModel.photo??"assets/images/rice_img.png",
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
      child: Center(child: Text("${tr("discount")} ${widget.productModel.discountPercentage}%",style: S.h5(color: Colors.white),),),
    );
  }
  Widget _description(){
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top:D.default_10),
        child: Text("${widget.productModel.title}",style: S.h4(color: C.GREY_3),),),
    );
  }
  Widget _coast(){
    return Container(child:
    Row(children: [
      Text("${widget.productModel.offerPrice}",style: S.h4(color: C.BLUE_1),),
      Text("/",style: S.h4(color: C.BLUE_1),),
      Text("${widget.productModel.price}",style: S.h4(color: C.GREY_3,decoration: TextDecoration.lineThrough),)
    ],),);
  }
  Widget _addToCard(){
    return Container(child:
    widget.productModel.cartCount!>0?
    _counter()
        :BaseButton(onItemClickListener: () {
          setState(() async{
            //call add api
            if(Constants.currentUser==null){
              MyUtils.navigateReplaceCurrent(Constants.tabScreenContext!, LoginScreen());
            }else{
              cartProvider!.setClickedIndex(widget.index);
              await cartProvider!.addToCart(widget.productModel.id!,widget.productModel.minQuantity!);
              widget.productModel.cartCount=widget.productModel.minQuantity;
              _showCounter? _showCounter=false:_showCounter=true;
            }
          });
    }, title:tr("add_to_crd"),height: D.default_40,),);
    
  }
  Widget _counter(){
    return Container(
      margin: EdgeInsets.only(top:D.default_12,bottom:D.default_12),
      child: Row(children: [
      _bottonWidget(Icons.add,(){
        setState(() async{
          //call add api
          cartProvider!.setClickedIndex(widget.index);
          await cartProvider!.addToCart(widget.productModel.id!,widget.productModel.cartCount!+1);
          widget.productModel.cartCount=widget.productModel.cartCount!+1;
        });
      }),
      Expanded(child: Text("${widget.productModel.cartCount} ${tr("kg")}",style: S.h4(color: C.GREY_3),textAlign: TextAlign.center,)),
      _bottonWidget(Icons.delete_outlined,(){
        setState(() async{
          //call delete product api
          if(widget.productModel.cartCount!>widget.productModel.minQuantity!){
            cartProvider!.setClickedIndex(widget.index);
            await cartProvider!.addToCart(widget.productModel.id!,widget.productModel.cartCount!-1);
            widget.productModel.cartCount=widget.productModel.cartCount!-1;
          }else{
            cartProvider!.setClickedIndex(widget.index);
            await cartProvider!.addToCart(widget.productModel.id!,0);
            widget.productModel.cartCount=0;
          }

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
