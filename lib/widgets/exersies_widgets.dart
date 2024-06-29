import 'package:flutter/material.dart';
import 'package:slogan_app/Models/exercise_model.dart';

class ExerciseWidgets extends StatelessWidget {
  final ExerciseModel exerciseModel;

  const ExerciseWidgets({
    super.key,
    required this.exerciseModel,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: exerciseModel.onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width / 20,
              vertical: MediaQuery.sizeOf(context).height / 26,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                exerciseModel.imageName,
                fit: BoxFit.cover,
                height: MediaQuery.sizeOf(context).height / 5,
              ),
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height / 8,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width / 15,
            ),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.black.withOpacity(.7),
            ),
            child: Row(
              children: [
                Text(
                  exerciseModel.exercisesTitle,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: "SpaceMono",
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Text(
                  exerciseModel.exercisesNumber,
                  style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: "SpaceMono",
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
