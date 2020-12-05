
import 'package:credilio_flutter_news_api/widget/appBar_widget.dart';
import 'package:credilio_flutter_news_api/widget/newsArticalListView.dart';
import 'package:flutter/material.dart';
import '../widget/newsArticleTile_widget.dart';
import '../apiCalls/newsApi.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _loading;
  var newslist;


  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: MyAppBar(context: context, searchingList: newslist, actionButton: !_loading),
        body: SafeArea(
          child: _loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(color: Colors.transparent,
                    child: Column(
                      children: <Widget>[
                        /// News Article
                        newsArticalsListView(context: context, newwsArticle: newslist)
                      ],
                    ),
                  ),
                ),
        ),
        floatingActionButton: speedDialFab(context),
      ),
    );
  }
 

}


