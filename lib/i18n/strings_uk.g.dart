///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsUk extends Translations with BaseTranslations<AppLocale, Translations> {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsUk({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.uk,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ),
		  super(cardinalResolver: cardinalResolver, ordinalResolver: ordinalResolver) {
		super.$meta.setFlatMapFunction($meta.getTranslation); // copy base translations to super.$meta
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <uk>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key) ?? super.$meta.getTranslation(key);

	late final TranslationsUk _root = this; // ignore: unused_field

	@override 
	TranslationsUk $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsUk(meta: meta ?? this.$meta);

	// Translations
	@override late final _TranslationsCommonUk common = _TranslationsCommonUk._(_root);
	@override late final _TranslationsAuthUk auth = _TranslationsAuthUk._(_root);
	@override late final _TranslationsEmailVerifyUk email_verify = _TranslationsEmailVerifyUk._(_root);
	@override late final _TranslationsSecurityMethodsUk security_methods = _TranslationsSecurityMethodsUk._(_root);
	@override late final _TranslationsSetupUk setup = _TranslationsSetupUk._(_root);
	@override late final _TranslationsSeedUk seed = _TranslationsSeedUk._(_root);
}

// Path: common
class _TranslationsCommonUk extends TranslationsCommonEn {
	_TranslationsCommonUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get app_name => 'PPlaner';
	@override String get back => 'Назад';
	@override String get next => 'Далі';
	@override String get kContinue => 'Продовжити';
	@override String get confirm => 'Підтвердити';
	@override String get login => 'Увійти';
	@override String get register => 'Зареєструватись';
	@override String get error_title => 'Помилка';
	@override String get loading => 'Завантаження...';
}

// Path: auth
class _TranslationsAuthUk extends TranslationsAuthEn {
	_TranslationsAuthUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get welcome_title => 'Ваші плани під надійним захистом';
	@override String get welcome_subtitle => 'Оберіть спосіб використання';
	@override String get create_local => 'Створити локальне сховище';
	@override String get already_have_account => 'У мене вже є акаунт';
	@override String get login_title => 'Авторизація';
	@override String get register_title => 'Створення акаунту';
	@override String get email => 'Електронна пошта';
	@override String get password => 'Пароль';
	@override String get confirm_password => 'Повторіть пароль';
	@override String get no_account => 'Ще не маєте акаунту?';
	@override String get have_account => 'Вже маєте акаунт?';
	@override String get email_error => 'Введіть email';
	@override String get email_format_error => 'Невірний формат email';
	@override String get password_error => 'Введіть пароль';
	@override String get password_length_error => 'Мінімум 6 символів';
	@override String get passwords_not_match => 'Паролі не співпадають';
}

// Path: email_verify
class _TranslationsEmailVerifyUk extends TranslationsEmailVerifyEn {
	_TranslationsEmailVerifyUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Підтвердження\nелектронної пошти';
	@override String get sent_to => 'Ми надіслали код на';
	@override String get code_hint => 'Код підтвердження';
	@override String get code_error => 'Введіть код підтвердження';
	@override String get resend => 'Надіслати повторно';
	@override String get resend_success => 'Код відправлено повторно';
}

// Path: security_methods
class _TranslationsSecurityMethodsUk extends TranslationsSecurityMethodsEn {
	_TranslationsSecurityMethodsUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Метод захисту';
	@override String get subtitle => 'Оберіть спосіб швидкого входу. Секретна фраза буде створена обов’язково на наступному кроці.';
	@override String get pin_title => 'PIN-код';
	@override String get pin_sub => 'Швидкий доступ через 4-значний код';
	@override String get pattern_title => 'Графічний ключ';
	@override String get pattern_sub => 'Захист за допомогою унікального жесту';
	@override String get word_title => 'Слово-асоціація';
	@override String get word_sub => 'Пароль із підказкою для відновлення';
	@override String get selection_title => 'Підтвердження особи';
	@override String get selection_subtitle => 'Оберіть метод розблокування для перевірки';
	@override String get method_pin => 'Вхід через PIN-код';
	@override String get method_pattern => 'Графічний ключ';
	@override String get method_word => 'Слово-асоціація';
	@override String get method_seed => 'Seed-фраза (Master Key)';
}

// Path: setup
class _TranslationsSetupUk extends TranslationsSetupEn {
	_TranslationsSetupUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get pin_create => 'Створення PIN-коду';
	@override String get pin_enter => 'Введіть PIN-код';
	@override String get pin_desc_setup => 'Для швидкого доступу до ваших планів';
	@override String get pin_desc_login => 'Введіть ваш PIN-код для входу';
	@override String get pattern_create => 'Придумайте графічний ключ';
	@override String get pattern_enter => 'Введіть графічний ключ';
	@override String get pattern_short => 'Занадто короткий ключ!';
	@override String get pattern_desc_setup => 'З\'єднайте щонайменше 4 точки';
	@override String get pattern_desc_login => 'Намалюйте ваш графічний ключ';
	@override String get word_create => 'Придумайте\nасоціацію';
	@override String get word_enter => 'Введіть\nасоціацію';
	@override String get word_desc_setup => 'Слово має містити щонайменше 6 символів (без пробілів, цифр та знаків)';
	@override String get word_desc_login => 'Введіть ваше слово-асоціацію для входу';
	@override String get word_hint => 'Введіть слово-асоціацію';
}

// Path: seed
class _TranslationsSeedUk extends TranslationsSeedEn {
	_TranslationsSeedUk._(TranslationsUk root) : this._root = root, super.internal(root);

	final TranslationsUk _root; // ignore: unused_field

