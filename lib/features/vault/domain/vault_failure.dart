sealed class VaultException implements Exception {
  const VaultException();
}

class VaultNotInitializedException extends VaultException {
  const VaultNotInitializedException();
}

class InvalidPinException extends VaultException {
  const InvalidPinException();
}
