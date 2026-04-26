import 'package:flutter/material.dart';
import 'package:frontend/core/utils/app_assets.dart';

class AssociationScreen extends StatefulWidget {
  final bool isSetup;

  const AssociationScreen({super.key, this.isSetup = false});

  @override
  State<AssociationScreen> createState() => _AssociationScreenState();
}

class _AssociationScreenState extends State<AssociationScreen> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _isButtonEnabled = false;
  final RegExp _lettersOnly = RegExp(r'^[a-zA-Zа-яА-ЯіїєґІЇЄҐ]+$');

  bool get _hasError =>
      _controller.text.isNotEmpty && !_isButtonEnabled;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() => setState(() {}));
    _controller.addListener(() {
      final text = _controller.text;
      setState(() {
        _isButtonEnabled = text.length >= 6 && _lettersOnly.hasMatch(text);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (widget.isSetup) {
      Navigator.pushNamed(context, '/secret-setup');
    } else {
      // TODO: перевірити слово-асоціацію і увійти
    }
  }

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                widget.isSetup ? 'Придумайте\nасоціацію' : 'Введіть\nасоціацію',
                style: textTheme.displayLarge?.copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                widget.isSetup
                    ? 'Слово має містити щонайменше 6 символів (без пробілів, цифр та знаків)'
                    : 'Введіть ваше слово-асоціацію для входу',
                style: textTheme.bodyMedium?.copyWith(
                  color: _hasError ? colorScheme.error : null,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: isLight
                      ? Colors.white
                      : colorScheme.surfaceContainerHighest.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _hasError
                        ? colorScheme.error.withValues(alpha: 0.5)
                        : colorScheme.primary.withValues(alpha: 0.15),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.04),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: TextField(
                    controller: _controller,
                    focusNode: _focusNode,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(fontSize: 16),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.zero,
                      border: InputBorder.none,
                      filled: false,
                      hintText: _focusNode.hasFocus ? '' : 'Введіть слово-асоціацію',
                      hintStyle: const TextStyle(color: Colors.grey, fontSize: 15),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 60),
              Image.asset(AppAssets.logo, height: 170, width: 170, fit: BoxFit.contain),
              const SizedBox(height: 80),
              FilledButton(
                onPressed: _isButtonEnabled ? _onSubmit : null,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: Text(
                  widget.isSetup ? 'Зареєструватись' : 'Увійти',
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