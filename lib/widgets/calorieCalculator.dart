import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Cal_Calculator extends StatefulWidget {
  const Cal_Calculator({super.key});

  @override
  State<Cal_Calculator> createState() => _Cal_CalculatorState();
}

class _Cal_CalculatorState extends State<Cal_Calculator> {
  String age = '';
  String weigth = '';
  String height = '';
  int cal = 0;
  String gender = 'Male';
  Color malecolor = Colors.white;
  Color femalecolor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                label: Text('Age',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    )),
              ),
              onSaved: (value) {
                age = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Age";
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                label: Text('Weigth in Kilo grams',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    )),
              ),
              onSaved: (value) {
                weigth = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Your Weigth";
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              style: TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15))),
                label: Text('height in Cm',
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                    )),
              ),
              onSaved: (value) {
                height = value!;
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please Enter Your height";
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    malecolor = Colors.green;
                    femalecolor = Colors.white;
                    gender = 'Male';
                  });
                },
                child: Container(
                  height: 35,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: malecolor,
                  ),
                  child: Center(child: const Text('Male')),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    femalecolor = Colors.green;
                    malecolor = Colors.white;
                    gender = 'Female';
                  });
                },
                child: Container(
                  height: 35,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: femalecolor,
                  ),
                  child: Center(child: const Text('Female')),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: const Text(
                'calculate the calories you needed in day',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'The Calories You Needed is ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Container(
                child: Text(
                  '$cal',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.green,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
