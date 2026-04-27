import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend/core/theme/app_colors.dart';
import 'package:frontend/core/ui/widgets/back_app_bar.dart';
import 'package:frontend/core/utils/app_assets.dart';
import 'package:frontend/features/vault/domain/vault_state.dart';
import 'package:frontend/features/vault/presentation/vault_notifier.dart';
import 'package:frontend/i18n/strings.g.dart';

class PinScreen extends ConsumerStatefulWidget {
  const PinScreen({super.key, this.isSetup = false});

  final bool isSetup;

  @override
  ConsumerState<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends ConsumerState<PinScreen> {
  String pinCode = '';

  void _addDigit(String digit) {
    if (pinCode.length < 4) {
      setState(() => pinCode += digit);
    }
  }

  void _removeDigit() {
    if (pinCode.isNotEmpty) {
      setState(() => pinCode = pinCode.substring(0, pinCode.length - 1));
    }
  }

  Future<void> _onSubmit() async {
    final state = ref.read(vaultProvider);
    final notifier = ref.read(vaultProvider.notifier);

    switch (state) {
      case VaultNotInitialized():
        await notifier.initializeWithPin(pinCode);
      default:
        await notifier.unlockWithPin(pinCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colors = AppColors.of(context);

    ref.listen<VaultState>(vaultProvider, (previous, next) {
      if (next is VaultError) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('err: ${next.failure}')));
        setState(() => pinCode = '');
      }
    });

    return Scaffold(
      backgroundColor: colors.surface,
      appBar: const BackAppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                widget.isSetup ? t.setup.pin_create : t.setup.pin_enter,
                style: textTheme.displayLarge?.copyWith(fontSize: 26),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                widget.isSetup
                    ? t.setup.pin_desc_setup
                    : t.setup.pin_desc_login,
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
              _buildPinDots(pinCode.length),
              const SizedBox(height: 30),
              _buildKeypad(colors),
              const Spacer(),
              FilledButton(
                onPressed: pinCode.length == 4 ? _onSubmit : null,
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                  backgroundColor: AppColors.primary,
                ),
                child: Text(
                  widget.isSetup ? t.common.register : t.common.login,
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

  Widget _buildPinDots(int filledLength) {
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
              color: isFilled ? AppColors.primary : Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primary.withValues(alpha: 0.5),
                width: 2,
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildKeypad(AppColorScheme colors) {
    return Column(
      children: [
        _buildKeypadRow(['1', '2', '3'], colors),
        const SizedBox(height: 16),
        _buildKeypadRow(['4', '5', '6'], colors),
        const SizedBox(height: 16),
        _buildKeypadRow(['7', '8', '9'], colors),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(width: 94),
            _buildDigitKey('0', colors),
            const SizedBox(width: 24),
            _buildBackspaceKey(),
          ],
        ),
      ],
    );
  }

  Widget _buildKeypadRow(List<String> digits, AppColorScheme colors) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDigitKey(digits[0], colors),
        const SizedBox(width: 24),
        _buildDigitKey(digits[1], colors),
        const SizedBox(width: 24),
        _buildDigitKey(digits[2], colors),
      ],
    );
  }

  Widget _buildDigitKey(String digit, AppColorScheme colors) {
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
              color: colors.textPrimary, // адаптивний
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackspaceKey() {
    return InkWell(
      onTap: _removeDigit,
      borderRadius: BorderRadius.circular(40),
      child: const SizedBox(
        width: 70,
        height: 70,
        child: Center(
          child: Icon(
            Icons.backspace_outlined,
            color: AppColors.primary, // статичний
            size: 26,
          ),
        ),
      ),
    );
  }
}
