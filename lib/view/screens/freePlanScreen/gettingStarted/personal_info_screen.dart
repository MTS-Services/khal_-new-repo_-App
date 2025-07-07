import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:zidney/controller/user/user_controller.dart';
import 'package:zidney/utils/app_style.dart';
import 'package:zidney/view/screens/freePlanScreen/gettingStarted/subject_selection_screen.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/app_background.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/asset_path.dart';
import '../questionquiz/widgets/calender_screen.dart';
import '../questionquiz/widgets/custom_button.dart';
import '../questionquiz/widgets/custom_container.dart';
import '../questionquiz/widgets/custom_dropdown.dart';
import '../questionquiz/widgets/custom_text_form_field.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController schoolController = TextEditingController();

  final List<String> gender = ['Male', 'Female', 'Other'];
  final List<String> classList = ['A level', 'O level', 'B level', 'C level'];

  String? selectedGender = "selected";
  String? selectedClass = "selected";

  @override
  void initState() {
    super.initState();
    userController.fetchUsersData();
    selectedGender = gender.first;
    selectedClass = classList.first;
  }

  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future _pickImage() async {
    final XFile? pickedFile = await _picker.pickImage(
      source: (ImageSource.gallery),
    );
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
      debugPrint('Selected image : ${_imageFile!.path}');
    }
  }

  DateTime? _selectedDate;
  final DateFormat _formatter = DateFormat('MM/dd/yyyy');

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? datePicked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (datePicked != null && datePicked != _selectedDate) {
      setState(() {
        _selectedDate = datePicked;
      });
    }
  }

  final userController=Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=>AppBackground(
        showBgImage: 1,
        isScrollable: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Setup your profile Your  \n     to get started",
                style: TextStyle(
                  fontSize: AppStyles.fontXXL,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: AppStyles.screenHeightPercentage(context, 0.025),
              ),

              CustomContainer(
                height: AppStyles.screenHeightPercentage(context, 0.25),
                width: AppStyles.screenWidthPercentage(context, 0.55),
                child: Center(
                  child: CircleAvatar(
                    maxRadius: 64,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                    _imageFile != null
                        ? FileImage(File(_imageFile!.path)) as ImageProvider
                        : null,
                    child:
                    _imageFile == null
                        ? Stack(
                      children: [
                        SvgPicture.asset(
                          AssetPath.profileLogo,
                          height: 64,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: SvgPicture.asset(
                              AssetPath.imageAddIcon,
                            ),
                          ),
                        ),
                      ],
                    )
                        : Stack(
                      children: [
                        // When image is selected, show only the add icon on top of it
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: _pickImage,
                            child: SvgPicture.asset(
                              AssetPath.imageAddIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: AppStyles.screenHeightPercentage(context, 0.025),
              ),
            Obx((){
              return CustomTextFormField(
                controller: userNameController,
                labelText: userController.userData?.username,
                hintText: '@example',
              );
            }),
              CustomTextFormField(
                controller: fullNameController,
                labelText: userController.userData?.name,
                hintText: '@example',
              ),
              GestureDetector(
                onTap: () => _pickDate(context),
                child: CalenderScreen(
                  //backgroundColor: AppColors.whiteColor,
                  border: Border.all(color: AppColors.primaryColor.value),
                  height: AppStyles.screenWidthPercentage(context, 0.13),
                  width: AppStyles.screenWidthPercentage(context, 0.94),
                  selectedDate: _selectedDate,
                  formatter: _formatter,
                ),
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

              const SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Educational info',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),

              Row(
                children: [
                  Expanded(
                    child: CustomTextFormField(
                      controller: countryController,
                      labelText: userController.userData?.country,
                      hintText: 'example',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: CustomTextFormField(
                      controller: cityController,
                      labelText:  userController.userData?.city,
                      hintText: 'example',
                    ),
                  ),
                ],
              ),
              CustomTextFormField(
                controller: schoolController,
                labelText: userController.userData?.school,
                hintText: 'example',
              ),

              CustomDropdown(
                itemList: classList,
                selectedItem: selectedClass,
                onChanged: (value) {
                  setState(() {
                    selectedClass = value;
                  });
                },
              ),

              SizedBox(
                height: AppStyles.screenHeightPercentage(context, 0.035),
              ),
              CustomButton(
                width: AppStyles.screenWidthPercentage(context, 0.25),
                buttonText: 'Next',
                suffix: const Icon(
                  Icons.double_arrow_outlined,
                  color: AppColors.lightPink,
                ),
                onTap: () {
                  Get.to(() => SubjectSelection());
                },
              ),
              SizedBox(
                height: AppStyles.screenHeightPercentage(context, 0.035),
              ),
            ],
          ),
        ),
      ),)
    );
  }

  @override
  void dispose() {
    userNameController.dispose();
    fullNameController.dispose();
    birthDateController.dispose();
    countryController.dispose();
    cityController.dispose();
    schoolController.dispose();
    super.dispose();
  }
}
