import 'package:abaqe_elnakheal_app/modules/base_screen/base_screen.dart';
import 'package:abaqe_elnakheal_app/utils/constants.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/loading_widget.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../dio/models/region_model.dart';
import '../../dio/models/state_model.dart';
import '../../providers/login_provider.dart';
import '../../providers/regions_provider.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/input_validation_mixin.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/transition_image.dart';
import '../home/items/card_icon.dart';
import '../login_screen/item/back_btn_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with InputValidationMixin {
  final _updateProfileFormGlobalKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nationalIdController = TextEditingController();

  RegionsProvider?regionsProvider;
  RegionsModel? selectedRegion=RegionsModel();
  StatesModel? selectedState=StatesModel();

  LoginProvider?loginProvider;
  CountryCode? selectedCode=CountryCode();



  @override
  void initState() {
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    regionsProvider=Provider.of<RegionsProvider>(context,listen: false);
    super.initState();
    _inituserData();

  }
  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context, listen: true);
    regionsProvider=Provider.of<RegionsProvider>(context,listen: true);
    return BaseScreen(
        body: SafeArea(
      child: Stack(children: [
        Form(
            key: _updateProfileFormGlobalKey,
            child: Column(
              children: [
                _header(context),
                _devider(),
                _userImage(),
                _devider(),
                _userName(),
                _devider(),
                _userPhone(),
                _devider(),
                _userId(),
                _devider(),
                _userCovernat(),
                _devider(),
                _userCity()
              ],
            )),
        loginProvider!.isLoading?LoadingProgress():Container()
      ],),
    ));
  }

  Widget _header(BuildContext ctx) {
    return Container(
      height: D.default_100,
      padding: EdgeInsets.all(D.default_30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BackBottonWidget(ctx),
          Expanded(
              child: Text(
            tr("profile"),
            style: S.h1(color: C.GREY_1),
            textAlign: TextAlign.center,
          )),
          CardIconWidget(),
        ],
      ),
    );
  }

  Widget _userName() {
    return Container(
      padding: EdgeInsets.all(D.default_20),
      margin: EdgeInsets.only(left: D.default_10, right: D.default_10),
      child: Row(
        children: [
          Container(
              width: D.default_120,
              child: Text(
                tr("name"),
                style: S.h4(color: C.GREY_2),
              )),
          Expanded(
              child: Container(
                height: D.default_10,
                child: TextFormField(
                controller: _nameController,
                enabled: true,
                onChanged: (value){
                  setState(() {

                  });
                },
                style: S.h4(color: C.GREY_1),
                textAlign:TextAlign.start ,
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: S.h3(color: C.BLUE_1),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border:InputBorder.none,
                  errorStyle: S.h4(color: Colors.red),
                  contentPadding: EdgeInsets.fromLTRB(D.default_10,D.default_10, D.default_10, D.default_10),
                ),
                keyboardType:TextInputType.text,
                cursorColor: C.BLUE_1,
                autofocus: false,
              ),)),
          _editBtn(),
        ],
      ),
    );
  }

  Widget _userPhone() {
    return Container(
      padding: EdgeInsets.all(D.default_20),
      margin: EdgeInsets.only(left: D.default_10, right: D.default_10),
      child: Row(
        children: [
          Container(
              width: D.default_120,
              child: Text(
                tr("phone_num"),
                style: S.h4(color: C.GREY_2),
              )),
          Expanded(
              child: Container(
                height: D.default_10,
                child: TextFormField(
                controller: _phoneController,
                enabled: true,
                onChanged: (value){
                  setState(() {

                  });
                },
                style: S.h4(color: C.GREY_1),
                textAlign:TextAlign.start ,
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: S.h3(color: C.BLUE_1),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border:InputBorder.none,
                  errorStyle: S.h4(color: Colors.red),
                  contentPadding: EdgeInsets.fromLTRB(D.default_10,D.default_10, D.default_10, D.default_10),
                ),
                keyboardType:TextInputType.phone,
                cursorColor: C.BLUE_1,
                autofocus: false,
              ),)),
          CountryCodePicker(
            onChanged: (country){
              setState(() {
                selectedCode=country;
              });
            },
            textStyle: S.h4(color: C.GREY_1),
            dialogTextStyle: S.h4(color: C.GREY_1),
            padding:EdgeInsets.zero,
            // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
            initialSelection: 'SA',
            // optional. Shows only country name and flag
            showCountryOnly: true,
            // optional. Shows only country name and flag when popup is closed.
            showOnlyCountryWhenClosed: false,
            // optional. aligns the flag and the Text left
            alignLeft: false,
          ),
          _editBtn(),
        ],
      ),
    );
  }

  Widget _userId() {
    return Container(
      padding: EdgeInsets.all(D.default_20),
      margin: EdgeInsets.only(left: D.default_10, right: D.default_10),
      child: Row(
        children: [
          Container(
              width: D.default_120,
              child: Text(
                tr("National_ID"),
                style: S.h4(color: C.GREY_2),
              )),
          Expanded(
              child: Container(
                height: D.default_10,
                child: TextFormField(
                controller: _nationalIdController,
                enabled: true,
                onChanged: (value){
                  setState(() {

                  });
                },
                style: S.h4(color: C.GREY_1),
                textAlign:TextAlign.start ,
                decoration: InputDecoration(
                  hintText: "",
                  hintStyle: S.h3(color: C.BLUE_1),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  border:InputBorder.none,
                  errorStyle: S.h4(color: Colors.red),
                  contentPadding: EdgeInsets.fromLTRB(D.default_10,D.default_10, D.default_10, D.default_10),
                ),
                keyboardType:TextInputType.number,
                cursorColor: C.BLUE_1,
                autofocus: false,
              ),)),
          _editBtn()
        ],
      ),
    );
  }

  Widget _userCovernat() {
    return Container(
      padding: EdgeInsets.all(D.default_20),
      margin: EdgeInsets.only(left: D.default_10, right: D.default_10),
      child: Row(
        children: [
          Container(
              width: D.default_120,
              child: Text(
                tr("region"),
                style: S.h4(color: C.GREY_2),
              )),
          Expanded(child:_regionsSpinner()),
          _editBtn()
        ],
      ),
    );
  }

  Widget _userCity() {
    return Container(
      padding: EdgeInsets.all(D.default_20),
      margin: EdgeInsets.only(left: D.default_10, right: D.default_10),
      child: Row(
        children: [
          Container(
              width: D.default_120,
              child: Text(
                tr("state"),
                style: S.h4(color: C.GREY_2),
              )),
          Expanded(child: _statesSpinner()),
          _editBtn()
        ],
      ),
    );
  }

  Widget _userImage() {
    return Container(
      margin: EdgeInsets.all(D.default_20),
      child: Row(
        children: [
          TransitionImage(
            "assets/images/avatar_img.png",
            height: D.default_60,
            width: D.default_60,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _devider() {
    return Container(
      height: D.default_1,
      color: C.GREY_5,
      width: double.infinity,
    );
  }
  Widget _regionsSpinner(){
    return Container(
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
  Widget _editBtn() {
    return InkWell(
      onTap: () {
        Map<String, dynamic> userData = {
          "phone": _phoneController.text??Constants.currentUser!.phone,
          "email": _emailController.text,
          "username":(_nameController.text+" ").split(" ")[0],
          "last_name": (_nameController.text+" ").split(" ")[1]??"",
          "national_id": _nationalIdController.text??"",
          "state_id": selectedState!.id!,
          "region_id": selectedRegion!.id,
          "phonecode":selectedCode!=null?selectedCode!.dialCode??"+966":"+966"
        };
        loginProvider!.editProfile(userData);
      },
      child: Text(
        tr("edit"),
        style: S.h4(color: C.BLUE_1),
      ),
    );
  }
  void _inituserData(){
     _nameController.text = "${Constants.currentUser!.username!} ${Constants.currentUser!.lastName!}";
     _emailController.text = Constants.currentUser!.email!;
     _phoneController.text = Constants.currentUser!.phone!;
     _nationalIdController.text =Constants.currentUser!.national_id??"".toString() ;
     selectedRegion=regionsProvider!.regions[0];
     selectedState=selectedRegion!.getStates![0];
  }
}
