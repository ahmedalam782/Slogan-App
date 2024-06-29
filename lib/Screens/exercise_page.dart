import 'package:flutter/material.dart';

class ExercisePage extends StatelessWidget {
  final String exersiceType;

  const ExercisePage({super.key, required this.exersiceType});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: exersiceType.toLowerCase() == "shoulder" ? 7 : 8,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "The exercise performs 10 reps in 3 sets",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 20),
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/${exersiceType.toLowerCase()}/${index + 1}.gif"),
                            fit: BoxFit.cover)),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 40),
                    child: Divider(
                      thickness: 3,
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
