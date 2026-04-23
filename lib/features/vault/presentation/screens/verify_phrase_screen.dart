import 'dart:math';

import 'package:flutter/material.dart';
import 'package:frontend/core/utils/app_assets.dart';

class VerifyPhraseScreen extends StatefulWidget {
  const VerifyPhraseScreen({super.key});

  @override
  State<VerifyPhraseScreen> createState() => _VerifyPhraseScreenState();
}

class _VerifyPhraseScreenState extends State<VerifyPhraseScreen>
    with SingleTickerProviderStateMixin {
  final List<TextEditingController> _controllers =
  List.generate(3, (_) => TextEditingController());

  List<int>? _randomIndices;
  List<String>? _originalPhrase;
  bool _isError = false;
  bool _isButtonEnabled = false;
  late AnimationController _shakeController;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    for (final controller in _controllers) {
      controller.addListener(_validateInputs);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_originalPhrase == null) {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args is List<String>) {
        _originalPhrase = args;
        _generateRandomIndices();
      }
    }
  }

  void _generateRandomIndices() {
    final list = List<int>.generate(12, (i) => i)
    ..shuffle();
    setState(() {
      _randomIndices = list.take(3).toList()..sort();
    });
  }

  void _validateInputs() {
    setState(() {
      _isButtonEnabled = _controllers.every((c) => c.text.trim().isNotEmpty);
      if (_isError) _isError = false;
    });
  }

  Future<void> _verifyAndSubmit() async {
    if (_originalPhrase == null || _randomIndices == null) return;

    var allCorrect = true;
    for (var i = 0; i < 3; i++) {
      final userInput = _controllers[i].text.trim().toLowerCase();
      final correctWord =
      _originalPhrase![_randomIndices![i]].trim().toLowerCase();

      if (userInput != correctWord) {
        allCorrect = false;
        break;
      }
    }

    if (allCorrect) {
      await Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
    } else {
      setState(() => _isError = true);
      await _shakeController.forward(from: 0);
    }
  }

  @override
  void dispose() {
    for (final c in _controllers) {
      c.dispose();
    }
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_randomIndices == null) {
      return const Scaffold
      (body: Center(child: CircularProgressIndicator()));
    }

    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final _ = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon:
          Icon(Icons.arrow_back_ios_new, color: colorScheme.primary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Перевірка запису',
                style: textTheme.displayLarge?.copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                _isError
                    ? 'Слова не збігаються. Спробуйте ще раз!'
                    : 'Будь ласка, введіть вказані слова з вашої секретної фрази',
                style: textTheme.bodyMedium?.copyWith(
                  color: _isError ? colorScheme.error : null,
                  fontWeight: _isError ? FontWeight.bold : null,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              AnimatedBuilder(
                animation: _shakeController,
                builder: (context, child) {
                  final offset = sin(_shakeController.value * pi * 4) * 8;
                  return Transform.translate(
                    offset: Offset(_isError ? offset : 0, 0),
                    child: child,
                  );
                },
                child: Column(
                  children: List.generate(3, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: _buildNumberedField(
                          context,
                          _randomIndices![index] + 1,
                          _controllers[index]
                      ),
                    );
                  }),
                ),
              ),

              const SizedBox(height: 40),
              Image.asset
                (AppAssets.logo, height: 170, width: 170, fit: BoxFit.contain),

              const SizedBox(height: 60),

              FilledButton(
                onPressed: _isButtonEnabled ? _verifyAndSubmit : null,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: Text(
                  'Зареєструватись',
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

  Widget _buildNumberedField(BuildContext context, int number,
      TextEditingController controller) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isLight = Theme.of(context).brightness == Brightness.light;

    return Row(
      children: [
        SizedBox(
          width: 35,
          child: Text(
            '$number.',
            style: textTheme.titleMedium?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            height: 60,
            decoration: BoxDecoration(
              color: isLight ? Colors.white :
              colorScheme.surfaceContainerHighest.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _isError
                    ? colorScheme.error.withValues(alpha:0.5)
                    : colorScheme.primary.withValues(alpha:0.15),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha:0.04),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: TextField(
                controller: controller,
                textAlign: TextAlign.center,
                style: textTheme.bodyLarge,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  border: InputBorder.none,
                  hintText: 'Введіть слово...',
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                  filled: false,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
