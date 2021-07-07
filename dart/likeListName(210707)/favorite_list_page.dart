import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class FavoriteListPage extends StatelessWidget {
  final List<WordPair> favorites;

  FavoriteListPage(
    this.favorites, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("favorite List")
        ),
      body: ListView.separated(itemBuilder: (context, index){
        return ListTile(
          title: Text(
            favorites[index].asPascalCase,
            /*textScaleFactor: 1.8,*/
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        );
      }, separatorBuilder: (BuildContext context, int index){
        return Divider(
          thickness: 1,
          color: Colors.grey[300],
          height: 30,
          indent: 16,
          endIndent: 16,
        );
      }, itemCount: favorites.length)
    );
  }
}
