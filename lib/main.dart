import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/network/local/shared_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/ui/screens/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp( {Key? key,}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsCubit>(
      create: (context)=> NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit , NewsStates>(
        listener: (context , state) {}  ,
        builder: (context , state) =>   MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: const AppBarTheme(
                backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark
                  ),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 20)
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600
                )
              ),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange
              ),
              iconTheme: const IconThemeData(
                  color:Colors.black
              ),

          ),
          darkTheme: ThemeData(
              appBarTheme: const AppBarTheme(
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.black,
                    statusBarIconBrightness: Brightness.light
                  ),
                  backgroundColor: Colors.black,
                  elevation: 0,
                  titleTextStyle: TextStyle(color:Colors.white, fontWeight: FontWeight.bold, fontSize: 20)
              ),
              textTheme: const TextTheme(
                bodyText1: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                )
              ),
              scaffoldBackgroundColor: Colors.black,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.black,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.white
              ),
              iconTheme: const IconThemeData(
                  color: Colors.white
              )
          ),
          themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          home: const NewsLayout(),
        ),

      ),
    );
  }
}
