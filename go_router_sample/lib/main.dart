import 'package:flutter/material.dart';
import 'package:go_router_sample/go_router_sample.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// [2022/12/14] go_router: ^5.2.4
// [https://github.com/flutter/flutter/issues/99663] pushやgoが非同期処理ではないため、遷移先から戻った際に値を受け取るのが難しい？（できるにはできる）
// [https://github.com/flutter/packages/pull/2650] 現状ではtabの状態を保持できない
// [https://github.com/flutter/flutter/issues/99112] popUntilなどのメソッドはまだない

void main() {
  runApp(
    const ProviderScope(
      child: GoRouterSample(),
    ),
  );
}
