import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  static SharedPreferences? sharedPreferences;

  static init()async{
    sharedPreferences =await SharedPreferences.getInstance();
  }

  static void saveIsDarkInShared({value}){
    sharedPreferences!.setBool("isDark", value);
  }
  static bool? getDarkFromShared(){
    return sharedPreferences!.getBool("isDark");
  }

}