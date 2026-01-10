import 'package:flutter_riverpod/legacy.dart';

class CounterNotifier extends StateNotifier<int> {
  CounterNotifier() : super(0); // initial value = 0
  void increment() {
    state++;
  }

  void decrement() {
    state--;
  }

  void reset() {
    state = 0;
  }
}

final counterProvider = StateNotifierProvider.autoDispose<CounterNotifier, int>((ref) {
  return CounterNotifier();
});