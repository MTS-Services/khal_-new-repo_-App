import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/view/auth/auth_api_services/auth_api_services.dart';
import 'package:zidney/view/auth/login_screen1.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/app_background.dart';
import '../../utils/asset_path.dart';
import '../screens/freePlanScreen/questionquiz/widgets/custom_conditional_buton.dart';
import '../screens/freePlanScreen/questionquiz/widgets/custom_button.dart';
import '../screens/freePlanScreen/questionquiz/widgets/custom_logo.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});
  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final List<String> languages = [
    'English',
    'عربي',
    'Español',
    'Italiano',
    'हिन्दी',
  ];
  final List<String> flags = [
    AssetPath.americaFlag,
    AssetPath.saudiFlag,
    AssetPath.spainFlag,
    AssetPath.italyFlag,
    AssetPath.indiaFlag,
  ];
  int? selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        showBgImage: 1,
        isScrollable: false,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomLogo(
                  subTitleText: 'The one you are comfortable with ',
                  titleText: 'Select Your language first',
                ),
                SizedBox(height: 10.h),
                ...List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CustomConditionalButton(
                      isSelected: selectedIndex == index,
                      buttonText: languages[index],
                      prefix: Image.asset(flags[index], height: 25.h),
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    ),
                  );
                }),
                CustomButton(
                  width: AppStyles.screenHeightPercentage(context, 0.15),
                  onTap: () {
                    if (selectedIndex != null) {
                      String selectedLanguage = languages[selectedIndex!];

                      Get.to(() => LoginScreen1());
                    }
                  },
                  buttonText: 'Select',
                  prefix: Image.asset(AssetPath.logInIcon, height: 25.h),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          AuthApiServices.logout("admin@dev.com", "admin@dev.com");
        },
        backgroundColor: Colors.black,child: Icon(Icons.logout,color: Colors.white,),
      ),
    );
  }
}
