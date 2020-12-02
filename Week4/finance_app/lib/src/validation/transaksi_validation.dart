class TransaksiValidation {
  String validateJumlah(String value) {
    try {
      var separator = value.split('.');
      String newValue = separator.first.replaceAll(',', '');
      if (newValue.isEmpty) return 'Required';
      if (!(int.parse(newValue) is int)) return 'Format jumlah tidak valid';
      return null;
    } catch (e) {
      return 'Format jumlah tidak valid';
    }
  }

  String validateDeskripsi(String value) {
    if (value.isEmpty) return 'Required';
    return null;
  }
}
