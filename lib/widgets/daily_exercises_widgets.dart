import 'package:flutter/material.dart';

import 'dialog_border.dart';
import 'exersies_list.dart';

class DailyExercisesWidgets extends StatelessWidget {
  const DailyExercisesWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 18),
              margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width / 35),
              alignment: Alignment.centerLeft,
              height: MediaQuery.sizeOf(context).height / 4,
              width: MediaQuery.sizeOf(context).width,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(
                    MediaQuery.sizeOf(context).width / 20),
              ),
              child: const Text(
                "Add new exercise today",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontFamily: "SpaceMono",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              right: -MediaQuery.sizeOf(context).width / 20,
              child: InkWell(
                onTap: () {
                  showAlertDialog(
                      context: context,
                      onTap: () {
                        Navigator.pop(context);
                      });
                },
                child: CircleAvatar(
                  radius: MediaQuery.sizeOf(context).height / 17,
                  backgroundImage: const AssetImage("assets/add.gif"),
                ),
              ),
            )
          ],
        ),
        ExerciseList(),
      ],
    );
  }
}
