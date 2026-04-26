import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/theme/theme_provider.dart';

// ProfileScreen

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final bool _hasAccount = false;

  int _currentNavIndex = 2;
  AppLanguage _language = AppLanguage.ukrainian;
  String _timezone = 'Україна';

  Future<void> _openLanguage() async {
    final result = await showLanguageSheet(context, _language);
    if (result != null) setState(() => _language = result);
  }

  Future<void> _openAppearance() async {
    await showAppearanceSheet(context, ref);
  }

  Future<void> _openTimezone() async {
    final result = await showTimezoneSheet(context, _timezone);
    if (result != null) setState(() => _timezone = result);
  }

  Future<void> _openWidgets() async {
    await showWidgetsSheet(context);
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: _hasAccount
            ? _AccountView(
          onLanguageTap: _openLanguage,
          onAppearanceTap: _openAppearance,
          onTimezoneTap: _openTimezone,
          onWidgetsTap: _openWidgets,
        )
            : _LocalView(
          onLanguageTap: _openLanguage,
          onAppearanceTap: _openAppearance,
          onTimezoneTap: _openTimezone,
          onWidgetsTap: _openWidgets,
          onLogout: () {},
        ),
      ),
      bottomNavigationBar: _BottomNav(
        currentIndex: _currentNavIndex,
        onTap: (i) => setState(() => _currentNavIndex = i),
      ),
    );
  }
}

// Стан "є акаунт"

class _AccountView extends StatelessWidget {
  const _AccountView({
    required this.onLanguageTap,
    required this.onAppearanceTap,
    required this.onTimezoneTap,
    required this.onWidgetsTap,
  });

  final VoidCallback onLanguageTap;
  final VoidCallback onAppearanceTap;
  final VoidCallback onTimezoneTap;
  final VoidCallback onWidgetsTap;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      children: [
        _ProfileHeader(
          name: 'Ім\'я',
          email: 'email',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _SettingsCard(
          children: [
            _SettingsTile(
              icon: Icons.lock_outline,
              title: 'Створити акаунт',
              subtitle: 'Створи акаунт, щоб не втратити дані',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 12),
        _SettingsCard(
          children: [
            _SettingsTile(
              icon: Icons.language_outlined,
              title: 'Мова',
              onTap: onLanguageTap,
            ),
            _TileDivider(),
            _SettingsTile(
              icon: Icons.dark_mode_outlined,
              title: 'Вигляд',
              onTap: onAppearanceTap,
            ),
            _TileDivider(),
            _SettingsTile(
              icon: Icons.access_time_outlined,
              title: 'Дата та час',
              onTap: onTimezoneTap,
            ),
            _TileDivider(),
            _SettingsTile(
              icon: Icons.widgets_outlined,
              title: 'Віджети',
              onTap: onWidgetsTap,
            ),
          ],
        ),
      ],
    );
  }
}

// Стан "локальне / без акаунту"

class _LocalView extends StatelessWidget {
  const _LocalView({
    required this.onLanguageTap,
    required this.onAppearanceTap,
    required this.onTimezoneTap,
    required this.onWidgetsTap,
    required this.onLogout,
  });

  final VoidCallback onLanguageTap;
  final VoidCallback onAppearanceTap;
  final VoidCallback onTimezoneTap;
  final VoidCallback onWidgetsTap;
  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      children: [
        _ProfileHeader(
          name: 'Ім\'я',
          email: 'email',
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _SettingsCard(
          children: [
            _SettingsTile(
              icon: Icons.lock_outline,
              title: 'Персоналізація',
              onTap: () {},
            ),
          ],
        ),
        const SizedBox(height: 12),
        _SettingsCard(
          children: [
            _SettingsTile(
              icon: Icons.language_outlined,
              title: 'Мова',
              onTap: onLanguageTap,
            ),
            _TileDivider(),
            _SettingsTile(
              icon: Icons.dark_mode_outlined,
              title: 'Вигляд',
              onTap: onAppearanceTap,
            ),
            _TileDivider(),
            _SettingsTile(
              icon: Icons.access_time_outlined,
              title: 'Дата та час',
              onTap: onTimezoneTap,
            ),
            _TileDivider(),
            _SettingsTile(
              icon: Icons.widgets_outlined,
              title: 'Віджети',
              onTap: onWidgetsTap,
            ),
          ],
        ),
        const SizedBox(height: 12),
        _SettingsCard(
          children: [_LogoutTile(onTap: onLogout)],
        ),
      ],
    );
  }
}

// Шапка профілю

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
    final colors = AppColors.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 64,
              height: 64,
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.person_outline,
                color: colors.surface,
                size: 32,
              ),
            ),
            const SizedBox(width: 16),
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
            Icon(
              Icons.chevron_right,
              color: colors.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}

// Картка-контейнер

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(children: children),
    );
  }
}

// Рядок налаштування

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.subtitle,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = AppColors.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: colors.surfaceVariant,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary, size: 20),
            ),
            const SizedBox(width: 14),
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
            Icon(
              Icons.chevron_right,
              color: colors.textSecondary,
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
    final colors = AppColors.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Center(
          child: Text(
            'Вийти',
            style: textTheme.titleMedium?.copyWith(
              color: colors.textPrimary,
            ),
          ),
        ),
      ),
    );
  }
}

// Розділювач між тайлами

class _TileDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Divider(
      height: 1,
      indent: 66,
      endIndent: 16,
      color: colors.cardBorder,
    );
  }
}

