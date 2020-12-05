import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../views/article_view.dart';

class NewsTile extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String content;
  final String posturl;
  final String publishat;
  final double imageHeight;
  final bool viewType;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.posturl,
      this.publishat,
      this.imageHeight = 200,
      this.viewType});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: posturl,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: viewType ? 24 : 0),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 2),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: viewType ? 200 : 100.0,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(height: 12,),
                  Text(
                    title,
                    maxLines: 4, textAlign: TextAlign.justify,
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: viewType ? 16 : 11.0,
                      fontWeight: FontWeight.w500,),
                  ),
                  SizedBox(
                    height: viewType ? 4 : 0,
                  ),
                  viewType ? Text(
                    desc,
                    maxLines: 2,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ) : Text(""),
                  SizedBox(
                    height: viewType ? 4 : 0,
                  ),
                  viewType ? Text(
                    publishat,
                    maxLines: 1,
                    style: TextStyle(
                        color: Colors.black54, fontSize: viewType ? 14 : 8.0),
                  ) : Text("")
                ],
              ),
            ),
          )),
    );
  }
}
