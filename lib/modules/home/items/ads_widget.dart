import 'package:abaqe_elnakheal_app/utils/baseDimentions.dart';
import 'package:abaqe_elnakheal_app/utils/base_text_style.dart';
import 'package:abaqe_elnakheal_app/utils/my_colors.dart';
import 'package:abaqe_elnakheal_app/utils/widgets/transition_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../dio/models/home_slider_model.dart';

class AdsWidget extends StatefulWidget {
  AdsWidget(this.sliders);

  List<HomeSliderModel> sliders;

  @override
  State<AdsWidget> createState() => _AdsWidgetState();
}

class _AdsWidgetState extends State<AdsWidget> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _autoSlid();
    return Container(
      width: double.infinity,
      height: D.default_180,
      margin: EdgeInsets.only(
          left: D.default_30, right: D.default_30, bottom: D.default_30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(D.default_10),
        color: Colors.white,
      ),
      child: Stack(
        clipBehavior: Clip.none,
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          Positioned(
            child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                height: D.default_150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(D.default_10),
                  color: C.BLUE_1.withOpacity(0.3),
                )),
            bottom: -D.default_10,
          ),
          Stack(
            clipBehavior: Clip.none,
            alignment: AlignmentDirectional.center,
            fit: StackFit.expand,
            children: [
              Container(
                width: double.infinity,
                height: D.default_180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(D.default_10),
                  color: C.BLUE_1.withOpacity(0.5),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(opacity: animation, child: child);
                },
                child: TransitionImage(widget.sliders[currentIndex].item!.photo??"assets/images/banner_demo_img.png",
                    width: double.infinity,
                    height: D.default_180,
                    fit: BoxFit.cover,
                    radius: D.default_15,
                    key: ValueKey<int>(currentIndex)),
              ),
              Container(
                width: double.infinity,
                height: D.default_180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(D.default_10),
                  color: C.BLUE_1.withOpacity(0.5),
                ),
              ),
              Container(
                padding: EdgeInsets.all(D.default_20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: D.default_100,
                      height: D.default_30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(D.default_10),
                        color: C.BLUE_1,
                      ),
                      child: Center(
                          child: Text(
                        tr("today_offer"),
                        style: S.h4(color: Colors.white),
                      )),
                    ),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                scale: animation, child: child);
                          },
                          child: Text(
                            widget.sliders[currentIndex].title!,
                            style: S.h1(color: Colors.white),
                            key: ValueKey<int>(currentIndex),
                          ),
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 500),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return ScaleTransition(
                                scale: animation, child: child);
                          },
                          child: Text(widget.sliders[currentIndex].description!,
                              style: S.h5(color: Colors.white),
                              key: ValueKey<int>(currentIndex)),
                        )
                      ],
                    )),
                    Container(
                      width: D.default_100,
                      height: D.default_35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(D.default_100),
                        color: Colors.white,
                      ),
                      child: Center(
                          child: Text(
                        tr("shop_now"),
                        style: S.h3(color: C.BLUE_1),
                      )),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  void _autoSlid() {
    Future.delayed(Duration(milliseconds: 8000)).then((value) {
      if (currentIndex < widget.sliders.length - 1) {
        setState(() {
          currentIndex = currentIndex + 1;
        });
      } else {
        setState(() {
          currentIndex = 0;
        });
      }
    });
  }
}
