class MyDateFormat {
  String getNamaBulan(DateTime date) {
    switch (date.month) {
      case 1:
        return 'Jan';
      case 2:
        return 'Feb';
      case 3:
        return 'Mar';
      case 4:
        return 'Apr';
      case 5:
        return 'Mei';
      case 6:
        return 'Jun';
      case 7:
        return 'Jul';
      case 8:
        return 'Agu';
      case 9:
        return 'Sep';
      case 10:
        return 'Okt';
      case 11:
        return 'Nov';
      case 12:
        return 'Des';
      default:
        return 'Jan';
    }
  }

  String getNamaBulanTahun(DateTime date) {
    return getNamaBulan(date) + ' ' + date.year.toString();
  }

  String getFullDate(DateTime date) {
    return '${date.day} ${getNamaBulan(date)} ${date.year}';
  }
}