///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations
	late final TranslationsCommonEn common = TranslationsCommonEn.internal(_root);
	late final TranslationsAuthEn auth = TranslationsAuthEn.internal(_root);
	late final TranslationsEmailVerifyEn email_verify = TranslationsEmailVerifyEn.internal(_root);
	late final TranslationsSecurityMethodsEn security_methods = TranslationsSecurityMethodsEn.internal(_root);
	late final TranslationsSetupEn setup = TranslationsSetupEn.internal(_root);
	late final TranslationsSeedEn seed = TranslationsSeedEn.internal(_root);
}

// Path: common
class TranslationsCommonEn {
	TranslationsCommonEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'PPlaner'
	String get app_name => 'PPlaner';

	/// en: 'Back'
	String get back => 'Back';

	/// en: 'Next'
	String get next => 'Next';

	/// en: 'Continue'
	String get kContinue => 'Continue';

	/// en: 'Confirm'
	String get confirm => 'Confirm';

	/// en: 'Login'
	String get login => 'Login';

	/// en: 'Register'
	String get register => 'Register';

	/// en: 'Error'
	String get error_title => 'Error';

	/// en: 'Loading...'
	String get loading => 'Loading...';
}

// Path: auth
class TranslationsAuthEn {
	TranslationsAuthEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your plans under reliable protection'
	String get welcome_title => 'Your plans under reliable protection';

	/// en: 'Choose how to use'
	String get welcome_subtitle => 'Choose how to use';

	/// en: 'Create local vault'
	String get create_local => 'Create local vault';

	/// en: 'I already have an account'
	String get already_have_account => 'I already have an account';

	/// en: 'Authorization'
	String get login_title => 'Authorization';

	/// en: 'Create Account'
	String get register_title => 'Create Account';

	/// en: 'Email address'
	String get email => 'Email address';

	/// en: 'Password'
	String get password => 'Password';

	/// en: 'Repeat password'
	String get confirm_password => 'Repeat password';

	/// en: 'Don't have an account?'
	String get no_account => 'Don\'t have an account?';

	/// en: 'Already have an account?'
	String get have_account => 'Already have an account?';

	/// en: 'Enter email'
	String get email_error => 'Enter email';

	/// en: 'Invalid email format'
	String get email_format_error => 'Invalid email format';

	/// en: 'Enter password'
	String get password_error => 'Enter password';

	/// en: 'Minimum 6 characters'
	String get password_length_error => 'Minimum 6 characters';

	/// en: 'Passwords do not match'
	String get passwords_not_match => 'Passwords do not match';
}

// Path: email_verify
class TranslationsEmailVerifyEn {
	TranslationsEmailVerifyEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Email Verification'
	String get title => 'Email\nVerification';

	/// en: 'We sent a code to'
	String get sent_to => 'We sent a code to';

	/// en: 'Verification code'
	String get code_hint => 'Verification code';

	/// en: 'Enter verification code'
	String get code_error => 'Enter verification code';

	/// en: 'Resend code'
	String get resend => 'Resend code';

	/// en: 'Code resent successfully'
	String get resend_success => 'Code resent successfully';
}

// Path: security_methods
class TranslationsSecurityMethodsEn {
	TranslationsSecurityMethodsEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Security Method'
	String get title => 'Security Method';

	/// en: 'Choose a quick login method. A secret phrase will be mandatory in the next step.'
	String get subtitle => 'Choose a quick login method. A secret phrase will be mandatory in the next step.';

	/// en: 'PIN-code'
	String get pin_title => 'PIN-code';

	/// en: 'Quick access via 4-digit code'
	String get pin_sub => 'Quick access via 4-digit code';

	/// en: 'Pattern Lock'
	String get pattern_title => 'Pattern Lock';

	/// en: 'Protection with a unique gesture'
	String get pattern_sub => 'Protection with a unique gesture';

