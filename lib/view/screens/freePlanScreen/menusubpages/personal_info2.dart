import 'package:flutter/material.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/utils/common/custom_app_bar.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/app_background.dart';
import '../../../../utils/app_colors.dart';
import '../questionquiz/widgets/custom_button.dart';
import '../questionquiz/widgets/custom_container.dart';
import '../questionquiz/widgets/custom_dropdown.dart';
import '../questionquiz/widgets/custom_text_form_field.dart';

// Customizable image box widget
class CustomImageBox extends StatelessWidget {
  final double height;
  final double width;
  final Widget? child;

  const CustomImageBox({
    super.key,
    required this.height,
    required this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(height: height, width: width, child: child);
  }
}

class PersonalInfo2 extends StatefulWidget {
  const PersonalInfo2({super.key});

  @override
  State<PersonalInfo2> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo2> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();

  // initialize //

  final List<String> gender = ['Male', 'Female', 'Other'];
  final List<String> classList = ['A level', 'O level', 'B level'];

  String? selectedGender = "selected";
  String? selectedClass = "selected";

  @override
  void initState() {
    super.initState();
    selectedGender = gender.first;
    selectedClass = classList.first;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appbar //
      appBar: CustomAppBar(
        showTitle: true,
        title: "Sophie",
        classTitle: "Class",
        showAction: false,
      ),

      // body //
      body: AppBackground(
 
        isScrollable: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Go up and see this customImageBox widget //
            CustomImageBox(
              height: AppStyles.screenHeightPercentage(context, 0.25),
              width: AppStyles.screenWidthPercentage(context, 0.60),
              child: Center(child: Image.asset(AssetPath.uerImage)),
            ),

            SizedBox(height: 20),

            CustomTextFormField(
              controller: userNameController,
              labelText: 'Full Name',
              hintText: '@example',
            ),

            CustomTextFormField(
              controller: birthDateController,
              labelText: 'Birth Date',
              hintText: 'DD/MM/YYYY',
            ),

            CustomDropdown(
              itemList: gender,
              selectedItem: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Educational info ---------------',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 10),

            CustomDropdown(
              itemList: classList,
              selectedItem: selectedClass,
              onChanged: (value) {
                setState(() {
                  selectedClass = value;
                });
              },
            ),

            const SizedBox(height: 5),

            Row(
              children: [
                Expanded(
                  child: CustomTextFormField(
                    controller: countryController,
                    labelText: 'Country Name',
                    hintText: 'example',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomTextFormField(
                    controller: cityController,
                    labelText: 'City Name',
                    hintText: 'example',
                  ),
                ),
              ],
            ),

            CustomTextFormField(
              controller: schoolController,
              labelText: 'School Name',
              hintText: 'example',
            ),

            SizedBox(height: 5),

            // button //
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  backgroundColor: AppColors.grey,
                  shadowColor: AppColors.greyShadow,
                  width: AppStyles.screenHeightPercentage(context, 0.10),
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
          ],
        ),
      ),
    );
  }
}
