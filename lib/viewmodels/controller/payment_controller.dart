import 'package:get/get.dart';

class PaymentController extends GetxController{
  static RxBool isPaymentSuccess=false.obs;

   void setPaymentFlag(bool isPaymentStatus){
    isPaymentSuccess.value=isPaymentStatus;
    print(isPaymentSuccess.value);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    isPaymentSuccess;
    print(isPaymentSuccess);
    super.onInit();
  }

}