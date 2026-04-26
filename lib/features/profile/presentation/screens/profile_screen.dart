import 'package:flutter/material.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/app_theme.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Зробити: замінити на Riverpod провайдер
  // false  → є акаунт (Головна 7)
  // true → локальне сховище без акаунту (Головна 13)
  final bool _hasAccount = false;

  int _currentNavIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _hasAccount
            ? _AccountView(
          onNavTap: (i) => setState(() => _currentNavIndex = i),
        )
            : _LocalView(
          onNavTap: (i) => setState(() => _currentNavIndex = i),
          onLogout: () {
            // Зробити: логіка виходу / очищення локального сховища
          },
        ),
      ),
      bottomNavigationBar: _BottomNav(
        currentIndex: _currentNavIndex,
        onTap: (i) => setState(() => _currentNavIndex = i),
      ),
    );
  }
}

// Стан "є акаунт" (Головна 7)

class _AccountView extends StatelessWidget {
  const _AccountView({required this.onNavTap});

  final ValueChanged<int> onNavTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      children: [
        // Аватар + ім'я + email
        _ProfileHeader(
          name: 'Ім\'я',
          email: 'email',
          onTap: () {
            // Зробити: перейти до редагування профілю
          },
        ),

        const SizedBox(height: 12),

        // Кнопка "Створити акаунт"
        _SettingsCard(
          children: [
            _SettingsTile(
              icon: Icons.lock_outline,
              iconBackground: AppColors.cardBorder,
              title: 'Створити акаунт',
              subtitle: 'Створи акаунт, щоб не втратити дані',
              onTap: () {
                // Зробити: перехід до реєстрації
              },
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Блок налаштувань
        _SettingsCard(
          children: [
            _SettingsTile(
              icon: Icons.language_outlined,
              iconBackground: AppColors.primaryContainer,
              title: 'Мова',
              onTap: () {
                // Зробити: вибір мови
              },
            ),
            _Divider(),
            _SettingsTile(
              icon: Icons.dark_mode_outlined,
              iconBackground: AppColors.primaryContainer,
              title: 'Вигляд',
              onTap: () {
                // Зробити: вибір теми
              },
            ),
            _Divider(),
            _SettingsTile(
              icon: Icons.access_time_outlined,
              iconBackground: AppColors.primaryContainer,
              title: 'Дата та час',
              onTap: () {
                // Зробити: налаштування дати та часу
              },
            ),
            _Divider(),
            _SettingsTile(
              icon: Icons.widgets_outlined,
              iconBackground: AppColors.primaryContainer,
              title: 'Віджети',
              onTap: () {
                // Зробити: налаштування віджетів
              },
            ),
          ],
        ),
      ],
    );
  }
}

// Стан "локальне / без акаунту" (Головна 13)

class _LocalView extends StatelessWidget {
  const _LocalView({
    required this.onNavTap,
    required this.onLogout,
  });

  final ValueChanged<int> onNavTap;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      children: [
        // Аватар + ім'я + email
        _ProfileHeader(
          name: 'Ім\'я',
          email: 'email',
          onTap: () {
            // Зробити: редагування імені
          },
        ),

        const SizedBox(height: 12),

        // Персоналізація
        _SettingsCard(
          children: [
            _SettingsTile(
              icon: Icons.lock_outline,
              iconBackground: AppColors.cardBorder,
              title: 'Персоналізація',
              onTap: () {
                // Зробити: персоналізація
              },
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Блок налаштувань
        _SettingsCard(
          children: [
            _SettingsTile(
              icon: Icons.language_outlined,
              iconBackground: AppColors.primaryContainer,
              title: 'Мова',
              onTap: () {
                // Зробити: вибір мови
              },
            ),
            _Divider(),
            _SettingsTile(
              icon: Icons.dark_mode_outlined,
              iconBackground: AppColors.primaryContainer,
              title: 'Вигляд',
              onTap: () {
                // Зробити: вибір теми
              },
            ),
            _Divider(),
            _SettingsTile(
              icon: Icons.access_time_outlined,
              iconBackground: AppColors.primaryContainer,
              title: 'Дата та час',
              onTap: () {
                // Зробити: налаштування дати та часу
              },
            ),
            _Divider(),
            _SettingsTile(
              icon: Icons.widgets_outlined,
              iconBackground: AppColors.primaryContainer,
              title: 'Віджети',
              onTap: () {
                // Зробити: налаштування віджетів
              },
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Кнопка "Вийти"
        _SettingsCard(
          children: [
            _LogoutTile(onTap: onLogout),
          ],
        ),
      ],
    );
  }
}

// Шапка профілю: аватар + ім'я + email + стрілка

class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({
    required this.name,
    required this.email,
    required this.onTap,
  });

  final String name;
  final String email;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            // Аватар 64×64
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person_outline,
                color: AppColors.surface,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),

            // Ім'я + email
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: textTheme.titleMedium),
                  const SizedBox(height: 2),
                  Text(email, style: textTheme.bodySmall),
                ],
              ),
            ),

            // Стрілка вправо
            const Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// Картка-контейнер для групи налаштувань

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

// Один рядок налаштувань

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.iconBackground,
    required this.title,
    required this.onTap,
    this.subtitle,
  });

  final IconData icon;
  final Color iconBackground;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // Іконка у заокругленому фоні
            Container(
              width: 36,
              height: 36,
              decoration: const BoxDecoration(
                color: AppColors.bottomNavBackground,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary, size: 20),
            ),
            const SizedBox(width: 14),

            // Текст
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: textTheme.titleMedium),
                  if (subtitle != null) ...[
                    const SizedBox(height: 2),
                    Text(subtitle!, style: textTheme.bodySmall),
                  ],
                ],
              ),
            ),

            // Стрілка
            const Icon(
              Icons.chevron_right,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// Рядок "Вийти"

class _LogoutTile extends StatelessWidget {
  const _LogoutTile({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Center(
          child: Text(
            'Вийти',
            style: textTheme.titleMedium?.copyWith(
              color: AppColors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

// Розділювач між тайлами

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 66,
      endIndent: 16,
      color: AppColors.cardBorder,
    );
  }
}

// Bottom Navigation Bar

class _BottomNav extends StatelessWidget {
  const _BottomNav({
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bottomNavBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textPrimary,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box_outlined),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
