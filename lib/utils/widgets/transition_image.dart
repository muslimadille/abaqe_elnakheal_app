


import 'dart:io';

import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:shimmer/shimmer.dart';


class TransitionImage extends StatefulWidget {
  TransitionImage(this.url,
      {this.file,
        this.width,
        this.height,
        this.fit,
        this.asset,
        this.padding,
        this.radius = 0,
        this.strokeColor,
        this.strokeWidth,
        this.backgroundColor,
        this.placeHolder,
        this.placeWidget,
        this.placeHolderImage,
        this.fillColor,
        this.placeHolderColor,
        this.isGreyScaled = false,
        this.onErrorLoading,
        Key? key})
      : super(key: key);

  String url = "";
  File? file;
  double? width;
  double? height;
  BoxFit? fit;
  Asset? asset;
  EdgeInsets? padding;
  double radius = 0;
  Color? strokeColor;
  double? strokeWidth;
  Color? backgroundColor;
  IconData? placeHolder;
  Widget? placeWidget;
  String? placeHolderImage;
  Color? fillColor;
  Color? placeHolderColor;
  bool isGreyScaled = false;
  Function(String)? onErrorLoading;

  @override
  _TransitionImageState createState() => _TransitionImageState();
}

class _TransitionImageState extends State<TransitionImage> {
  ColorFilter greyscale = ColorFilter.matrix(<double>[
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0.2126,
    0.7152,
    0.0722,
    0,
    0,
    0,
    0,
    0,
    1,
    0,
  ]);

  @override
  Widget build(BuildContext context) {
    print(widget.url);
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 0,
      margin: EdgeInsets.zero,
      color: widget.backgroundColor == null
          ? Colors.transparent
          : widget.backgroundColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: widget.strokeColor ?? Colors.transparent,
              width: widget.strokeWidth ?? 2),
          borderRadius: BorderRadius.all(Radius.circular(widget.radius))),
      child: widget.isGreyScaled
          ? ColorFiltered(colorFilter: greyscale, child: child())
          : child(),
    );
  }

  Widget child() {
    return widget.file != null
        ? Container(
      padding: widget.padding,
      child: Image.file(
        widget.file!,
        fit: widget.fit ?? BoxFit.contain,
      ),
      height: widget.height,
      width: widget.width,
    )
        : widget.asset != null
        ? Container(
      padding: widget.padding,
      height: widget.height,
      width: widget.width,
      child:
      AssetThumb(asset: widget.asset!, height: 1000, width: 1000),
    )
        : widget.url.isEmpty
        ? Image.asset(
      "",
      fit: widget.fit ?? BoxFit.contain,
      color: widget.fillColor,
    )
        : widget.url.contains("assets")
        ? Container(
      padding: widget.padding,
      child: widget.url.contains(".svg")
          ? SvgPicture.asset(
        widget.url,
        fit: widget.fit ?? BoxFit.contain,
      )
          : Image.asset(
        widget.url,
        fit: widget.fit ?? BoxFit.contain,
        color: widget.fillColor,
      ),
      height: widget.height,
      width: widget.width,
    )
        : widget.url.contains("/data/user/")
        ? Container(
      padding: widget.padding,
      child: Image.file(
        File(widget.url),
        fit: widget.fit ?? BoxFit.contain,
      ),
      height: widget.height,
      width: widget.width,
    )
        : Container(
      padding: widget.padding,
      child: widget.url.contains(".svg")
          ? SvgPicture.network(widget.url)
          : CachedNetworkImage(
          imageUrl: widget.url,
          fit: widget.fit ?? BoxFit.contain,
          progressIndicatorBuilder:
              (context, url, progress) {
            return Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[400]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[400]!,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            );
          },
          /*placeholder: (context, url) {
            return Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            );
          },*/
          errorWidget: (context, url, error) {
            print("TransitionImage : Error : $error");
            if(widget.onErrorLoading != null) widget.onErrorLoading!(error != null ? error.toString() : "");

            return Image.asset(
              widget.placeHolderImage??"assets/images/placeholder.png",
              fit: BoxFit.cover,
            );
          }),
      width: widget.width,
      height: widget.height,
    );
  }
}

