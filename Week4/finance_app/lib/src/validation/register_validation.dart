class RegisterValidation {
  String validateEmail(String value) {
    if (value.isEmpty) return 'Required';
    if (!value.contains('@')) return 'Email tidak valid';
    return null;
  }

  String validateName(String value) {
    if (value.isEmpty) return 'Required';
    return null;
  }

  String validatePassword(String value) {
    if (value.isEmpty) return 'Required';
    if (value.length < 8) return 'Password Minimal 8 Karakter';
    return null;
  }
}
