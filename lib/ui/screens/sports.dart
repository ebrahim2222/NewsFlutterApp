import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/ui/widget/Components.dart';

class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      builder: (context, state) {
        var list = NewsCubit
            .get(context)
            .sportsList;
        return ConditionalBuilder(
          condition: list.length > 0,
          builder: (context) {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context , index) => newsItems(list[index],context),
              separatorBuilder: (context , index) => const Divider(color: Colors.grey, height: 1,),
              itemCount: list.length,);
          },
          fallback: (context) =>
              const Center(child: CircularProgressIndicator(
                color: Colors.deepOrange,),),);
      },
      listener: (context, state) {},
    );
  }


}