import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_dismissible_tile/flutter_dismissible_tile.dart';
import 'package:slogan_app/Models/exercise_home_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ExerciseHomeModel> exerciseModels = [
    ExerciseHomeModel(
        exerciseName: "Chest game",
        dateTime: DateTime.now(),
        states: "pending"),
    ExerciseHomeModel(
        exerciseName: "back game",
        dateTime: DateTime.now(),
        states: "completed")
  ];
  int _currentIndex = 0;
  final List<String> _images = [
    'assets/Motivate 2.jpg',
    'assets/Motivate 1.jpg',
    'assets/Motivate 3.jpg',
    'assets/Motivate 4.jpg',
    'assets/Motivate 5.jpg',
    'assets/Motivate 6.jpg',
    'assets/Motivate 7.jpg',
    'assets/Motivate 8.jpg',
    'assets/Motivate 9.jpg',
    'assets/Motivate 10.jpg',
  ];

  Timer? _timer;

  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _images.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        const Spacer(),
        Expanded(
          flex: 8,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                image: DecorationImage(
                  image: AssetImage(_images[_currentIndex]),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        const Spacer(),
        Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)),
              child: ListView.builder(
                  itemCount: exerciseModels.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        DismissibleTile(
                          key: UniqueKey(),
                          confirmDismiss: (direction) => Future.delayed(
                            const Duration(seconds: 1),
                            () {
                              exerciseModels.removeAt(index);
                              return null;
                            },
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                          delayBeforeResize: const Duration(milliseconds: 500),
                          ltrDismissedColor: Colors.red,
                          rtlDismissedColor: Colors.red,
                          ltrOverlay: const _SlidableOverlay(
                            title: 'Delete the exercise',
                            iconData: Icons.delete,
                          ),
                          ltrOverlayDismissed: const _DismissedOverlay(
                              title: 'The exercise is deleted'),
                          rtlOverlay: const _SlidableOverlay(
                            title: 'Delete the exercise',
                            iconData: Icons.delete_forever,
                          ),
                          child: ListTile(
                            title: Text(
                              exerciseModels[index].exerciseName,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "${exerciseModels[index].dateTime.day}/${exerciseModels[index].dateTime.month} ${formatTime(exerciseModels[index].dateTime)}",
                              style: const TextStyle(color: Colors.black),
                            ),
                            trailing: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(40),
                                    color: Colors.black),
                                child: Text(
                                  exerciseModels[index].states,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: exerciseModels[index].states ==
                                              "pending"
                                          ? Colors.deepPurple
                                          : Colors.blue),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          thickness: 2,
                          color: Colors.black,
                        )
                      ],
                    );
                  }),
            )),
        const Spacer(),
      ],
    );
  }
}

class _SlidableOverlay extends StatelessWidget {
  const _SlidableOverlay({
    required this.title,
    required this.iconData,
  });

  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconData,
          color: Colors.white,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _DismissedOverlay extends StatelessWidget {
  const _DismissedOverlay({
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 22,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

String formatTime(DateTime dateTime) {
  int hour = dateTime.hour;
  int minute = dateTime.minute;

  String period = (hour < 12) ? 'AM' : 'PM';

  if (hour > 12) {
    hour -= 12;
  } else if (hour == 0) {
    hour = 12;
  }

  String formattedTime = '$hour:${minute.toString().padLeft(2, '0')} $period';

  return formattedTime;
}
