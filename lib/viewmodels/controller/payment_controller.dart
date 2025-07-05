import 'package:get/get.dart';

class PaymentController extends GetxController{
  static RxBool isPaymentSuccess=false.obs;

   void setPaymentFlag(bool isPaymentStatus){
    isPaymentSuccess.value=isPaymentStatus;
    update();
  }
}