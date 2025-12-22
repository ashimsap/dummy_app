import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/all_providers.dart';

class CurrencyScreen extends ConsumerWidget {
  const CurrencyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currencyAsyncValue = ref.watch(currencyProvider);

    return Center(
      child: currencyAsyncValue.when(
        data: (currency) {
           // Safely accessing values
           final usdToEur = currency.rates['EUR']?.toStringAsFixed(2) ?? 'N/A';
           final usdToGbp = currency.rates['GBP']?.toStringAsFixed(2) ?? 'N/A';
           final usdToJpy = currency.rates['JPY']?.toStringAsFixed(2) ?? 'N/A';

           return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Base Currency: USD', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text('1 USD = $usdToEur EUR', style: const TextStyle(fontSize: 18)),
              Text('1 USD = $usdToGbp GBP', style: const TextStyle(fontSize: 18)),
              Text('1 USD = $usdToJpy JPY', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => ref.refresh(currencyProvider),
                child: const Text('Refresh Rates'),
              ),
            ],
          );
        },
        loading: () => const CircularProgressIndicator(),
        error: (err, stack) => Text('Error: $err'),
      ),
    );
  }
}
