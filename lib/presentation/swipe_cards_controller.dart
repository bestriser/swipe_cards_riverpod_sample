import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';
import 'package:swipe_cards_riverpod_sample/domain/content.dart';

final swipeCardsProvider = StateNotifierProvider.family<SwipeCardsController,
    List<SwipeItem>, List<Content>>((ref, contents) {
  final swipeItems = List.generate(
    contents.length,
    (index) => SwipeItem(
      content: contents[index],
      likeAction: () => BotToast.showText(
        text: 'Liked ${contents[index].text}',
        duration: const Duration(milliseconds: 500),
      ),
      nopeAction: () => BotToast.showText(
        text: 'Nope ${contents[index].text}',
        duration: const Duration(milliseconds: 500),
      ),
      superlikeAction: () => BotToast.showText(
        text: 'superLike ${contents[index].text}',
        duration: const Duration(milliseconds: 500),
      ),
      onSlideUpdate: (SlideRegion? region) async {
        if (kDebugMode) print('Region $region');
      },
    ),
  );

  final matchEngine = MatchEngine(swipeItems: swipeItems);

  return SwipeCardsController(swipeItems, matchEngine);
});

class SwipeCardsController extends StateNotifier<List<SwipeItem>> {
  SwipeCardsController(List<SwipeItem> swipeItems, this.matchEngine)
      : super(swipeItems);

  final MatchEngine matchEngine;

  void nope() => matchEngine.currentItem?.nope();

  void superLike() => matchEngine.currentItem?.superLike();

  void like() => matchEngine.currentItem?.like();
}
