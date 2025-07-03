import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/app_colors.dart';
import 'package:zidney/utils/app_style.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> itemList;
  final String? selectedItem;
  final Function(String?) onChanged;
  final Color backgroundColor;
  final Color? shadowColor;

  const CustomDropdown({
    super.key,
    required this.itemList,
    required this.selectedItem,
    required this.onChanged,
    this.backgroundColor = Colors.white,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final dropdownHeight = AppStyles.screenWidthPercentage(context, 0.13);
    final dropdownWidth = AppStyles.screenWidthPercentage(context, 0.94);

    return Obx(()=>Padding(
      padding: AppStyles.paddingVerticalM,
      child: Container(
        height: dropdownHeight,
        width: dropdownWidth,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: AppStyles.radiusS,
          border: Border.all(color: shadowColor??AppColors.primaryColor.value, width: 2),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.value,
              offset: const Offset(0, 12),
            ),
          ],
        ),
        child: DropdownButton2<String>(
          isExpanded: true,
          value: itemList.contains(selectedItem) ? selectedItem : null,
          underline: const SizedBox.shrink(),
          items: itemList.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  item,
                  style: TextStyle(
                    fontSize: AppStyles.fontM,
                    color: AppColors.chocolate.value,
                  ),
                ),
              ),
            );
          }).toList(),
          onChanged: onChanged,
          iconStyleData: const IconStyleData(
            icon: Icon(Icons.keyboard_arrow_down_outlined),
            iconSize: 25,
            iconEnabledColor: Colors.black,
          ),
          dropdownStyleData: DropdownStyleData(
            isOverButton: false,
            offset: const Offset(0, -12),
            maxHeight: 140,
            elevation: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.value,
                  blurRadius: 5,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: WidgetStateProperty.all(AppColors.primaryColor.value),
              radius: const Radius.circular(8),
            ),
          ),
          buttonStyleData: ButtonStyleData(
            height: dropdownHeight,
            width: dropdownWidth,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: AppStyles.radiusM,
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.zero
          ),
        ),
      ),
    ));
  }
}
