import 'package:cronometer/widgets.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"),),
      body: Container(child: const Settings(),),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  
  TextStyle textStyle = TextStyle(fontSize: 24);
  
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
          const SettingsButton(null, Color(0xff455A64), "-", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),

          const SettingsButton(null, Color(0xff009688), "+", 1),
          Text("Short", style: textStyle,),
          const Text(""),
          const Text(""),
          const SettingsButton(null, Color(0xff455A64), "-", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          const SettingsButton(null, Color(0xff009688), "+", 1),

          Text("Long", style: textStyle,),
          const Text(""),
          const Text(""),
          const SettingsButton(null, Color(0xff455A64), "-", -1),
          TextField(
            style: textStyle,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
          ),
          const SettingsButton(null, Color(0xff009688), "+", 1),
        ],
      ),
    );
  }
}



