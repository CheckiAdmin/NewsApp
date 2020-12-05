import 'package:credilio_flutter_news_api/globalVariable.dart' as globals;
import 'package:credilio_flutter_news_api/models/categorie_model.dart';
import 'package:credilio_flutter_news_api/newsCategory/data.dart';
import 'package:credilio_flutter_news_api/widget/appBar_widget.dart';
import 'package:credilio_flutter_news_api/widget/categoryCard_widget.dart';
import 'package:flutter/material.dart';
import 'package:multiselect_formfield/multiselect_formfield.dart';

import 'categorie_news.dart';

class Categorie extends StatefulWidget {
  @override
  _CategorieState createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  List<CategorieModel> categories = List<CategorieModel>();
  List<Map> categrioslist = List<Map>();
  Map<dynamic, dynamic> values = new Map<dynamic, dynamic>();
  TextEditingController searchCategory = new TextEditingController();
  bool viewType = false;
  String multipleCategory = "";

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    for (int a = 0; a < categories.length; a++) {
      values = {
        "display": categories[a].categorieName,
        "value": categories[a].categorieName
      };
      categrioslist.add(values);
    }
  }

  int _radioValue3 = globals.StoreData().checkViewType() ? 1 : 2;

  void _handleRadioValueChange3(int value) {
    setState(() {
      _radioValue3 = value;

      switch (_radioValue3) {
        case 1:
          print(_radioValue3);
          // correctScore++;/
          setState(() {
            viewType = true;
            globals.StoreData().setViewType(true);
          });

          break;
        case 2:
          setState(() {
            viewType = true;
            globals.StoreData().setViewType(false);
          });

          print(_radioValue3);
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: MyAppBar(
          context: context,
          backButton: true,
          actionButton: false,
          viewTypeChanged: viewType),
      body: Container(
          margin: EdgeInsets.all(4.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0, top: 10.0),
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
              Divider(color: Colors.black,),
              Card(
                color: Colors.white70,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Select Your view type",
                          style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w800,
                              fontSize: 22.0
                          ),
                        ),
                      ),
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Radio(
                          value: 1,
                          groupValue: _radioValue3,
                          onChanged: _handleRadioValueChange3,
                        ),
                        new Text(
                          'ListView',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                        new Radio(
                          value: 2,
                          groupValue: _radioValue3,
                          onChanged: _handleRadioValueChange3,
                        ),
                        new Text(
                          'CardView',
                          style: new TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ],
                ),),
              Divider(color: Colors.black,),

              Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
                child: MultiSelectFormField(
                  autovalidate: false,
                  chipBackGroundColor: Colors.teal[100],
                  chipLabelStyle: TextStyle(fontWeight: FontWeight.bold),
                  dialogTextStyle: TextStyle(fontWeight: FontWeight.bold),
                  checkBoxActiveColor: Colors.red,
                  checkBoxCheckColor: Colors.green,
                  dialogShapeBorder: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0))),
                  title: Text(
                    "List of categories",
                    style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.w800,
                        fontSize: 18.0
                    ),
                  ),
                  dataSource: categrioslist,
                  textField: 'display',
                  valueField: 'value',
                  okButtonLabel: 'OK',
                  cancelButtonLabel: 'CANCEL',
                  hintWidget: Text(
                    'Tap to choose one or more', style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w800,
                      fontSize: 18.0
                  ),),
                  onSaved: (value) {
                    print(List
                        .castFrom(value)
                        .length);
                    print(multipleCategory = value.join(' OR '));
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>
                            CategoryNews(
                              newsCategory: multipleCategory.toLowerCase(),
                            )
                    ));
                  },
                ),
              ),
              Divider(color: Colors.black,),

              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: GridView.builder(
                            itemCount: categories.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10.0,
                                childAspectRatio: 1.0,
                                mainAxisSpacing: 10.0,
                                crossAxisCount: 2),
                            itemBuilder: (BuildContext context, int index) {
                              return new CategoryCard(
                                imageAssetUrl: categories[index].imageAssetUrl,
                                categoryName: categories[index].categorieName,
                              );
                            }),
                      ),
                    ),


                  ],
                ),
              ),
            ],
          )),
    ));
  }
}


