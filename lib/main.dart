import 'package:flutter/material.dart';
import 'package:swipe_cards_sample/presentation/swipe_cards_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe Cards Sample',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SwipeCardsPage(),
    );
  }
}
