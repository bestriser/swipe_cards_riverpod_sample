import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipe_cards_sample/presentation/swipe_cards_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Swipe Cards Sample',
        theme: ThemeData(primarySwatch: Colors.blue),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        home: const SwipeCardsPage(),
      ),
    );
  }
}