// Bottom Navigation Bar

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.currentIndex, required this.onTap});
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);

    return Container(
      decoration: BoxDecoration(
        color: colors.bottomNav,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: colors.textPrimary,
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

/// BOTTOM SHEETS

enum AppLanguage { ukrainian, english }

extension AppLanguageLabel on AppLanguage {
  String get label => switch (this) {
    AppLanguage.ukrainian => 'Українська',
    AppLanguage.english => 'Англійська',
  };
}

Future<AppLanguage?> showLanguageSheet(BuildContext context, AppLanguage current) {
  return showModalBottomSheet<AppLanguage>(
    context: context,
    backgroundColor: AppColors.of(context).surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => _LanguageSheet(current: current),
  );
}

class _LanguageSheet extends StatelessWidget {
  const _LanguageSheet({required this.current});
  final AppLanguage current;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SheetHandle(),
            const SizedBox(height: 20),
            Text('Оберіть мову', style: textTheme.titleLarge),
            const SizedBox(height: 8),
            ...AppLanguage.values.map(
                  (lang) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(lang.label, style: textTheme.titleMedium),
                trailing: current == lang
                    ? const Icon(Icons.check, color: AppColors.primary, size: 20)
                    : null,
                onTap: () => Navigator.pop(context, lang),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

Future<void> showAppearanceSheet(BuildContext context, WidgetRef ref) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColors.of(context).surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => _AppearanceSheet(ref: ref),
  );
}

class _AppearanceSheet extends ConsumerWidget {
  const _AppearanceSheet({required this.ref});
  final WidgetRef ref;

  @override
  Widget build(BuildContext context, WidgetRef innerRef) {
    final textTheme = Theme.of(context).textTheme;
    final colors = AppColors.of(context);
    final currentMode = ref.watch(themeModeProvider);

    final options = [
      (mode: ThemeMode.light, label: 'Світлий', icon: Icons.light_mode_outlined),
      (mode: ThemeMode.dark, label: 'Темний', icon: Icons.dark_mode_outlined),
      (mode: ThemeMode.system, label: 'Системний', icon: Icons.brightness_auto_outlined),
    ];

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SheetHandle(),
            const SizedBox(height: 20),
            Text('Вигляд', style: textTheme.titleLarge),
            const SizedBox(height: 8),
            ...options.map(
                  (opt) => ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(
                  opt.icon,
                  color: currentMode == opt.mode
                      ? AppColors.primary
                      : colors.textSecondary,
                  size: 22,
                ),
                title: Text(opt.label, style: textTheme.titleMedium),
                trailing: currentMode == opt.mode
                    ? const Icon(Icons.check, color: AppColors.primary, size: 20)
                    : null,
                onTap: () {
                  ref.read(themeModeProvider.notifier).setTheme(opt.mode);
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

const List<String> _timezones = [
  'Україна', 'Польща', 'Германія', 'США (Нью-Йорк)', 'США (Лос-Анджелес)', 'Велика Британія',
];

Future<String?> showTimezoneSheet(BuildContext context, String current) {
  return showModalBottomSheet<String>(
    context: context,
    backgroundColor: AppColors.of(context).surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => _TimezoneSheet(current: current),
  );
}

class _TimezoneSheet extends StatefulWidget {
  const _TimezoneSheet({required this.current});
  final String current;

  @override
  State<_TimezoneSheet> createState() => _TimezoneSheetState();
}

class _TimezoneSheetState extends State<_TimezoneSheet> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.current;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = AppColors.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SheetHandle(),
            const SizedBox(height: 20),
            Text('Оберіть часовий пояс', style: textTheme.titleLarge),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: colors.background,
                borderRadius: BorderRadius.circular(16),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selected,
                  isExpanded: true,
                  borderRadius: BorderRadius.circular(16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: colors.textSecondary,
                  ),
                  style: textTheme.titleMedium,
                  items: _timezones.map((tz) => DropdownMenuItem(value: tz, child: Text(tz))).toList(),
                  onChanged: (val) {
                    if (val != null) setState(() => _selected = val);
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => Navigator.pop(context, _selected),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: colors.surface,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text(
                'Зберегти',
                style: textTheme.labelLarge?.copyWith(color: colors.surface),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> showWidgetsSheet(BuildContext context) {
  return showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColors.of(context).surface,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => const _WidgetsSheet(),
  );
}

class _WidgetsSheet extends StatefulWidget {
  const _WidgetsSheet();

  @override
  State<_WidgetsSheet> createState() => _WidgetsSheetState();
}

class _WidgetsSheetState extends State<_WidgetsSheet> {
  final List<({String title, bool enabled})> _widgets = [
    (title: 'Задачі на сьогодні', enabled: true),
    (title: 'Календар', enabled: false),
    (title: 'Прогрес', enabled: false),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = AppColors.of(context);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _SheetHandle(),
            const SizedBox(height: 20),
            Text('Додайте віджет', style: textTheme.titleLarge),
            const SizedBox(height: 8),
            ..._widgets.asMap().entries.map(
                  (entry) => SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(entry.value.title, style: textTheme.titleMedium),
                value: entry.value.enabled,

                activeThumbColor: AppColors.primary,
                activeTrackColor: colors.surface,
                trackOutlineColor: WidgetStateProperty.resolveWith((states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.primary;
                  }
                  return null;
                }),

                onChanged: (val) {
                  setState(() {
                    _widgets[entry.key] = (
                    title: entry.value.title,
                    enabled: val,
                    );
                  });
                },
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

class _SheetHandle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colors = AppColors.of(context);
    return Center(
      child: Container(
        width: 40,
        height: 4,
        decoration: BoxDecoration(
          color: colors.divider,
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}