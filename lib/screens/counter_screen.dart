import 'package:flutter/material.dart';
import '../providers/counter_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 👀 watch the counter value
    final count = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Riverpod Counter')),
      body: Center(
        child: Text(
          'Count: $count',
          style: const TextStyle(fontSize: 32),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              // ✍️ call logic, NOT changing state directly
              ref.read(counterProvider.notifier).increment();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).decrement();
            },
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              ref.read(counterProvider.notifier).reset();
            },
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
