import 'package:cached_network_image/cached_network_image.dart';
import 'package:credilio_flutter_news_api/views/categorie_news.dart';
import 'package:flutter/material.dart';

/*

class CategoryCard extends StatelessWidget {
  final String imageAssetUrl, categoryName;
  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => CategoryNews(
              newsCategory: categoryName.toLowerCase(),
            )
        ));
      },
      child: Container(
        child: Container(alignment: Alignment.center,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.teal[100]
          ),
          child: Text(
            categoryName,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

*/

class CategoryCard extends StatefulWidget {
  final String imageAssetUrl, categoryName;

  CategoryCard({this.imageAssetUrl, this.categoryName});

  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      newsCategory: widget.categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(1),
              child: CachedNetworkImage(
                imageUrl: widget.imageAssetUrl,
                fit: BoxFit.fill,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                widget.categoryName,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}