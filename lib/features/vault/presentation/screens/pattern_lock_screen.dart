import 'dart:math';
import 'package:flutter/material.dart';
import 'package:frontend/core/utils/app_assets.dart';
import 'package:pattern_lock/pattern_lock.dart';

class PatternLockScreen extends StatefulWidget {
  const PatternLockScreen({super.key});

  @override
  State<PatternLockScreen> createState() => _PatternLockScreenState();
}

class _PatternLockScreenState extends State<PatternLockScreen> with
    SingleTickerProviderStateMixin {
  List<int>? pattern;
  bool isError = false;

  late AnimationController _shakeController;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  Future<void> _triggerError() async {
    setState(() {
      isError = true;
    });

    await _shakeController.forward(from: 0);

    Future.delayed(const Duration(seconds: 1), () {
      if (mounted) {
        setState(() {
          isError = false;
          pattern = null;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colorScheme.primary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Придумайте графічний ключ',
                style: textTheme.displayLarge?.copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                isError ? 'Занадто короткий ключ!' :
                "З'єднайте щонайменше 4 точки",
                style: textTheme.bodyMedium?.copyWith(
                  color: isError ? Colors.red : null,
                  fontWeight: isError ? FontWeight.bold : null,
                ),
                textAlign: TextAlign.center,
              ),

              const Spacer(flex: 3),

              AnimatedBuilder(
                animation: _shakeController,
                builder: (context, child) {
                  final offset = sin(_shakeController.value * pi * 4) * 10;
                  return Transform.translate(
                    offset: Offset(isError ? offset : 0, 0),
                    child: child,
                  );
                },
                child: SizedBox(
                  height: 300,
                  child: PatternLock(
                    selectedColor: isError ? Colors.red : colorScheme.primary,
                    notSelectedColor:
                    colorScheme.onSurface.withValues(alpha:0.2),
                    onInputComplete: (input) async {
                      if (input.length < 4) {
                        await _triggerError();
                      } else {
                        setState(() {
                          isError = false;
                          pattern = input;
                        });
                      }
                    },
                  ),
                ),
              ),

              const Spacer(),

              Image.asset(
                AppAssets.logo,
                height: 160,
                width: 160,
                fit: BoxFit.contain,
              ),

              const Spacer(flex: 3),

              FilledButton(
                onPressed: (pattern != null && pattern!.length >= 4 && !isError)
                    ? () {}
                    : null,

                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: const Text('Зареєструватись'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
