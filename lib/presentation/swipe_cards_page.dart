import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipe_cards_sample/domain/content.dart';

class SwipeCardsPage extends StatefulWidget {
  const SwipeCardsPage({Key? key}) : super(key: key);

  @override
  State<SwipeCardsPage> createState() => _SwipeCardsPageState();
}

class _SwipeCardsPageState extends State<SwipeCardsPage> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  late MatchEngine _matchEngine;
  final List<String> _names = [
    'Red',
    'Blue',
    'Green',
    'Yellow',
    'Orange',
  ];
  final List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(
        SwipeItem(
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Liked ${_names[i]}'),
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Nope ${_names[i]}'),
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('SuperLiked ${_names[i]}'),
                duration: const Duration(milliseconds: 500),
              ),
            );
          },
          onSlideUpdate: (SlideRegion? region) async {
            if (kDebugMode) print('Region $region');
          },
        ),
      );
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Swipe Cards Sample')),
      body: Column(
        children: [
          SizedBox(
            height: 550,
            child: SwipeCards(
              matchEngine: _matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: _swipeItems[index].content.color,
                  child: Text(
                    _swipeItems[index].content.text,
                    style: const TextStyle(fontSize: 100),
                  ),
                );
              },
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Stack Finished'),
                    duration: Duration(milliseconds: 500),
                  ),
                );
              },
              itemChanged: (SwipeItem item, int index) {
                if (kDebugMode) {
                  print('item: ${item.content.text}, index: $index');
                }
              },
              upSwipeAllowed: true,
              fillSpace: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _matchEngine.currentItem?.nope(),
                child: const Text('Nope'),
              ),
              ElevatedButton(
                onPressed: () => _matchEngine.currentItem?.superLike(),
                child: const Text('SuperLike'),
              ),
              ElevatedButton(
                onPressed: () => _matchEngine.currentItem?.like(),
                child: const Text('Like'),
              )
            ],
          )
        ],
      ),
    );
  }
}
