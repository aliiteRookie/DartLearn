import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
class RandomWordsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair=new WordPair.random();
    return Padding(padding: const EdgeInsets.all(8.0),
    child: Text(wordPair.toString()),
    );
  }

}