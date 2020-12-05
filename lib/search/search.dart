import 'package:credilio_flutter_news_api/models/article.dart';
import 'package:credilio_flutter_news_api/views/article_view.dart';
import 'package:flutter/material.dart';

class Search extends SearchDelegate{

  final List<Article> listExample;
  Search(this.listExample);

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Article> suggestionList = [];
    suggestionList.addAll(listExample.where((element) => element.title.toLowerCase().contains(query.toLowerCase())));

    return ListView.builder(
      itemBuilder: (context, index){
        return Card(
          elevation: 10.0,
          child: ListTile(
            leading: Image.network(suggestionList[index].urlToImage),
            title: Text(
              suggestionList[index].title
            ),
            subtitle: Text(suggestionList[index].author ?? ''),
            tileColor: Colors.black12,
            contentPadding: EdgeInsets.all(10.0),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => ArticleView(
                    postUrl: suggestionList[index].articleUrl,
                  )
              ));
            },
          ),
        );
      },
    itemCount: suggestionList.length,);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            query = '';
          })
    ];
  }



  @override
  Widget buildResults(BuildContext context) {
    String selectedResult;
return Container(
  child: Center(
    child: Text(selectedResult),
  ),
);
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        });
  }
}