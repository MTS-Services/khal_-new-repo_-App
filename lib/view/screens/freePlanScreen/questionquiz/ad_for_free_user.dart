import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zidney/utils/asset_path.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/three_time_answer_screen.dart';

class AdForFreeUser extends StatefulWidget {
  const AdForFreeUser({super.key});

  @override
  State<AdForFreeUser> createState() => _AdForFreeUserState();
}

class _AdForFreeUserState extends State<AdForFreeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.asset(AssetPath.ad, fit: BoxFit.fill),
                  ),
                  // TextButton.icon(
                  //   onPressed: () {},
                  //   icon: const SizedBox(),
                  //   label: Row(
                  //     mainAxisAlignment: MainAxisAlignment.end,
                  //     children: const [
                  //       Text('Skip'),
                  //       SizedBox(width: 4),
                  //       Icon(Icons.arrow_forward),
                  //     ],
                  //   ),
                  // ),
                  Positioned(
                    top: 5,
                    right: 5,
                    child: TextButton.icon(
                      onPressed: () {
                        Get.to(() => ThreeTimeAnswerScreen(isTrue: true));
                      },
                      icon: SizedBox.shrink(),
                      label: Row(
                        children: const [
                          Text('Skip', style: TextStyle(color: Colors.white)),
                          SizedBox(width: 4),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 12,
                        ),
                        minimumSize: Size(0, 0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
