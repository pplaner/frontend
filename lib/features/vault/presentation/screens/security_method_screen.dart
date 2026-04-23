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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Text(
                'Метод захисту',
                style: textTheme.displayLarge?.copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                'Оберіть, як ви будете отримувати доступ до своїх зашифрованих планів',
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
              _buildOption(
                title: 'Seed-фраза',
                subtitle: 'Максимальний захист. 12 випадкових слів. Тільки для вас.',
                id: 'seed',
              ),

              const Spacer(),


              FilledButton(
                onPressed: selectedMethodId == null ? null : () async {
                  if (selectedMethodId == 'pin') {
                    await Navigator.pushNamed(context, '/pin');
                  } else if (selectedMethodId == 'pattern') {
                    await Navigator.pushNamed(context, '/pattern');
                  } else if (selectedMethodId == 'word') {
                    await Navigator.pushNamed(context, '/association');
                  } else if (selectedMethodId == 'seed') {
                    await Navigator.pushNamed(context, '/secret');
                  }
                },
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  backgroundColor: colorScheme.primary,
                  disabledBackgroundColor:
                  colorScheme.primary.withValues(alpha:0.5),
                ),
                child: const Text('Далі'),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOption({
    required String title,
    required String subtitle,
    required String id,
  }) {
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
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: isSelected ? colorScheme.primary : Colors.transparent,
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.05),
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
                style: textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
