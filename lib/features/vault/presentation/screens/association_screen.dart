import 'package:flutter/material.dart';
import 'package:frontend/core/utils/app_assets.dart';

class AssociationScreen extends StatefulWidget {
  const AssociationScreen({super.key});

  @override
  State<AssociationScreen> createState() => _AssociationScreenState();
}

class _AssociationScreenState extends State<AssociationScreen> {
  final TextEditingController _associationController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isButtonEnabled = false;
  final RegExp _lettersOnly = RegExp(r'^[a-zA-Zа-яА-ЯіїєґІЇЄҐ]+$');

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      setState(() {});
    });

    _associationController.addListener(() {
      final text = _associationController.text;
      setState(() {
        _isButtonEnabled = text.length >= 6 && _lettersOnly.hasMatch(text);});
    });
  }

  @override
  void dispose() {
    _associationController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final isLight = Theme.of(context).brightness == Brightness.light;
    final _ = _associationController.text.isNotEmpty && !_isButtonEnabled;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,
              color: colorScheme.primary, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Придумайте\nасоціацію',
                style: textTheme.displayLarge?.copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Слово має містити щонайменше 6 символів (без пробілів, цифр та знаків)',
                style: textTheme.bodyMedium?.copyWith(
                  color: _associationController.text.isNotEmpty &&
                      !_isButtonEnabled
                      ? colorScheme.error
                      : null,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: isLight ? Colors.white :
                  colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _associationController.text.isNotEmpty &&
                        !_isButtonEnabled
                        ? colorScheme.error.withValues(alpha:0.5)
                        : colorScheme.primary.withValues(alpha:.15),
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
                    controller: _associationController,
                    focusNode: _focusNode,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      filled: false,
                      hintText: _focusNode.hasFocus ?
                      '' : 'Введіть слово-асоціацію',
                      hintStyle:
                      const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 60),

              Image.asset(
                AppAssets.logo,
                height: 170,
                width: 170,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 80),

              FilledButton(
                onPressed: _isButtonEnabled ? () {
                } : null,
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
}
