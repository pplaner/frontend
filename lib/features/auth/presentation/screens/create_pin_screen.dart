import 'package:flutter/material.dart';
import 'package:frontend/core/utils/app_assets.dart';

class CreatePinScreen extends StatefulWidget {
  const CreatePinScreen({super.key});

  @override
  State<CreatePinScreen> createState() => _CreatePinScreenState();
}

class _CreatePinScreenState extends State<CreatePinScreen> {
  String pinCode = '';

  void _addDigit(String digit) {
    if (pinCode.length < 4) {
      setState(() {
        pinCode += digit;
      });
    }
  }

  void _removeDigit() {
    if (pinCode.isNotEmpty) {
      setState(() {
        pinCode = pinCode.substring(0, pinCode.length - 1);
      });
    }
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
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: colorScheme.primary,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                'Створення PIN-коду',
                style: textTheme.displayLarge?.copyWith(fontSize: 26),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                'Для швидкого доступу до ваших планів',
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image.asset(
                AppAssets.logo,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
              const Spacer(),
              _buildPinDots(pinCode.length, context),
              const SizedBox(height: 30),
              _buildKeypad(context),
              const Spacer(),
              FilledButton(
                onPressed: pinCode.length == 4 ? () {} : null,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: Text(
                  'Зареєструватись',
                  style: textTheme.labelLarge?.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPinDots(int filledLength, BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (index) {
        final isFilled = index < filledLength;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isFilled ? colorScheme.primary : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: colorScheme.primary.withValues(alpha: 0.5),
                width: 2,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildKeypad(BuildContext context) {
    return Column(
      children: [
        _buildKeypadRow(['1', '2', '3'], context),
        const SizedBox(height: 16),
        _buildKeypadRow(['4', '5', '6'], context),
        const SizedBox(height: 16),
        _buildKeypadRow(['7', '8', '9'], context),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 70),
            const SizedBox(width: 24),
            _buildDigitKey('0', context),
            const SizedBox(width: 24),
            _buildBackspaceKey(context),
          ],
        ),
      ],
    );
  }

  Widget _buildKeypadRow(List<String> digits, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDigitKey(digits[0], context),
        const SizedBox(width: 24),
        _buildDigitKey(digits[1], context),
        const SizedBox(width: 24),
        _buildDigitKey(digits[2], context),
      ],
    );
  }

  Widget _buildDigitKey(String digit, BuildContext context) {
    return InkWell(
      onTap: () => _addDigit(digit),
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        width: 70,
        height: 70,
        child: Center(
          child: Text(
            digit,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceKey(BuildContext context) {
    return InkWell(
      onTap: _removeDigit,
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        width: 70,
        height: 70,
        child: Center(
          child: Icon(
            Icons.backspace_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 26,
          ),
        ),
      ),
    );
  }
}
