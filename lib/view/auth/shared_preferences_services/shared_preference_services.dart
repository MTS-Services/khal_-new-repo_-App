import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceServices{
 static void userInformation({required String token})async{
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('token', token);
 }
}