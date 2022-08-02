import 'package:abaqe_elnakheal_app/modules/cart/success_screen.dart';
import 'package:abaqe_elnakheal_app/providers/cart_provider.dart';
import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/myUtils.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_botton.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/base_text_files.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:dio/dio.dart';
import 'dart:io';

import 'package:provider/provider.dart';

import '../../utils/input_validation_mixin.dart';
import '../../utils/widgets/loading_widget.dart';




class CompleteOrderWidget extends StatefulWidget {
  const CompleteOrderWidget({Key? key}) : super(key: key);

  @override
  _CompleteOrderWidgetState createState() => _CompleteOrderWidgetState();
}

class _CompleteOrderWidgetState extends State<CompleteOrderWidget> with InputValidationMixin{
  final _loginFormGlobalKey = GlobalKey<FormState>();
  TextEditingController _nationalIdController = TextEditingController();
  File? _nationalImg = null;
  File? _naitratImg = null;

  bool imageValid=true;
  var naitratFile;
CartProvider? cartProvider;
@override
  void initState() {
    super.initState();
    cartProvider=Provider.of<CartProvider>(context,listen: false);
  }

  @override
  Widget build(BuildContext context) {
    cartProvider=Provider.of<CartProvider>(context,listen: true);
    return  Stack(children: [
      Container(
        padding: EdgeInsets.only(left: D.default_40,right: D.default_40),
        width: double.infinity,
        child: Column(children: [
          Expanded(child: SingleChildScrollView(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image(),
              Center(child: Text("استكمال البيانات",style: S.h1(color: C.GREY_1),),),
              Center(child: Text("برجاء استكمال البيانات الاتية لاتمام تنفيذ الطلب",style: S.h3(color: C.GREY_3),),),
              SizedBox(height: D.default_20,),
              _loginForm(),

              SizedBox(height: D.default_40,),
              _DoneButton(),
              SizedBox(height: D.default_60,)
            ],),))
        ],),),
      cartProvider!.isLoading?LoadingProgress(onlyProgress: true,):Container()
    ],);
  }
  Widget _image(){
    return Center(child: Lottie.asset(
        "assets/lottie/upload-files_img.json",
        width: D.default_160,
        height:D.default_160,
        alignment: Alignment.center
    ));
  }
  Widget _DoneButton(){
    return BaseButton(
      onItemClickListener: (){
        //Navigator.pop(context);
        //MyUtils.navigate(context, SuccessScreen());
        _setOrderBody();
      },
      title:tr("submet"),
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
            controller: _nationalIdController,
            hint:tr("national_num"),
            inputType: TextInputType.number,
            validator: (name){
              if (isFieldNotEmpty(name!)) {
                return null;
              } else {
                return tr("national_num");
              }
            },
          ),
         Container(
           width: double.infinity,
           child:  Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Container(
               margin: EdgeInsets.only(bottom: D.default_10,top: D.default_10),
               child: Text(tr("niatrat_hint"),style: S.h4(color: _validNaitratImg?C.GREY_1:Colors.red),),),
             InkWell(
               onTap: (){
                 _naitratImgFromGallery();
               },
               child: Container(
               height: D.default_40,
               width: D.default_120,
               decoration: BoxDecoration(
                   color:_naitratImg==null? C.GREY_4:C.BLUE_1,
                   borderRadius: BorderRadius.circular(D.default_10),
               ),
               child: Center(child: Text(_naitratImg==null?tr("attach"):tr("done"),style: S.h3(color: _naitratImg==null?C.GREY_1:Colors.white),),),

             ),)
           ],),),
          SizedBox(height: D.default_10,),
          Container(
            width: double.infinity,
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: D.default_10,top: D.default_10),
                  child: Text(tr("add_nationalId_hint"),style: S.h4(color:_validNationalImg?C.GREY_1:Colors.red),),),
                InkWell(
                  onTap: (){
                    _nationalImgFromGallery();
                  },
                  child: Container(
                  height: D.default_40,
                  width: D.default_120,
                  decoration: BoxDecoration(
                      color: _nationalImg==null?C.GREY_4:C.BLUE_1,
                      borderRadius: BorderRadius.circular(D.default_10),
                  ),
                  child: Center(child: Text(_nationalImg==null?tr("attach"):tr("done"),style: S.h3(color: _nationalImg==null?C.GREY_1:Colors.white),),),

                ),)
              ],),)
        ],
      ),
    ),);
  }
  _nationalImgFromGallery() async {
    ImagePicker? imagePicker = ImagePicker();
    PickedFile? compressedImage = await imagePicker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      _nationalImg = File(compressedImage!.path);


    });
    String fileName = _nationalImg!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file":
      await MultipartFile.fromFile(_nationalImg!.path, filename:fileName),
    });
    _nationalImg!.length().then((value) => print("image size ${value}"));
  }
  _naitratImgFromGallery() async {
    ImagePicker? imagePicker = ImagePicker();
    PickedFile? compressedImage = await imagePicker.getImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );
    setState(() {
      _naitratImg = File(compressedImage!.path);


    });
    String fileName = _naitratImg!.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file":
      await MultipartFile.fromFile(_naitratImg!.path, filename:fileName),
    });
    _naitratImg!.length().then((value) => print("image size ${value}"));
  }
  bool _validNationalImg=true;
  bool _validNaitratImg=true;
  void _setOrderBody()async{
  if(int.tryParse(_nationalIdController.text)==null){
    Fluttertoast.showToast(msg:tr("add_valid_num"));
  }
  if(_nationalImg==null){
    setState(() {
      _validNationalImg=false;
    });
  }
  if(_naitratImg==null){
    setState(() {
      _validNaitratImg=false;
    });
  }
  if(_loginFormGlobalKey.currentState!.validate()){
    _loginFormGlobalKey.currentState!.save();
    MultipartFile nationalImgFile = await MultipartFile.fromFile(
      _nationalImg!.path, filename:  _nationalImg!.path.split('/').last,
      contentType: MediaType("image",  _nationalImg!.path.split('/').last.split(".").last),);

    MultipartFile naitratImgFile = await MultipartFile.fromFile(
      _naitratImg!.path, filename:  _naitratImg!.path.split('/').last,
      contentType: MediaType("image",  _naitratImg!.path.split('/').last.split(".").last),);


    if(cartProvider!.myCartModel!.userAddresses!.isNotEmpty){
      FormData formData =  FormData.fromMap({
        "code":cartProvider!.couponeCode,
        "address_id":cartProvider!.myCartModel!.userAddresses![0].id,
        "notes":"",
        "nitrates_image":nationalImgFile,
        "national_id_image":naitratImgFile,
        "national_id":_nationalIdController.text,

      });
      cartProvider!.addOrderBody=formData;
      cartProvider!.addOrder(context);
    }else{
      Fluttertoast.showToast(msg:tr("add_address"));

    }
  }

  }
}
