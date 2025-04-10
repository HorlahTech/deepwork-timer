import 'package:untitled/time_model.dart';

class CountdownBrain{
  double percent = 1;
  TimerModel? timerModel;
  Duration _workTime =const Duration(seconds: 30);
  final Duration _fullTime =const Duration(seconds: 30);
  final bool _isActive =true;
  String returnTime(Duration time){
  final  String minute = (time.inMinutes < 10) ?"0 ${time.inMinutes}" : time.inMinutes.toString();
  final  String seconds = (time.inSeconds < 10) ?"0 ${time.inSeconds}" : time.inSeconds.toString();
 
    return "$minute:$seconds";
  }

 Stream < TimerModel> countDownBrain()async*{
   yield*  Stream.periodic(const Duration(seconds:1), (int a){
    if (_isActive) {
        _workTime = _workTime - const Duration(seconds: 1);
    percent = _workTime.inSeconds/_fullTime.inSeconds;
    }
    
    return   TimerModel(time: returnTime(_workTime), percent: percent);
     });

   
  }
}