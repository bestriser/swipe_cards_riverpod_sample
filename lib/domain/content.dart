import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'content.freezed.dart';

@freezed
class Content with _$Content {
  const factory Content({
    required String text,
    required Color color,
  }) = _Content;
}
