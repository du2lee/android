import 'package:english_words/english_words.dart';
import 'package:flutte_app/favorite_list_page.dart';
import 'package:flutter/material.dart';

Set<WordPair> _saved = Set<WordPair>();

class WordListPage extends StatelessWidget {
  const WordListPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Startup Name Generator"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.star),
              onPressed: () {
                print("Press Action Button");
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FavoriteListPage(_saved.toList());
                }));
              })
        ],
      ),
      body: Center(child: RandomWords()),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  List<WordPair> words = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) {
      if (index >= words.length) words.addAll(generateWordPairs().take(10));
      return _getRow(words[index]);
    });
  }

  Widget _getRow(WordPair wordPair) {
    bool _isAlreadySaved = _saved.contains(wordPair);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          onTap: () {
            setState(() {
              if (_isAlreadySaved) {
                _saved.remove(wordPair);
              } else {
                _saved.add(wordPair);
              }
            });
            //print(saved.toString());
          },
          title: Text(
            wordPair.asCamelCase,
            /*textScaleFactor: 1.8,*/
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          trailing: Icon(
            _isAlreadySaved ? Icons.star : Icons.star_border,
            color:
                _isAlreadySaved ? Colors.yellowAccent[400] : Colors.grey[400],
          ),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey[300],
          height: 30,
          indent: 16,
          endIndent: 16,
        )
      ],
    );
  }
}