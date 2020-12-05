import 'package:credilio_flutter_news_api/models/categorie_model.dart';
import 'package:credilio_flutter_news_api/newsCategory/data.dart';
import 'package:credilio_flutter_news_api/widget/appBar_widget.dart';
import 'package:credilio_flutter_news_api/widget/categoryCard_widget.dart';
import 'package:flutter/material.dart';

import 'categorie_news.dart';

class Categorie extends StatefulWidget {
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<CategorieModel> categories = List<CategorieModel>();

  TextEditingController searchCategory = new TextEditingController();

  @override
  void initState() {
    super.initState();
    categories = getCategories();

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: MyAppBar(context: context, backButton: true, actionButton: false),
      body: Container(
        margin: EdgeInsets.all(10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: new TextFormField(
                        controller: searchCategory,
                        decoration: new InputDecoration(
                          labelText: "Search your own category",
                          fillColor: Colors.white,
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(25.0),
                            borderSide: new BorderSide(
                            ),
                          ),
                          //fillColor: Colors.green
                        ),onFieldSubmitted: (val){
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                CategoryNews(
                                  newsCategory: val.toLowerCase(),
                                )
                        ));
                      },
                        validator: (val) {
                          if(val.length==0) {
                            return "Email cannot be empty";
                          }else{
                            return null;
                          }
                        },
                        keyboardType: TextInputType.name,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    IconButton(icon: Icon(Icons.search, size: 35,), onPressed: (){
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              CategoryNews(
                                newsCategory: searchCategory.text.toLowerCase(),
                              )
                      ));
                    })
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                    itemCount: categories.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10.0,childAspectRatio: 1.0,mainAxisSpacing: 10.0,
                        crossAxisCount: 2),
                    itemBuilder: (BuildContext context, int index){
                      return new CategoryCard(
                        imageAssetUrl: categories[index].imageAssetUrl,
                        categoryName: categories[index].categorieName,
                      );
                    }),
              ),
            ],
          )),
    ));
  }
}