	/// en: 'Association Word'
	String get word_title => 'Association Word';

	/// en: 'Password with a hint for recovery'
	String get word_sub => 'Password with a hint for recovery';

	/// en: 'Identity Verification'
	String get selection_title => 'Identity Verification';

	/// en: 'Choose an unlock method to verify'
	String get selection_subtitle => 'Choose an unlock method to verify';

	/// en: 'Login via PIN-code'
	String get method_pin => 'Login via PIN-code';

	/// en: 'Pattern Lock'
	String get method_pattern => 'Pattern Lock';

	/// en: 'Association Word'
	String get method_word => 'Association Word';

	/// en: 'Seed Phrase (Master Key)'
	String get method_seed => 'Seed Phrase (Master Key)';
}

// Path: setup
class TranslationsSetupEn {
	TranslationsSetupEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Create PIN-code'
	String get pin_create => 'Create PIN-code';

	/// en: 'Enter PIN-code'
	String get pin_enter => 'Enter PIN-code';

	/// en: 'For quick access to your plans'
	String get pin_desc_setup => 'For quick access to your plans';

	/// en: 'Enter your PIN-code to login'
	String get pin_desc_login => 'Enter your PIN-code to login';

	/// en: 'Create Pattern Lock'
	String get pattern_create => 'Create Pattern Lock';

	/// en: 'Enter Pattern Lock'
	String get pattern_enter => 'Enter Pattern Lock';

	/// en: 'Pattern too short!'
	String get pattern_short => 'Pattern too short!';

	/// en: 'Connect at least 4 dots'
	String get pattern_desc_setup => 'Connect at least 4 dots';

	/// en: 'Draw your pattern to login'
	String get pattern_desc_login => 'Draw your pattern to login';

	/// en: 'Think of an association'
	String get word_create => 'Think of\nan association';

	/// en: 'Enter association'
	String get word_enter => 'Enter\nassociation';

	/// en: 'Word must be at least 6 characters (no spaces, digits or signs)'
	String get word_desc_setup => 'Word must be at least 6 characters (no spaces, digits or signs)';

	/// en: 'Enter your association word to login'
	String get word_desc_login => 'Enter your association word to login';

	/// en: 'Enter association word'
	String get word_hint => 'Enter association word';
}

