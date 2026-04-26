import 'package:flutter/material.dart';

class SecurityMethodScreen extends StatefulWidget {
  const SecurityMethodScreen({super.key});

  @override
  State<SecurityMethodScreen> createState() => _SecurityMethodScreenState();
}

class _SecurityMethodScreenState extends State<SecurityMethodScreen> {
  String? selectedMethodId;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      // Додаємо AppBar для можливості повернутися назад
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0, // Щоб колір не змінювався при скролі
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
        // top: false, щоб контент не "відстрибував" вниз через AppBar
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Text(
                'Метод захисту',
                style: textTheme.displayLarge?.copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Оберіть спосіб швидкого входу. Секретна фраза буде створена обов’язково на наступному кроці.',
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              _buildOption(
                title: 'PIN-код',
                subtitle: 'Швидкий доступ через 4-значний код',
                id: 'pin',
              ),
              _buildOption(
                title: 'Графічний ключ',
                subtitle: 'Захист за допомогою унікального жесту',
                id: 'pattern',
              ),
              _buildOption(
                title: 'Слово-асоціація',
                subtitle: 'Пароль із підказкою для відновлення',
                id: 'word',
              ),

              const Spacer(),

              FilledButton(
                onPressed: selectedMethodId == null ? null : () {
                  if (selectedMethodId == 'pin') {
                    Navigator.pushNamed(context, '/pin-setup');
                  } else if (selectedMethodId == 'pattern') {
                    Navigator.pushNamed(context, '/pattern-setup');
                  } else if (selectedMethodId == 'word') {
                    Navigator.pushNamed(context, '/association-setup');
                  }
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: const Text(
                  'Далі',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption({required String title, required String subtitle, required String id}) {
    final isSelected = selectedMethodId == id;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => setState(() => selectedMethodId = id),
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? colorScheme.primary : colorScheme.primary.withOpacity(0.1),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Text(
                title,
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                style: textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}