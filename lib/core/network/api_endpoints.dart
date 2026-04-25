const String _apiBase = '/api/v1';
const String _authBase = '$_apiBase/auth';
const String _userBase = '$_apiBase/users/me';
const String _vaultBase = '$_apiBase/vault';

const String login = '$_authBase/login';
const String register = '$_authBase/register';
const String refresh = '$_authBase/refresh';
const String logout = '$_authBase/logout';

const String me = _userBase;

const String keySlots = '$_vaultBase/keys';

const String sync = '$_apiBase/sync';
