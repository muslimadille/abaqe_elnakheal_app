import 'package:abaqe_elnakheal_app/dio/models/state_model.dart';
import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/modules/login_screen/login_screen.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/res.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_text_files.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/loading_widget.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../dio/models/region_model.dart';
import '../../providers/cart_provider.dart';
import '../../providers/regions_provider.dart';
import '../main_tabs_screen/main_tabs_screen.dart';
import '../../utils/input_validation_mixin.dart';


class ChangeAddresWidget extends StatefulWidget {
  CartProvider? cartProvider;
   ChangeAddresWidget(this.cartProvider,{Key? key}) : super(key: key);

  @override
  _ChangeAddresWidgetState createState() => _ChangeAddresWidgetState();
}

class _ChangeAddresWidgetState extends State<ChangeAddresWidget> with InputValidationMixin{
  final _loginFormGlobalKey = GlobalKey<FormState>();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _notesController = TextEditingController();

  RegionsProvider?regionsProvider;
  RegionsModel? selectedRegion=RegionsModel();
  StatesModel? selectedState=StatesModel();




  @override
  void initState() {
    super.initState();
    regionsProvider=Provider.of<RegionsProvider>(context,listen: false);
    selectedRegion=regionsProvider!.regions[0];
    selectedState=selectedRegion!.getStates![0];
  }
  @override
  Widget build(BuildContext context) {
    return  Stack(
      fit:StackFit.expand,
      alignment: AlignmentDirectional.center,
      children: [
      Container(
        padding: EdgeInsets.only(left: D.default_40,right: D.default_40),
        width: double.infinity,
        child: Column(children: [
          Expanded(child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image(),
              Center(child: Text(tr("add_new_address"),style: S.h1(color: C.GREY_1),),),
              Center(child: Text(tr("save_address_alert"),style: S.h3(color: C.GREY_3),),),
              SizedBox(height: D.default_20,),
              _loginForm(),
              SizedBox(height: D.default_40,),
              _DoneButton(),
              SizedBox(height: D.default_60,)
            ],),))
        ],),),
      regionsProvider!.isLoading?LoadingProgress():Container()
    ],);
  }
  Widget _image(){
    return Center(child: Lottie.asset(
        "assets/lottie/address_img.json",
        width: D.default_160,
        height:D.default_160,
        alignment: Alignment.center
    ));
  }
  Widget _DoneButton(){
    return BaseButton(
      onItemClickListener: (){
        //Navigator.pop(context);
        _onSaveClicked();
      },
      title:tr("save_address"),
      color: C.BLUE_1,
      textStyle: S.h3(color: Colors.white),
      margin: EdgeInsets.all(D.default_5),
    );
  }
  Widget _loginForm(){
    return Container(child:
    Form(
      key: _loginFormGlobalKey,
      child: Column(
        children: [
          BaseTextFiled(
            controller: _fullNameController,
            hint:tr("full_name"),
            validator: (name) {
              if (isFieldNotEmpty(name!)) {
                return null;
              } else {
                return tr("enter_fullName");
              }
            },
          ),
          SizedBox(height: D.default_15,),
          Row(children: [
            Expanded(child: _regionsSpinner()),
            SizedBox(width: D.default_10,),
            Expanded(child: _statesSpinner()),
          ],),
          SizedBox(height: D.default_15,),
          BaseTextFiled(
            controller: _addressController,
            hint: tr("address"),
            inputType: TextInputType.text,
              validator: (name) {
                if (isFieldNotEmpty(name!)) {
                  return null;
                } else {
                  return tr("enter_address");
                }
              }
          ),
          SizedBox(height: D.default_15,),
          BaseTextFiled(
            controller: _notesController,
            hint: tr("notes"),
              validator: (name) {
                if (isFieldNotEmpty(name!)) {
                  return null;
                } else {
                  return tr("enter_notes");
                }
              }
          ),
        ],
      ),
    ),);
  }
  Widget _regionsSpinner(){
    return Container(
      height:D.default_60,
      margin: EdgeInsets.all(D.default_5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(D.default_10),
            border: Border.all(color: C.GREY_3),
        ),
      child: DropdownButton<RegionsModel>(
          underline:Container(),
        menuMaxHeight: D.default_200,
        borderRadius: BorderRadius.all(Radius.circular(D.default_10)),
        style: TextStyle(color: Colors.blue),
        hint: Container(
          margin: EdgeInsets.all(D.default_10),
          child: Text(selectedRegion!.name!,style: S.h5(color: C.GREY_3),),),
        isExpanded: true,
        items: regionsProvider!.regions.map((RegionsModel value) {
        return DropdownMenuItem<RegionsModel>(
          value: value,
          child: Container(
            child: Text(value.name!,style: S.h4(color: C.GREY_3),),),
        );
      }).toList(),
      onChanged: (value) {
            setState(() {
              selectedRegion=value!;
              selectedState=selectedRegion!.getStates![0];
            });
      },
    ),);
  }
  Widget _statesSpinner(){
    return Container(
      height:D.default_60,
      margin: EdgeInsets.all(D.default_5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(D.default_10),
        border: Border.all(color: C.GREY_3),
      ),
      child: DropdownButton<StatesModel>(
        underline:Container(),
        menuMaxHeight: D.default_200,
        borderRadius: BorderRadius.all(Radius.circular(D.default_10)),
        style: TextStyle(color: Colors.blue),
        hint: Container(
          margin: EdgeInsets.all(D.default_10),
          child: Text(selectedState!.name!,style: S.h5(color: C.GREY_3),),),
        isExpanded: true,
        items: selectedRegion!.getStates!.map((StatesModel value) {
          return DropdownMenuItem<StatesModel>(
            value: value,
            child: Container(
              child: Text(value.name!,style: S.h4(color: C.GREY_3),),),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedState=value!;
          });
        },
      ),);
  }
  _onSaveClicked() {
    if (_loginFormGlobalKey.currentState!.validate()) {
      _loginFormGlobalKey.currentState!.save();
      regionsProvider!.addAddress(context,
          _fullNameController.text,
          _addressController.text,
          _notesController.text,
          selectedRegion!.id!,
          selectedState!.id!,widget.cartProvider!);
    }
  }

}
