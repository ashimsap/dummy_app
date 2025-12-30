import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/all_providers.dart';

class CurrencyScreen extends ConsumerStatefulWidget {
  const CurrencyScreen({super.key});

  @override
  ConsumerState<CurrencyScreen> createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends ConsumerState<CurrencyScreen> {
  String _selectedCurrency = 'EUR';
  final List<String> _currencies = ['EUR', 'GBP', 'JPY', 'NPR', 'CAD', 'AUD', 'CNY', 'INR'];

  @override
  Widget build(BuildContext context) {
    final currencyAsyncValue = ref.watch(currencyProvider);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: currencyAsyncValue.when(
          data: (currency) {
            // Get rate for selected currency, fallback to 0.0 if not found
            final rate = currency.rates[_selectedCurrency] ?? 0.0;
            
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  elevation: 4,
                  color: Theme.of(context).colorScheme.surface,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        Text(
                          'Exchange Rate',
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildCurrencyBlock(context, '1', 'USD'),
                            Icon(Icons.arrow_forward, color: Theme.of(context).colorScheme.outline),
                            _buildCurrencyBlock(context, rate.toStringAsFixed(2), _selectedCurrency),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedCurrency,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: TextStyle(color: Theme.of(context).colorScheme.onSurfaceVariant, fontSize: 18),
                      onChanged: (String? value) {
                        if (value != null) {
                          setState(() {
                            _selectedCurrency = value;
                          });
                        }
                      },
                      items: _currencies.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                FilledButton.icon(
                  onPressed: () => ref.refresh(currencyProvider),
                  icon: const Icon(Icons.refresh),
                  label: const Text('Update Rates'),
                ),
              ],
            );
          },
          loading: () => const CircularProgressIndicator(),
          error: (err, stack) => Text('Error: $err'),
        ),
      ),
    );
  }

  Widget _buildCurrencyBlock(BuildContext context, String amount, String currency) {
    return Column(
      children: [
        Text(
          amount,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          currency,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ],
    );
  }
}
