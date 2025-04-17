import 'dart:developer';

import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  int workTime = 40;
  int shortTime = 10;
  int longTime = 20;
  late final TextEditingController _workController;

  late final TextEditingController _shortController;
  late final TextEditingController _longController;
  @override
  void initState() {
    _workController = TextEditingController(text: workTime.toString());
    _shortController = TextEditingController(text: shortTime.toString());
    _longController = TextEditingController(text: longTime.toString());
    super.initState();
  }

  @override
  void dispose() {
    _workController.dispose();
    _shortController.dispose();
    _longController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xff607D8B),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.,
          children: [
            SettingsWidget(
              title: "Work",
              controller: _workController,
              onNegative: () {
                log(workTime.toString());
                setState(() {
                  _workController.text = (workTime--).toString();
                });
              },
              onPositive: () {
                _workController.text = (workTime++).toString();
                setState(() {});
              },
            ),
            SettingsWidget(
              title: "Short",
              controller: _shortController,
              onNegative: () {
                _shortController.text = (shortTime--).toString();
                setState(() {});
              },
              onPositive: () {
                _shortController.text = (shortTime++).toString();
                setState(() {});
              },
            ),
            SettingsWidget(
              title: "Long",
              controller: _longController,
              onNegative: () {
                _longController.text = (longTime--).toString();
                setState(() {});
              },
              onPositive: () {
                _longController.text = (longTime++).toString();
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({
    super.key,
    required this.title,
    required this.controller,
    required this.onPositive,
    required this.onNegative,
  });
  final String title;
  final TextEditingController controller;
  final VoidCallback onPositive;
  final VoidCallback onNegative;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Expanded(
              child: MaterialButton(
                onPressed: onNegative,
                color: const Color(0xff607D8B),
                child: const Text("-"),
              ),
            ),
            Expanded(
                flex: 2,
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                )),
            Expanded(
              child: MaterialButton(
                onPressed: onPositive,
                color: const Color(0xff009688),
                child: const Text("+"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
