import 'package:credilio_flutter_news_api/widget/newsArticleTile_widget.dart';
import 'package:flutter/material.dart';

Widget newsArticalsListView({BuildContext context ,List newwsArticle}){
  return  Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(top: 4),
    child: ListView.builder(
        itemCount: newwsArticle.length,
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            elevation: 5.0,
            color: Colors.white70,
            child: NewsTile(
              imgUrl: newwsArticle[index].urlToImage ?? "",
              title: newwsArticle[index].title ?? "",
              desc: newwsArticle[index].description ?? "",
              content: newwsArticle[index].content ?? "",
              posturl: newwsArticle[index].articleUrl ?? "",
              publishat: newwsArticle[index].publshedAt.toString() ?? "",


            ),
          );
        }),
  );
}