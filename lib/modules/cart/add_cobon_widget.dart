import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart_provider.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/base_botton.dart';
import '../../utils/widgets/base_text_files.dart';

class AddCoboneWidget extends StatefulWidget {
  const AddCoboneWidget({Key? key}) : super(key: key);

  @override
  _AddCoboneWidgetState createState() => _AddCoboneWidgetState();
}

class _AddCoboneWidgetState extends State<AddCoboneWidget> {
  TextEditingController _notesController=TextEditingController();
  CartProvider? cartProvider;
 @override
  void initState() {
    super.initState();
    cartProvider=Provider.of<CartProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    cartProvider=Provider.of<CartProvider>(context,listen: false);
    return  Container(
      color: Colors.white,
      margin: EdgeInsets.only(top: D.default_10),
      padding: EdgeInsets.only(top:D.default_10,bottom: D.default_10,left: D.default_20,right: D.default_20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Container(height: D.default_5,width: D.default_150,color: C.GREY_5,margin: EdgeInsets.all(D.default_10),),),
          Container(
            margin: EdgeInsets.only(bottom: D.default_10),
            child: Text(tr("Save_on_your_order"),style: S.h3(color: C.GREY_1),),),
          BaseTextFiled(
            controller: _notesController,
            hint:tr("copon_num"),
          ),
          SizedBox(height: D.default_20,),
          _DoneButton()
        ],),
    );
  }
  Widget _DoneButton(){
    return BaseButton(
      onItemClickListener: (){
        cartProvider!.getCoupon(context,_notesController.text);
      },
      title:tr("coupon_adding"),
      color: C.BLUE_1,
      textStyle: S.h3(color: Colors.white),
      margin: EdgeInsets.all(D.default_5),
    );
  }

}
