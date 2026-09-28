import 'package:intl/intl.dart';
import 'package:travel_booking_ui/core/constants/app_constants.dart';

class Formatters {
  Formatters._();

  static final NumberFormat _currency = NumberFormat.currency(
    symbol: AppConstants.currencySymbol,
    decimalDigits: 0,
  );

  static final DateFormat _shortDate = DateFormat('MMM d, yyyy');
  static final DateFormat _dayMonth = DateFormat('MMM d');
  static final DateFormat _time = DateFormat('h:mm a');

  static String currency(num amount) => _currency.format(amount);

  static String shortDate(DateTime date) => _shortDate.format(date);

  static String dayMonth(DateTime date) => _dayMonth.format(date);

  static String time(DateTime date) => _time.format(date);
}
