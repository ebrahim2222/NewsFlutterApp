import 'package:flutter/material.dart';
import 'package:news_app/ui/screens/web_view.dart';

Widget newsItems(businessList,context){
  return InkWell(
    onTap: (){

    },
    child: Padding(
      padding: EdgeInsets.all(10),
      child: SizedBox(
        width: 120,
        height: 140 ,
        child: Row(
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                      image: NetworkImage("${businessList["urlToImage"]}"),
                      fit: BoxFit.cover
                  )
              ),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text("${businessList["title"]}", maxLines: 4,overflow: TextOverflow.ellipsis , style:Theme.of(context).textTheme.bodyText1)),
                  SizedBox(height: 2,),
                  Text("${businessList["publishedAt"]}",style: TextStyle(color: Colors.grey),)
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}