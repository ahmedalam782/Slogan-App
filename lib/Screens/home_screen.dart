import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:slogan_app/widgets/daily_exercises_widgets.dart';

import '../widgets/calorieCalculator.dart';
import '../widgets/home_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late AudioPlayer _audioPlayer;
  bool _isPlaying = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _audioPlayer.stop();
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed && !_isPlaying) {
      _initAudioPlayer();
    }
  }

  void _initAudioPlayer() async {
    await _audioPlayer.setSourceAsset('sounds/See You Again.mp3');
    _audioPlayer.onPlayerStateChanged.listen((state) {
      if (state == PlayerState.completed) {
        _audioPlayer.play(AssetSource('sounds/See You Again.mp3'));
      }
    });
    _audioPlayer.play(AssetSource('sounds/See You Again.mp3'));
    setState(() {
      _isPlaying = true;
    });
  }

  int currentIndex = 0;
  List<Widget> screens = [
    HomePage(),
    DailyExercisesWidgets(),
    Cal_Calculator(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: screenHeight / 2.2,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                      image: AssetImage("assets/easyLearn.jpg"),
                      fit: BoxFit.cover)),
            ),
            const Text(
              "This app developed by EasyLearn Academy",
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: "SpaceMono",
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "SOLGAN",
          style: TextStyle(
              fontSize: 30,
              color: Colors.green,
              fontFamily: "SpaceMono",
              fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.white,
        backgroundColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(
              Icons.home,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Daily Exercises',
            icon: Icon(
              Icons.sports,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Calorie Calculator',
            icon: Icon(
              Icons.calculate_outlined,
            ),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
    );
  }
}
