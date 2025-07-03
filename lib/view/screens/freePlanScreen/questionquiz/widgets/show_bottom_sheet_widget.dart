import 'package:flutter/material.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/answer_bottom_sheet.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/right_answer.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/wrong_ans_limit.dart';
import 'package:zidney/view/screens/freePlanScreen/questionquiz/widgets/wrong_answer.dart';

void showAnswerBottomSheet(
  BuildContext context,
  int isChange,
  bool isAnswer,
  bool isPrograssbar,
  bool isWrong,
) {
  final answerController = TextEditingController();

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      if (isChange == 0) {
        return AnswerBottomSheet(
          answerController: answerController,
          onSubmit: (answer) {
            print('Answer Submitted: $answer');
            Navigator.pop(context);
          },
        );
      } else if (isChange == 1) {
        return RightAnswer(
          isPrograsBar: isPrograssbar,
          isAnswer: isAnswer,
          answerController: answerController,
          onSubmit: (answer) {
            print('Answer Submitted: $answer');
            Navigator.pop(context);
          },
        );
      } else if (isChange == 2) {
        return WrongAnswer(
          iswrong: isWrong,
          answerController: answerController,
          onSubmit: (answer) {
            print('Answer Submitted: $answer');
            Navigator.pop(context);
          },
        );
      } else {
        return WrongAnsLimit(
          iswrong: isWrong,
          answerController: answerController,
          onSubmit: (answer) {
            print('Answer Submitted: $answer');
            Navigator.pop(context);
          },
        );
      }
    },
  );
}
