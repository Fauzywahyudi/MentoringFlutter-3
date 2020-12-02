class TransaksiValidation {
  String validateJumlah(String value) {
    try {
      if (value.isEmpty) return 'Required';
      if (!(int.parse(value) is int)) return 'Format jumlah tidak valid';
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
