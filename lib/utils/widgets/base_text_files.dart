import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../base_text_style.dart';
import '../input_validation_mixin.dart';
import '../my_colors.dart';

class BaseTextFiled extends StatefulWidget {
  TextEditingController controller;
  String? hint;
  TextInputType?inputType;
  bool isPassword;
   BaseTextFiled({required this.controller,this.hint, this.inputType,this.isPassword=false});

  @override
  _BaseTextFiledState createState() => _BaseTextFiledState();
}

class _BaseTextFiledState extends State<BaseTextFiled> with InputValidationMixin{
  bool passwordobsecure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: TextFormField(
          controller: widget.controller,
          validator: (name) {
            if (isFieldNotEmpty(name!)) {
              return null;
            } else {
              return tr("");
            }
          },
          style: S.h3(color: C.GREY_1),
          decoration: InputDecoration(
              labelText: widget.hint,
              labelStyle: S.h4(color: C.GREY_3),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: C.BLUE_1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: C.BLUE_1),
              borderRadius: BorderRadius.circular(10.0),
            ),
            errorStyle: S.h4(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              suffixIcon: widget.isPassword?IconButton(
                onPressed: () {
                  setState(() {
                    passwordobsecure
                        ? passwordobsecure = false
                        : passwordobsecure = true;
                  });
                },
                icon: Icon(
                  (passwordobsecure )
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: C.GREY_4,
                ),
              ):null
          ),
          keyboardType: widget.inputType??TextInputType.text,
          obscureText: false,
          cursorColor: C.GREY_2,
          autofocus: false,
        ));
  }

}
