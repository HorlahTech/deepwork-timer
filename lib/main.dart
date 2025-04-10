import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
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
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  



  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
      backgroundColor:const Color(0xff607D8B),
         title: const Text("My Work Timer", style: TextStyle(color: Colors.white)),
      ),
      body:   Padding(
      padding: const EdgeInsets.all(16),
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
           const Row(children: [
             MyAppButton(color:Color(0xff009688) , text: "Work",),
          
          SizedBox(width: 10) ,  MyAppButton(color:Color(0xff607D8B) , text: "Short Break", ),
         SizedBox(width: 10) ,       MyAppButton(color:Color(0xff455A64) , text: "long Break",),
           ],),
           CircularPercentIndicator(
                  radius: 80.0,
                  lineWidth: 8.0,
                  percent: 1.0,
                  center:  const Text("30:00", style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),),
                  progressColor:const Color(0xff009688),
                ),
                const Row(children: [
             MyAppButton(color:Color(0xff455A64), text: "Stop",),
          
          SizedBox(width: 10) ,  MyAppButton(color:Color(0xff607D8B) , text: "Restart", ),
      
           ],),
       
          ],
        ),
      ),);
   
  }
}

class MyAppButton extends StatelessWidget {
  const MyAppButton({
    super.key,
 required   this.color, required this.text, this.onPressed 
  });
final Color color;
final String text;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: MaterialButton(onPressed: () {  },color: color ,child:   Text(text, style: const TextStyle(color: Colors.white),),));
  }
}
