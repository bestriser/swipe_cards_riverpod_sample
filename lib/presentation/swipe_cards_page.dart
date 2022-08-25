import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipe_cards_sample/domain/content.dart';
import 'package:swipe_cards_sample/presentation/swipe_cards_controller.dart';

class SwipeCardsPage extends ConsumerWidget {
  const SwipeCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(swipeCardsProvider(Content.defaultContents));
    final ctr = ref.read(swipeCardsProvider(Content.defaultContents).notifier);

    return Scaffold(
      appBar: AppBar(title: const Text('Swipe Cards Sample')),
      body: Column(
        children: [
          SizedBox(
            height: 550,
            child: SwipeCards(
              matchEngine: ctr.matchEngine,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: state[index].content.color,
                  child: Text(
                    state[index].content.text,
                    style: const TextStyle(fontSize: 100),
                  ),
                );
              },
              onStackFinished: () => BotToast.showText(
                text: 'Stack Finished',
                duration: const Duration(milliseconds: 500),
              ),
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
                onPressed: () => ctr.nope(),
                child: const Text('Nope'),
              ),
              ElevatedButton(
                onPressed: () => ctr.superLike(),
                child: const Text('SuperLike'),
              ),
              ElevatedButton(
                onPressed: () => ctr.like(),
                child: const Text('Like'),
              )
            ],
          )
        ],
      ),
    );
  }
}
