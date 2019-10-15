import 'package:fluttertoast/fluttertoast.dart';

class Utils{
  static void showToast(String msg){
    Fluttertoast.showToast(msg: msg, gravity: ToastGravity.CENTER);
  }
}