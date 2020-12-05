import 'package:credilio_flutter_news_api/search/search.dart';
import 'package:credilio_flutter_news_api/views/categorySelection.dart';
import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';

Widget MyAppBar(
    {BuildContext context,
    bool backButton = false,
    bool actionButton = true,
    List searchingList,
    String heading1 ="Credilio",
    String heading2 ="NewsApp"}) {
  return AppBar(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
    ),

    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(heading1,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w800,),
        ),
        Text(heading2,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800,),
        )
      ],
    ),
    automaticallyImplyLeading: backButton,
    actions: [
      actionButton
          ? Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    showSearch(context: context, delegate: Search(searchingList));
                  }),
            ),
          )
          : Container(),

    ],
    backgroundColor: Colors.teal[100],
    elevation: 18.0,
  );
}


Widget speedDialFab(BuildContext context){
  return SpeedDial(
    // both default to 16
    marginRight: 18,
    marginBottom: 20,
    animatedIcon: AnimatedIcons.menu_close,
    animatedIconTheme: IconThemeData(size: 22.0),
    // this is ignored if animatedIcon is non null
    // child: Icon(Icons.add),
    // If true user is forced to close dial manually
    // by tapping main button and overlay is not rendered.
    closeManually: false,
    curve: Curves.bounceIn,
    overlayColor: Colors.black,
    overlayOpacity: 0.5,
    onOpen: () => print('OPENING DIAL'),
    onClose: () => print('DIAL CLOSED'),
    tooltip: 'Seetings',
    // heroTag: 'speed-dial-hero-tag',
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    elevation: 8.0,
    shape: CircleBorder(),
    children: [
      SpeedDialChild(
          child: Icon(Icons.settings),
          backgroundColor: Colors.teal[100],
          label: 'News Categorys',
          labelStyle: TextStyle(fontSize: 18.0),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Categorie()),
            );
          }
      ),
    ],
  );
}