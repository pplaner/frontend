import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:frontend/core/utils/app_assets.dart';

class SecretPhraseScreen extends StatefulWidget {
  final bool isSetup;

  const SecretPhraseScreen({super.key, this.isSetup = false});

  @override
  State<SecretPhraseScreen> createState() => _SecretPhraseScreenState();
}

class _SecretPhraseScreenState extends State<SecretPhraseScreen> {
  // Використовується тільки при isSetup = true
  final List<String> seedPhrase = [
    'apple', 'forest', 'shield', 'river',
    'planet', 'window', 'crypto', 'secure',
    'cloud', 'alpha', 'matrix', 'delta',
  ];

  // Використовується тільки при isSetup = false (вхід)
  final List<TextEditingController> _controllers =
  List.generate(12, (_) => TextEditingController());
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    if (!widget.isSetup) {
      for (final c in _controllers) {
        c.addListener(_validateInputs);
      }
    }
  }

  void _validateInputs() {
    setState(() {
      _isButtonEnabled = _controllers.every((c) => c.text.trim().isNotEmpty);
    });
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    super.dispose();
  }

  void _onSubmit() {
    if (widget.isSetup) {
      // НАВІГАЦІЯ: переходимо на сторінку підтвердження та передаємо фразу
      Navigator.pushNamed(
        context,
        '/verify-seed',
        arguments: seedPhrase,
      );
    } else {
      // Тут буде логіка входу через сід-фразу
      print('Вхід через сід-фразу...');
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isSetup ? _buildSetupView(context) : _buildLoginView(context);
  }

  // ── Вигляд для СТВОРЕННЯ (показуємо слова) ──
  Widget _buildSetupView(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colorScheme.primary, size: 20),
          onPressed: () => Navigator.pop(context),
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
                  color: colorScheme.errorContainer.withValues(alpha: 0.05),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: colorScheme.error.withValues(alpha: 0.2)),
                ),
                child: Text(
                  'Запишіть ці 12 слів на папері та зберігайте їх у безпечному місці. Якщо ви їх загубите, доступ до ваших даних буде неможливо відновити.',
                  style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.9),
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
                  itemBuilder: (context, index) =>
                      _buildWordCard(context, index + 1, seedPhrase[index]),
                ),
              ),
              TextButton.icon(
                onPressed: () async {
                  await Clipboard.setData(ClipboardData(text: seedPhrase.join(' ')));
                  if (!context.mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Фразу скопійовано у буфер')),
                  );
                },
                icon: Icon(Icons.copy_rounded, size: 18, color: colorScheme.primary),
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
                onPressed: _onSubmit,
                style: FilledButton.styleFrom(minimumSize: const Size(double.infinity, 56)),
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

  // ── Вигляд для ВХОДУ (вводимо слова) ──
  Widget _buildLoginView(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colorScheme.primary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Введіть вашу\nсекретну фразу',
                style: textTheme.displayLarge?.copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Введіть усі 12 слів у правильному порядку',
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  itemCount: 12,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.8,
                  ),
                  itemBuilder: (context, index) => _buildInputCard(
                    context,
                    index + 1,
                    _controllers[index],
                    isLight,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Image.asset(AppAssets.logo, height: 80, width: 80, fit: BoxFit.contain),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: _isButtonEnabled ? _onSubmit : null,
                style: FilledButton.styleFrom(minimumSize: const Size(double.infinity, 56)),
                child: Text(
                  'Увійти',
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
          color: colorScheme.primary.withValues(alpha: 0.5),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
                color: colorScheme.primary.withValues(alpha: 0.7),
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

  Widget _buildInputCard(
      BuildContext context,
      int number,
      TextEditingController controller,
      bool isLight,
      ) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        color: isLight ? Colors.white : colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.primary.withValues(alpha: 0.3),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
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
                color: colorScheme.primary.withValues(alpha: 0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: TextField(
              controller: controller,
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(fontSize: 12),
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
                filled: false,
                hintText: 'слово',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}