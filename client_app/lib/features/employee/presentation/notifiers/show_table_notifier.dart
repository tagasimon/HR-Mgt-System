import 'package:flutter_riverpod/flutter_riverpod.dart';

// show table notifier provider
final showTableNotifierProvider =
    StateNotifierProvider<ShowTableNotifierNotifier, bool>((ref) {
  return ShowTableNotifierNotifier();
});

class ShowTableNotifierNotifier extends StateNotifier<bool> {
  ShowTableNotifierNotifier() : super(true);

  void toggle() {
    state = !state;
  }
}
