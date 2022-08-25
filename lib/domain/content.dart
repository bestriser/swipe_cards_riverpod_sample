import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';

@freezed
class Content with _$Content {
  const factory Content({
    required String text,
    required Color color,
  }) = _Content;

  static List<Content> defaultContents = const [
    Content(text: 'Red', color: Colors.red),
    Content(text: 'Blue', color: Colors.blue),
    Content(text: 'Green', color: Colors.green),
    Content(text: 'Yellow', color: Colors.yellow),
    Content(text: 'Orange', color: Colors.orange),
  ];
}
