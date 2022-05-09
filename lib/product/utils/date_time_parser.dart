class DateTimeParser {
  static String parseDate(String date) {
    if (date != null && date.isNotEmpty) {
      var dateTime = DateTime.parse(date);

      var format = "${dateTime.day}-${dateTime.month}-${dateTime.year}";

      return format;
    } else {
      return 'Boş Tarih';
    }
  }
}