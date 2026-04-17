import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // В ідеалі, цей стан має залежати від Riverpod провайдера, який ми створимо пізніше
    const bool hasTasks = true;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        // Згідно з дизайном, зліва кнопка меню (Drawer)
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      // Використовуємо AnimatedSwitcher для плавного переходу між порожнім станом і списком
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: hasTasks ? _buildTaskList(context) : _buildEmptyState(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        // Колір автоматично візьметься з primary нашої теми
        child: const Icon(Icons.add, size: 32),
      ),
      bottomNavigationBar: _buildBottomNav(theme),
    );
  }

  // Екран "Головна 1"
  Widget _buildEmptyState() {
    return Center(
      child: Opacity(
        opacity: 0.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Велика іконка календаря з вашого макета
            const Icon(Icons.calendar_today_outlined, size: 120, color: Color(0xFF8BAA91)),
            const SizedBox(height: 24),
            // Невеликий чекбокс знизу іконки, як на дизайні
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xFF8BAA91), width: 2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Icon(Icons.check, size: 20, color: Color(0xFF8BAA91)),
            ),
          ],
        ),
      ),
    );
  }

  // Екран "Головна 2"
  Widget _buildTaskList(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      children: [
        Text(
          'Сьогодні',
          style: textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF2D2D2D),
          ),
        ),
        const SizedBox(height: 16),
        // Картка активного завдання
        Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            leading: Checkbox(
              value: false,
              onChanged: (v) {},
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            ),
            title: const Text('Завдання', style: TextStyle(fontWeight: FontWeight.w500)),
            trailing: Text('Сьогодні', style: textTheme.bodySmall?.copyWith(color: Colors.grey)),
          ),
        ),
        const SizedBox(height: 24),
        // Секція завершених завдань
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: const Text('Завершені', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            trailing: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
            children: [
              ListTile(
                leading: const Icon(Icons.check, color: Color(0xFF8BAA91)),
                title: const Text(
                  'Завдання',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
                trailing: const Text('Сьогодні', style: TextStyle(color: Colors.grey, fontSize: 12)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNav(ThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE0E0E0).withOpacity(0.8),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: const Color(0xFF8BAA91),
        unselectedItemColor: Colors.black54,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.check_box_outlined), label: 'Tasks'),
          BottomNavigationBarItem(icon: Icon(Icons.calendar_month), label: 'Calendar'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}