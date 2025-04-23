class ServerException implements Exception {
  @override
  String toString() {
    return 'Xeta bas verdi';
  }
}

class CacheException implements Exception {
  @override
  String toString() {
    return 'xeta bas verdi';
  }
}

class AuthException implements Exception {
  @override
  String toString() {
    return 'Sessiya xetasi';
  }
}

class EmptyException implements Exception {
  @override
  String toString() {
    return 'Boş istisna';
  }
}

class DuplicateEmailException implements Exception {
  @override
  String toString() {
    return 'E-poçt artıq mövcuddur';
  }
}


class AccountIncorrectException implements Exception {
  @override
  String toString() {
    return 'Parol yanlisdir';
  }
}