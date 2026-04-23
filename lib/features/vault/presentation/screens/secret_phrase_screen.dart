import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SecretPhraseScreen extends StatelessWidget {
  const SecretPhraseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    final seedPhrase = <String>[
      'apple', 'forest', 'shield', 'river',
      'planet', 'window', 'crypto', 'secure',
      'cloud', 'alpha', 'matrix', 'delta'
    ];

    return Scaffold(
      backgroundColor: colorScheme.surface,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: colorScheme.primary,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 40),

              Text(
                'Ваша секретна фраза',
                style: textTheme.displayLarge?.copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorScheme.errorContainer.withValues(alpha:0.05),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: colorScheme.error.withValues(alpha:0.2),
                  ),
                ),
                child: Text(
                  'Запишіть ці 12 слів на папері та зберігайте їх у безпечному місці. Якщо ви їх загубите, доступ до ваших даних буде неможливо відновити.',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha:0.9),
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 32),

              Expanded(
                child: GridView.builder(
                  itemCount: seedPhrase.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1.8,
                  ),
                  itemBuilder: (context, index) {
                    return _buildWordCard(
                      context,
                      index + 1,
                      seedPhrase[index],
                    );
                  },
                ),
              ),

              TextButton.icon(
                onPressed: () async {
                  await Clipboard.setData
                    (ClipboardData(text: seedPhrase.join(' ')));
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Фразу скопійовано у буфер')),
                  );
                },
                icon: Icon(Icons.copy_rounded, size: 18,
                    color: colorScheme.primary),
                label: Text(
                  'Скопіювати в буфер',
                  style: textTheme.labelMedium?.copyWith(
                    color: colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              FilledButton(
                onPressed: () async {
                  await Navigator.pushNamed(
                    context,
                    '/verify',
                    arguments: seedPhrase,
                  );
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: Text(
                  'Я записав/ла ці слова',
                  style: textTheme.labelLarge?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWordCard(BuildContext context, int number, String word) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha:0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 4,
            left: 6,
            child: Text(
              '$number',
              style: textTheme.bodySmall?.copyWith(
                fontSize: 10,
                color: colorScheme.primary.withValues(alpha:0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Text(
                word,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
