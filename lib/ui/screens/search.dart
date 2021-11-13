import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/ui/widget/Components.dart';

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchController = TextEditingController();
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var search = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1)),
                    label: Text("search"),
                    hintText: "enter your text"),
                controller: searchController,
                validator: (validate) {
                  if (validate!.isEmpty) {
                    return null;
                  } else {
                    return "field must be filled";
                  }
                },
                onChanged: (value) {
                  search.getSearch(value.toString());
                },
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: ListView.separated(
                  itemBuilder: (context , index){
                    return newsItems(search.searchList[index], context);
                  },
                  separatorBuilder: (context , index) => const Divider(color:Colors.grey, height: 1,),
                  itemCount: search.searchList.length,
                ),
              )

            ],
          ),
        );
      },
    );
  }
}