	// Translations
	@override String get title => 'Ваша секретна фраза';
	@override String get warning => 'Запишіть ці 12 слів на папері та зберігайте їх у безпечному місці. Якщо ви їх загубите, доступ до ваших даних буде неможливо відновити.';
	@override String get copy => 'Скопіювати в буфер';
	@override String get copy_done => 'Фразу скопійовано у буфер';
	@override String get saved_button => 'Я записав/ла ці слова';
	@override String get login_title => 'Введіть вашу\nсекретну фразу';
	@override String get login_subtitle => 'Введіть усі 12 слів у правильному порядку';
	@override String get word_hint => 'слово';
	@override String get verify_title => 'Перевірка запису';
	@override String get verify_error => 'Слова не збігаються. Спробуйте ще раз!';
	@override String get verify_desc => 'Будь ласка, введіть вказані слова з вашої секретної фрази';
	@override String get verify_input_hint => 'Введіть слово...';
}

/// The flat map containing all translations for locale <uk>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsUk {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.app_name' => 'PPlaner',
			'common.back' => 'Назад',
			'common.next' => 'Далі',
			'common.kContinue' => 'Продовжити',
			'common.confirm' => 'Підтвердити',
			'common.login' => 'Увійти',
			'common.register' => 'Зареєструватись',
			'common.error_title' => 'Помилка',
			'common.loading' => 'Завантаження...',
			'auth.welcome_title' => 'Ваші плани під надійним захистом',
			'auth.welcome_subtitle' => 'Оберіть спосіб використання',
			'auth.create_local' => 'Створити локальне сховище',
			'auth.already_have_account' => 'У мене вже є акаунт',
			'auth.login_title' => 'Авторизація',
			'auth.register_title' => 'Створення акаунту',
			'auth.email' => 'Електронна пошта',
			'auth.password' => 'Пароль',
			'auth.confirm_password' => 'Повторіть пароль',
			'auth.no_account' => 'Ще не маєте акаунту?',
			'auth.have_account' => 'Вже маєте акаунт?',
			'auth.email_error' => 'Введіть email',
			'auth.email_format_error' => 'Невірний формат email',
			'auth.password_error' => 'Введіть пароль',
			'auth.password_length_error' => 'Мінімум 6 символів',
			'auth.passwords_not_match' => 'Паролі не співпадають',
			'email_verify.title' => 'Підтвердження\nелектронної пошти',
			'email_verify.sent_to' => 'Ми надіслали код на',
			'email_verify.code_hint' => 'Код підтвердження',
			'email_verify.code_error' => 'Введіть код підтвердження',
			'email_verify.resend' => 'Надіслати повторно',
			'email_verify.resend_success' => 'Код відправлено повторно',
			'security_methods.title' => 'Метод захисту',
			'security_methods.subtitle' => 'Оберіть спосіб швидкого входу. Секретна фраза буде створена обов’язково на наступному кроці.',
			'security_methods.pin_title' => 'PIN-код',
			'security_methods.pin_sub' => 'Швидкий доступ через 4-значний код',
			'security_methods.pattern_title' => 'Графічний ключ',
			'security_methods.pattern_sub' => 'Захист за допомогою унікального жесту',
			'security_methods.word_title' => 'Слово-асоціація',
			'security_methods.word_sub' => 'Пароль із підказкою для відновлення',
			'security_methods.selection_title' => 'Підтвердження особи',
			'security_methods.selection_subtitle' => 'Оберіть метод розблокування для перевірки',
			'security_methods.method_pin' => 'Вхід через PIN-код',
			'security_methods.method_pattern' => 'Графічний ключ',
			'security_methods.method_word' => 'Слово-асоціація',
			'security_methods.method_seed' => 'Seed-фраза (Master Key)',
			'setup.pin_create' => 'Створення PIN-коду',
			'setup.pin_enter' => 'Введіть PIN-код',
			'setup.pin_desc_setup' => 'Для швидкого доступу до ваших планів',
			'setup.pin_desc_login' => 'Введіть ваш PIN-код для входу',
			'setup.pattern_create' => 'Придумайте графічний ключ',
			'setup.pattern_enter' => 'Введіть графічний ключ',
			'setup.pattern_short' => 'Занадто короткий ключ!',
			'setup.pattern_desc_setup' => 'З\'єднайте щонайменше 4 точки',
			'setup.pattern_desc_login' => 'Намалюйте ваш графічний ключ',
			'setup.word_create' => 'Придумайте\nасоціацію',
			'setup.word_enter' => 'Введіть\nасоціацію',
			'setup.word_desc_setup' => 'Слово має містити щонайменше 6 символів (без пробілів, цифр та знаків)',
			'setup.word_desc_login' => 'Введіть ваше слово-асоціацію для входу',
			'setup.word_hint' => 'Введіть слово-асоціацію',
			'seed.title' => 'Ваша секретна фраза',
			'seed.warning' => 'Запишіть ці 12 слів на папері та зберігайте їх у безпечному місці. Якщо ви їх загубите, доступ до ваших даних буде неможливо відновити.',
			'seed.copy' => 'Скопіювати в буфер',
			'seed.copy_done' => 'Фразу скопійовано у буфер',
			'seed.saved_button' => 'Я записав/ла ці слова',
			'seed.login_title' => 'Введіть вашу\nсекретну фразу',
			'seed.login_subtitle' => 'Введіть усі 12 слів у правильному порядку',
			'seed.word_hint' => 'слово',
			'seed.verify_title' => 'Перевірка запису',
			'seed.verify_error' => 'Слова не збігаються. Спробуйте ще раз!',
			'seed.verify_desc' => 'Будь ласка, введіть вказані слова з вашої секретної фрази',
			'seed.verify_input_hint' => 'Введіть слово...',
			_ => null,
		};
	}
}
