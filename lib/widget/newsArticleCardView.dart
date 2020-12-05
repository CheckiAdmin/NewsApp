import 'package:credilio_flutter_news_api/globalVariable.dart' as globals;
import 'package:credilio_flutter_news_api/widget/newsArticleTile_widget.dart';
import 'package:flutter/material.dart';

Widget newsArticalsCardView({BuildContext context, List newwsArticle}) {
  return Container(
    color: Colors.transparent,
    margin: EdgeInsets.only(top: 4),
    child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
            childAspectRatio: 0.8),
        itemCount: newwsArticle.length,
        physics: ClampingScrollPhysics(),
        itemBuilder: (context, index) {
          return Card(
            child: NewsTile(
              imgUrl: newwsArticle[index].urlToImage ?? "",
              title: newwsArticle[index].title ?? "",
              desc: newwsArticle[index].description ?? "",
              content: newwsArticle[index].content ?? "",
              posturl: newwsArticle[index].articleUrl ?? "",
              publishat: newwsArticle[index].publshedAt.toString() ?? "",
              viewType: globals.StoreData().checkViewType(),
            ),
          );
        }),
  );
}
