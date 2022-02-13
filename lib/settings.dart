import 'dart:ui';

import 'package:cronometer/widgets.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"),),
      body: const Settings(),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late TextEditingController textWork;
  late TextEditingController textShort;
  late TextEditingController textLong;

  static const String WORKTIME = "worktime";
  static const String SHORTBREAK = "shortbreak";
  static const String LONGBREAK = "longbreak";

  late int workTime;
  late int shortBreak;
  late int longBreak;
  late SharedPreferences prefs;

  @override
  void initState(){
    textWork = TextEditingController();
    textShort = TextEditingController();
    textLong = TextEditingController();
    readSettings();
    super.initState();
  }

  TextStyle textStyle = const TextStyle(fontSize: 24);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        scrollDirection: Axis.vertical,
        childAspectRatio: 3,
        crossAxisCount: 3, // Numero de columnas
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        children:[

          Text("Work", style: textStyle,),
          const Text(""),
          const Text(""),
          SettingsButton(null, Color(0xff455A64), "-", -1, WORKTIME, updateSettings),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: textWork,
          ),
          SettingsButton(null, Color(0xff009688), "+", 1, WORKTIME, updateSettings),

          Text("Short", style: textStyle,),
          const Text(""),
          const Text(""),
          SettingsButton(null, Color(0xff455A64), "-", -1, SHORTBREAK, updateSettings),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: textShort,
          ),
          SettingsButton(null, Color(0xff009688), "+", 1, SHORTBREAK, updateSettings),

          Text("Long", style: textStyle,),
          const Text(""),
          const Text(""),
          SettingsButton(null, Color(0xff455A64), "-", -1, LONGBREAK, updateSettings),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: textLong,
          ),
          SettingsButton(null, Color(0xff009688), "+", 1, LONGBREAK, updateSettings),
        ],
      ),
    );
  }

  readSettings() async{
    prefs = await SharedPreferences.getInstance();
    int? workTime = prefs.getInt(WORKTIME);
    int? shortBreak = prefs.getInt(SHORTBREAK);
    int? longBreak = prefs.getInt(LONGBREAK);

    if(workTime == null){
      await prefs.setInt(WORKTIME, 30);
    }

    if(shortBreak == null){
      await prefs.setInt(SHORTBREAK, 5);
    }

    if(longBreak == null){
      await prefs.setInt(LONGBREAK, 20);
    }

    setState(() {
      if(workTime != null){
        textWork.text = workTime.toString();
      }
      if(shortBreak != null){
        textShort.text = shortBreak.toString();
      }
      if(longBreak != null){
        textLong.text = shortBreak.toString();
      }
    });
  }

  void updateSettings(String key, int value){
    switch(key){
      case WORKTIME:{
        int? workTime = prefs.getInt(WORKTIME);
        if(workTime != null){
          workTime += value;

          if(workTime >= 1 && workTime <= 180){
            prefs.setInt(WORKTIME, workTime);
            setState(() {
              textWork.text = workTime.toString();
            });
          }
        }
      }
      break;
      case SHORTBREAK:{
          int? shorTime = prefs.getInt(SHORTBREAK);
          if (shorTime != null) {
            shorTime += value;

            if (shorTime >= 1 && shorTime <= 120) {
              prefs.setInt(SHORTBREAK, shorTime);
              setState(() {
                textShort.text = shorTime.toString();
              });
            }
          }
        }
        break;
      case LONGBREAK:{
        int? longTime = prefs.getInt(LONGBREAK);
        if(longTime != null){
          longTime += 1;

          if(longTime > 1 && longTime <= 180){
            prefs.setInt(LONGBREAK, longTime);
            setState(() {
              textLong.text = longTime.toString();
            });
          }
        }
        break;
      }
    }
  }
}



