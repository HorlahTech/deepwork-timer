import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:untitled/countdown_brain.dart';
import 'package:untitled/settings_view.dart';
import 'package:untitled/time_model.dart';

// import 'package:percent_indicator/percent_indicator.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          // const SettingsView(),
          const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CountdownBrain _countdownBrain = CountdownBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff607D8B),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: const Text("Settings"),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SettingsView();
                        }));
                      },
                    )
                  ])
        ],
        title: const Text(
          "Deep work Timer",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                MyAppButton(
                  color: const Color(0xff009688),
                  text: "Work",
                  onPressed: () {
                    _countdownBrain.startWork();
                  },
                ),
                const SizedBox(width: 10),
                MyAppButton(
                  color: const Color(0xff607D8B),
                  text: "Short Break",
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                MyAppButton(
                  color: const Color(0xff455A64),
                  text: "long Break",
                  onPressed: () {},
                ),
              ],
            ),
            StreamBuilder<TimerModel>(
                initialData: TimerModel(percent: 1, time: "00:00"),
                stream: _countdownBrain.countDownBrain(),
                builder: (context, snapshot) {
                  return CircularPercentIndicator(
                    radius: 80.0,
                    lineWidth: 8.0,
                    percent: snapshot.data?.percent ?? 0,
                    center: Text(
                      snapshot.data?.time ?? '',
                      style: const TextStyle(
                          fontSize: 30, fontWeight: FontWeight.w600),
                    ),
                    progressColor: const Color(0xff009688),
                  );
                }),
            const Row(
              children: [
                MyAppButton(
                  color: Color(0xff455A64),
                  text: "Stop",
                ),
                SizedBox(width: 10),
                MyAppButton(
                  color: Color(0xff607D8B),
                  text: "Restart",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyAppButton extends StatelessWidget {
  const MyAppButton(
      {super.key, required this.color, required this.text, this.onPressed});
  final Color color;
  final String text;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: MaterialButton(
      onPressed: onPressed,
      color: color,
      child: Text(
        text,
        style: const TextStyle(color: Colors.white),
      ),
    ));
  }
}
