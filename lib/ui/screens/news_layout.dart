import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/ui/screens/search.dart';

class NewsLayout extends StatefulWidget{
  const NewsLayout({Key? key}) : super(key: key);

  @override
  State<NewsLayout> createState() => NewsState();

}

class NewsState extends State<NewsLayout>{
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit ,NewsStates>(
      listener: (context , state){},
      builder: (context , state){
        var newsCubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("News App"),
            actions:  [
             IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: (context){return Search();}));}, icon: const Icon(Icons.search),color: Theme.of(context).iconTheme.color),
             IconButton(onPressed: (){newsCubit.changeTheme();}, icon: const Icon(Icons.brightness_4) ,color: Theme.of(context).iconTheme.color,)
            ],
          ),
          body: newsCubit.screensList[newsCubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: newsCubit.bottomNavBarItem
            ,
            onTap: (index){
              newsCubit.changeIndex(index);
            },
            currentIndex: newsCubit.currentIndex,
          ),
        );
      },
    );
  }

}