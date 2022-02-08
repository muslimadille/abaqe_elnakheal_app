import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/baseDimentions.dart';
import '../../utils/base_text_style.dart';
import '../../utils/my_colors.dart';
import '../../utils/widgets/base_botton.dart';
import '../../utils/widgets/transition_image.dart';
import '../base_screen/base_screen.dart';
import '../home/items/card_icon.dart';
import '../login_screen/item/back_btn_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';



class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<Widget> images=[
    TransitionImage(
      "assets/images/rice_img.png",
      height: D.default_200,
      width: double.infinity,
      fit: BoxFit.cover,
      radius: D.default_10,
    ),TransitionImage(
      "assets/images/rice_img.png",
      height: D.default_200,
      width: double.infinity,
      fit: BoxFit.cover,
      radius: D.default_10,
    ),TransitionImage(
      "assets/images/rice_img.png",
      height: D.default_200,
      width: double.infinity,
      fit: BoxFit.cover,
      radius: D.default_10,
    )
  ];

  final _controller = PageController();
  TextEditingController? _textController=TextEditingController();
  bool _showCounter=false;
  int _currentSliderPager=0;
  double _btnWidth=D.default_300*1.3;
  double _counterOpacity=1;
  String btnTitle=tr("add_to_crd");

  @override
  void initState() {
    super.initState();
    _textController!.text="1";
  }
  @override
  Widget build(BuildContext context) {
    return BaseScreen(body: SafeArea(child: Stack(
      clipBehavior: Clip.none,
      alignment:AlignmentDirectional.topCenter,
      children: [
        Positioned(
          child: TransitionImage("assets/images/product_details_bgn.png",fit: BoxFit.fitWidth,
            width:MediaQuery.of(context).size.width),
        ),
        Container(
          margin: EdgeInsets.only(left: D.default_30,right: D.default_30),
          width: double.infinity,
          child: Column(children: [
            _header(context),
            _ratePriceHeader(),
            _imageSlider(),
            SizedBox(height: D.default_20,),
            Expanded(child: SingleChildScrollView(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Container(width: double.infinity,child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("سماد طبيعي للتزهير والانبات بتركيز10%",style: S.h2(color: C.GREY_1),),
                    _remainsProducts(),
                    _ratingPart(),
                    SizedBox(height: D.default_10,),
                    Text("عن المنتج",style: S.h1(color: C.GREY_1,underline: true),),
                    Text("لوريم إيبسوم(Lorem Ipsum) هو ببساطة نص شكلي (بمعنى أن الغاية هي الشكل وليس المحتوى .",style: S.h3(color: C.GREY_3,underline: false),),
                    _condetions(),
                  ],),),
                _AddPart()

              ],),))
          ],),)
      ],
    ),));
  }

  Widget _header(BuildContext ctx){
    return Container(
      height: D.default_100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          BackBottonWidget(ctx,color: Colors.white,),
          Expanded(child: Text("تفاصيل المنتج",style: S.h1(color: Colors.white,),textAlign: TextAlign.center,)),
          CardIconWidget(isDarkBG: true,),

        ],),);

  }
   Widget _ratePriceHeader(){
    return Container(
      width: double.infinity,
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin:EdgeInsets.only(left:D.default_10,right:D.default_10),
          padding:EdgeInsets.only(top:D.default_5,bottom:D.default_5,left:D.default_10,right:D.default_10),
          height: D.default_30,
          width: D.default_60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(D.default_50),
              color: Colors.white,
          ),
          child: Center(child: Row(children: [
            Expanded(child: Text("4.5",style: S.h5(color: C.GREY_1),textAlign: TextAlign.center,)),
            Icon(Icons.star,color: Colors.orange,size: D.default_15,)
          ],),),),
        Text("10جم",style: S.h2(color: Colors.white),)

    ],),);
  }
  Widget _imageSlider(){
    return Container(
      width: double.infinity,
      height: D.default_230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(child: PageView(
            children: images,
            controller: _controller,
            onPageChanged: (currentpage) {
              setState(() {
                _currentSliderPager=currentpage;
              });
            },
          )),
          SizedBox(height: D.default_10,),
          DotsIndicator(
            dotsCount: images.length,
            position: _currentSliderPager.toDouble(),
            decorator: DotsDecorator(
                color: C.BLUE_1.withOpacity(0.3),
                activeColor: C.BLUE_1,
                activeSize:Size(D.default_10,D.default_10),
                size:Size(D.default_10,D.default_10),
                spacing:EdgeInsets.all(D.default_5)
            ),
          )

        ],
      ),);
  }
  Widget _remainsProducts(){
    return Container(
      margin: EdgeInsets.only(top: D.default_10),
      child: Row(
      crossAxisAlignment:CrossAxisAlignment.center,
      children: [
      Icon(Icons.info_outline,color: C.BLUE_3,size: D.default_25,),
      SizedBox(width: D.default_5,),
      Text("متبقي 100 كيلو فقط من هذا المنتج",style: S.h3(color: C.BLUE_3),)
    ],),);
  }
  Widget _ratingPart(){
    return InkWell(
      onTap: (){
        _showBottomSheet(Container());
      },
      child: Container(
      margin: EdgeInsets.only(top: D.default_10),
      child: Row(
        children: [
          RatingBarIndicator(
            rating: 4.50,
            itemBuilder: (context, index) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemCount: 5,
            itemSize: D.default_25,
            direction: Axis.horizontal,
            unratedColor: C.GREY_4,

          ),
          SizedBox(width: D.default_10,),
          Text("(23 تقييم)",style: S.h3(color: Colors.amber,))
        ],
      ),),);
  }
  Widget _condetions(){
    return Container(
      margin: EdgeInsets.only(top: D.default_20,bottom: D.default_20),
      child: Column(children: [
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.check,color: C.BLUE_1,),
          Text("كل المنتجات حاصلة علي موافقه وزارة الصحة",style: S.h3(color: C.GREY_3),)
        ],),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Icons.check,color: C.BLUE_1,),
          Text("تعبئة وحفظ في الظروف المناسبة لطبيعة كل منتج",style: S.h3(color: C.GREY_3),)
        ],)
    ],),);
  }
  Widget _AddPart(){
    return Container(
      width: D.default_300*1.5,
      height: D.default_60,
      child: Stack(
        alignment:AlignmentDirectional.centerStart ,
        children: [
          Positioned(child: _counter(),right: 0,),
          Positioned(child: AnimatedContainer(
            width: _btnWidth,
            duration: Duration(milliseconds: 300),
            child: BaseButton(onItemClickListener: () {
              setState(() {
                _showCounter? _showCounter=false:_showCounter=true;
                if(_showCounter){
                  _btnWidth=D.default_180*1.05;
                  _counterOpacity=1;
                   btnTitle=tr("added_to_crd");

                }else{
                  _btnWidth=D.default_300*1.3;
                  _counterOpacity=0;
                  btnTitle=tr("add_to_crd");
                }
              });
            }, title:btnTitle,height: D.default_60,enableShadow: false,margin: EdgeInsets.zero,),),left: 0,),

        ],
      )
    );
  }
  Widget _counter(){
    return AnimatedOpacity(opacity: _counterOpacity, duration: Duration(milliseconds: 400),child: Container(
      height: D.default_60,
      width: D.default_180*1.05,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(D.default_10),
        color: Colors.white,
        border: Border.all(width: D.default_1,color: C.BLUE_1),
      ),
      child: Row(children: [
        Expanded(child: TextFormField(
          controller: _textController,
          onChanged: (value){
            setState(() {
              if(value.isEmpty){
                _textController!.text="1";
              }else{
                _textController!.text=value;
              }
            });
          },
          style: S.h2(color: C.GREY_1),
          decoration: InputDecoration(
            labelText: "الكمية",
            labelStyle: S.h3(color: C.BLUE_1),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            border:InputBorder.none,
            errorStyle: S.h4(color: Colors.red),
            contentPadding: EdgeInsets.fromLTRB(D.default_10,D.default_10, D.default_10, D.default_10),
          ),
          keyboardType:TextInputType.number,
          cursorColor: Colors.white,
          autofocus: false,
        ),),
        Container(
          width: D.default_40,
          child: Text("كيلو",style: S.h3(color:C.BLUE_1),),)
      ],),
    ),);
  }
  void _showBottomSheet(Widget body){
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        controller: ModalScrollController.of(context),
        child: Container(width: double.infinity,height: D.default_300,color: Colors.white,),
      ),
    );
  }
}
