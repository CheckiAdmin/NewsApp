import 'package:credilio_flutter_news_api/apiCalls/newsApi.dart';
import 'package:credilio_flutter_news_api/globalVariable.dart' as globals;
import 'package:credilio_flutter_news_api/widget/appBar_widget.dart';
import 'package:credilio_flutter_news_api/widget/newsArticalListView.dart';
import 'package:credilio_flutter_news_api/widget/newsArticleCardView.dart';
import 'package:flutter/material.dart';

class CategoryNews extends StatefulWidget {
  final String newsCategory;

  CategoryNews({this.newsCategory});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist;
  bool _loading = true;

  @override
  void initState() {
    getNews();
    super.initState();
  }

  void getNews() async {
    NewsByCategorie news = NewsByCategorie();
    await news.getNewsForCategory(widget.newsCategory);
    newslist = news.news;

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
            context: context,
            backButton: true,
            actionButton: !_loading,
            searchingList: newslist,
            heading1: widget.newsCategory.toUpperCase(),
            heading2: "News"),
        body: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: globals.StoreData().checkViewType()
                    ? newsArticalsListView(
                        context: context, newwsArticle: newslist)
                    : newsArticalsCardView(
                        context: context, newwsArticle: newslist)));
  }
}