// Path: seed
class TranslationsSeedEn {
	TranslationsSeedEn.internal(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// en: 'Your Secret Phrase'
	String get title => 'Your Secret Phrase';

	/// en: 'Write these 12 words on paper and keep them in a safe place. If you lose them, access to your data cannot be restored.'
	String get warning => 'Write these 12 words on paper and keep them in a safe place. If you lose them, access to your data cannot be restored.';

	/// en: 'Copy to clipboard'
	String get copy => 'Copy to clipboard';

	/// en: 'Phrase copied to clipboard'
	String get copy_done => 'Phrase copied to clipboard';

	/// en: 'I have written these words'
	String get saved_button => 'I have written these words';

	/// en: 'Enter your secret phrase'
	String get login_title => 'Enter your\nsecret phrase';

	/// en: 'Enter all 12 words in the correct order'
	String get login_subtitle => 'Enter all 12 words in the correct order';

	/// en: 'word'
	String get word_hint => 'word';

	/// en: 'Record Verification'
	String get verify_title => 'Record Verification';

	/// en: 'Words do not match. Try again!'
	String get verify_error => 'Words do not match. Try again!';

	/// en: 'Please enter the specified words from your secret phrase'
	String get verify_desc => 'Please enter the specified words from your secret phrase';

	/// en: 'Enter word...'
	String get verify_input_hint => 'Enter word...';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'common.app_name' => 'PPlaner',
			'common.back' => 'Back',
			'common.next' => 'Next',
			'common.kContinue' => 'Continue',
			'common.confirm' => 'Confirm',
			'common.login' => 'Login',
			'common.register' => 'Register',
			'common.error_title' => 'Error',
			'common.loading' => 'Loading...',
			'auth.welcome_title' => 'Your plans under reliable protection',
			'auth.welcome_subtitle' => 'Choose how to use',
			'auth.create_local' => 'Create local vault',
			'auth.already_have_account' => 'I already have an account',
			'auth.login_title' => 'Authorization',
			'auth.register_title' => 'Create Account',
			'auth.email' => 'Email address',
			'auth.password' => 'Password',
			'auth.confirm_password' => 'Repeat password',
			'auth.no_account' => 'Don\'t have an account?',
			'auth.have_account' => 'Already have an account?',
			'auth.email_error' => 'Enter email',
			'auth.email_format_error' => 'Invalid email format',
			'auth.password_error' => 'Enter password',
			'auth.password_length_error' => 'Minimum 6 characters',
			'auth.passwords_not_match' => 'Passwords do not match',
			'email_verify.title' => 'Email\nVerification',
			'email_verify.sent_to' => 'We sent a code to',
			'email_verify.code_hint' => 'Verification code',
			'email_verify.code_error' => 'Enter verification code',
			'email_verify.resend' => 'Resend code',
			'email_verify.resend_success' => 'Code resent successfully',
			'security_methods.title' => 'Security Method',
			'security_methods.subtitle' => 'Choose a quick login method. A secret phrase will be mandatory in the next step.',
			'security_methods.pin_title' => 'PIN-code',
			'security_methods.pin_sub' => 'Quick access via 4-digit code',
			'security_methods.pattern_title' => 'Pattern Lock',
			'security_methods.pattern_sub' => 'Protection with a unique gesture',
			'security_methods.word_title' => 'Association Word',
			'security_methods.word_sub' => 'Password with a hint for recovery',
			'security_methods.selection_title' => 'Identity Verification',
			'security_methods.selection_subtitle' => 'Choose an unlock method to verify',
			'security_methods.method_pin' => 'Login via PIN-code',
			'security_methods.method_pattern' => 'Pattern Lock',
			'security_methods.method_word' => 'Association Word',
			'security_methods.method_seed' => 'Seed Phrase (Master Key)',
			'setup.pin_create' => 'Create PIN-code',
			'setup.pin_enter' => 'Enter PIN-code',
			'setup.pin_desc_setup' => 'For quick access to your plans',
			'setup.pin_desc_login' => 'Enter your PIN-code to login',
			'setup.pattern_create' => 'Create Pattern Lock',
			'setup.pattern_enter' => 'Enter Pattern Lock',
			'setup.pattern_short' => 'Pattern too short!',
			'setup.pattern_desc_setup' => 'Connect at least 4 dots',
			'setup.pattern_desc_login' => 'Draw your pattern to login',
			'setup.word_create' => 'Think of\nan association',
			'setup.word_enter' => 'Enter\nassociation',
			'setup.word_desc_setup' => 'Word must be at least 6 characters (no spaces, digits or signs)',
			'setup.word_desc_login' => 'Enter your association word to login',
			'setup.word_hint' => 'Enter association word',
			'seed.title' => 'Your Secret Phrase',
			'seed.warning' => 'Write these 12 words on paper and keep them in a safe place. If you lose them, access to your data cannot be restored.',
			'seed.copy' => 'Copy to clipboard',
			'seed.copy_done' => 'Phrase copied to clipboard',
			'seed.saved_button' => 'I have written these words',
			'seed.login_title' => 'Enter your\nsecret phrase',
			'seed.login_subtitle' => 'Enter all 12 words in the correct order',
			'seed.word_hint' => 'word',
			'seed.verify_title' => 'Record Verification',
			'seed.verify_error' => 'Words do not match. Try again!',
			'seed.verify_desc' => 'Please enter the specified words from your secret phrase',
			'seed.verify_input_hint' => 'Enter word...',
			_ => null,
		};
	}
}
