import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/view/screens/freePlanScreen/menusubpages/plans.dart';
import 'package:zidney/viewmodels/controller/payment_controller.dart';

class TestScreen extends StatelessWidget {
   TestScreen({super.key});

  final _testController=Get.put(AppTestColors());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Obx(()=>Container(
              height: 200,
              width: 200,
              color: AppTestColors.primaryColor.value,
            ),),
            SizedBox(height: 100,),
            ElevatedButton(onPressed: (){
              Get.back();
            }, child: Text("Back")),
            ElevatedButton(onPressed: (){
              Get.to(()=>Plans());
            }, child: Text("Next")),
          ],
        ),
      ),
    );
  }
}







class AppTestColors extends GetxController{

  //static  Color primaryColor = Color(0xFFFBAF15);
  static  var primaryColor = Rx<Color>(Color(0xFFFBAF15));
  static  var secondaryColor = Rx<Color>(Color(0xff713694));
  //static  Color secondaryColor = Color(0xff713694);
  static const Color primaryShadow = Color(0xffE49F13);
  static const Color primaryLightColor = Color(0xFFFFF7E8);
  static const Color secondaryShadow = Color(0xff673187);
  static const Color green = Color(0xffA5CD39);
  static const Color red = Color(0xFFE32222);
  static const Color grey = Color(0xFFC7C0BD);
  static const Color greyShadow = Color(0xFF85766F);
  static const Color chocolate = Color(0xFF4D3D36);
  static const Color chocolateShadow = Color(0xFF200D04);
  static const Color buttonGreen = Color(0xFFC3DE7A);
  static const Color buttonGreenShadow = Color(0xFFA5CD39);
  static const Color lightPink =  Color(0xFFf1ebf4);
  static const Color blackColor =  Color(0xFF000000);
  static const Color navigationColor =  Color(0xFFFFF7E8);
  static const Color whiteColor =  Color(0xFFFFFFFF);
  static const Color navigationColorRed = Color(0xFFFCE9E9);





  changeColor(bool isPaymentSuccess){
    if(isPaymentSuccess){
      primaryColor.value = Color(0xff713694);
      secondaryColor.value = Color(0xFFFBAF15);
    }else{

      // primaryShadow = Color(0xffE49F13);
      // primaryLightColor = Color(0xFFFFF7E8);
      // secondaryShadow = Color(0xff673187);
      // green = Color(0xffA5CD39);
      // red = Color(0xFFE32222);
      // grey = Color(0xFFC7C0BD);
      // greyShadow = Color(0xFF85766F);
      // chocolate = Color(0xFF4D3D36);
      // chocolateShadow = Color(0xFF200D04);
      // buttonGreen = Color(0xFFC3DE7A);
      // buttonGreenShadow = Color(0xFFA5CD39);
      // lightPink =  Color(0xFFf1ebf4);
      // blackColor =  Color(0xFF000000);
      // navigationColor =  Color(0xFFFFF7E8);
      // whiteColor =  Color(0xFFFFFFFF);
      // navigationColorRed = Color(0xFFFCE9E9);


    }
    update();
  }


}


