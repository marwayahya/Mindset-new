class DateHelper {
  static String getReadableDate(DateTime rowDate) {
    String dateAsYear = rowDate.year.toString();
    String dateAsMonth = rowDate.month.toString();
    String dateAsDay = rowDate.day.toString();
    return "$dateAsDay-$dateAsMonth-$dateAsYear";

  }
}