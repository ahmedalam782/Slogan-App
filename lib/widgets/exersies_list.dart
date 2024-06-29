import 'package:flutter/material.dart';

import '../Models/exercise_model.dart';
import '../Screens/exercise_page.dart';
import 'exersies_widgets.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ExerciseModel> exerciseModel = [
      ExerciseModel(
        imageName: "assets/chest/main1.jpg",
        exercisesTitle: "Chest Exercises",
        exercisesNumber: "8",
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ExercisePage(
              exersiceType: "Chest",
            ),
          ),
        ),
      ),
      ExerciseModel(
        imageName: "assets/back/main.png",
        exercisesTitle: "Back Exercises",
        exercisesNumber: "6",
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ExercisePage(
              exersiceType: "Back",
            ),
          ),
        ),
      ),
      ExerciseModel(
        imageName: "assets/biceps/main.jpg",
        exercisesTitle: "Biceps Exercises",
        exercisesNumber: "8",
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ExercisePage(
              exersiceType: "Biceps",
            ),
          ),
        ),
      ),
      ExerciseModel(
        imageName: "assets/shoulder/main.jpg",
        exercisesTitle: "Shoulder Exercises",
        exercisesNumber: "7",
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ExercisePage(
              exersiceType: "Shoulder",
            ),
          ),
        ),
      ),
      ExerciseModel(
        imageName: "assets/legs/main.jpeg",
        exercisesTitle: "Legs Exercises",
        exercisesNumber: "8",
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const ExercisePage(
              exersiceType: "Legs",
            ),
          ),
        ),
      ),
    ];

    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) => ExerciseWidgets(
          exerciseModel: exerciseModel[index],
        ),
        itemCount: exerciseModel.length,
      ),
    );
  }
}
