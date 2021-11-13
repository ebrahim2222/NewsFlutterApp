import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/network/local/shared_helper.dart';
import 'package:news_app/network/remote/dio_helper.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/ui/screens/bussines.dart';
import 'package:news_app/ui/screens/science.dart';
import 'package:news_app/ui/screens/sports.dart';

class NewsCubit extends Cubit<NewsStates> {

  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> bottomNavBarItem = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: "Business"),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  List<Widget> screensList = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen()
  ];

  void changeIndex(int index) {
    currentIndex = index;
    if (currentIndex == 1) {
      getSports();
    } else if (currentIndex == 2) {
      getScience();
    }
    emit(BottomNavStates());
  }


  List<dynamic> businessList = [];

  void getBusiness() {
    emit(getBusinessLoadingState());
    DioHelper.getData(path: "v2/top-headlines",
        query: {
          "country": "eg",
          "category": "business",
          "apiKey": "0df7382382a345738857bfcd651686a3"
        }).then((value) {
      businessList = value.data["articles"];
      print(businessList[0]["title"]);
      emit(getBusinessSuccessState());
    })
        .catchError((error) {
      print(error);
      emit(getBusinessErrorState(error: error.toSting));
    });
  }

  List<dynamic> sportsList = [];

  void getSports() {
    emit(getSportsLoadingState());
    DioHelper.getData(path: "v2/top-headlines", query: {
      "country": "eg",
      "category": "sports",
      "apiKey": "0df7382382a345738857bfcd651686a3"
    }).then((value) {
      print(value.data.toString());
      emit(getSportsSuccessState());
      sportsList = value.data["articles"];
    }).catchError((error) => getSportsErrorState(error: error.toString()));
  }

  List<dynamic> scienceList = [];

  void getScience() {
    emit(getScinceLoadingState());
    DioHelper.getData(path: "v2/top-headlines", query: {
      "country": "eg",
      "category": "science",
      "apiKey": "0df7382382a345738857bfcd651686a3"
    }).then((value) {
      print(value.data.toString());
      emit(getScinceSuccessState());
      scienceList = value.data["articles"];
    }).catchError((error) => getScinceErrorState(error: error.toString()));
  }

  List<dynamic> searchList = [];

  void getSearch(String value) {
    emit(getSearchLoadingState());
    DioHelper.getData(
        path: "v2/everything",
        query: {
          "q": value,
          "apiKey":"0df7382382a345738857bfcd651686a3"
        }).then((value) {
          searchList = value.data["articles"];
          emit(getSearchSuccessState());
    }).catchError((error){
      emit(getSearchErrorState(error: error));
    });
  }


  bool isDark = false;

  void changeTheme() {
    isDark = !isDark;
    emit(changeModeState());
  }


}