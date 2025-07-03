import 'package:flutter/material.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/common/custom_app_bar.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/app_background.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_button.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/custom_text_form_field.dart';

class Security extends StatelessWidget {
  const Security({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar //
      appBar: CustomAppBar(
        title: "Sophie",
        showTitle: true,
        classTitle: "Class",
        showAction: false,
      ),

      // body //
      body: AppBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // email feild //
              CustomTextFormField(
                hintText: 'example@gmail.com',
                labelText: 'Email',
              ),

              // code & phone feild //
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: CustomTextFormField(
                      hintText: '+880',
                      labelText: 'code',
                    ),
                  ),

                  Expanded(
                    child: CustomTextFormField(
                      hintText: '123456789',
                      labelText: 'phone',
                    ),
                  ),
                ],
              ),

              // gap //
              SizedBox(height: 5),

              // button //
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    backgroundColor: AppColors.grey,
                    shadowColor: AppColors.greyShadow,
                    width: AppStyles.screenHeightPercentage(context, 00.10),
                    onTap: () {},
                    buttonText: 'Discard',
                    textColor: AppColors.blackColor,
                  ),
                  CustomButton(
                    width: AppStyles.screenHeightPercentage(context, 0.15),
                    onTap: () {},
                    buttonText: 'Save',
                    suffix: Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              // password //
              CustomTextFormField(
                hintText: '*******',
                labelText: 'Old Password',
              ),
              CustomTextFormField(
                hintText: '*******',
                labelText: 'New Password',
              ),
              CustomTextFormField(
                hintText: '*******',
                labelText: 'Confirm Password',
              ),
              // button //
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    backgroundColor: AppColors.grey,
                    shadowColor: AppColors.greyShadow,
                    width: AppStyles.screenHeightPercentage(context, 00.10),
                    onTap: () {},
                    buttonText: 'Discard',
                    textColor: AppColors.blackColor,
                  ),
                  CustomButton(
                    width: AppStyles.screenHeightPercentage(context, 0.15),
                    onTap: () {},
                    buttonText: 'Save',
                    suffix: Icon(
                      Icons.double_arrow_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              //custom button //
            ],
          ),
        ),
      ),
    );
  }
}
