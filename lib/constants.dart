import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dimensions.dart';

class Constants {
  NumberFormat formatter;
  String currencySymbol;
  Dimensions dimensions;
  Locale locale;
  
  Constants(BuildContext context) {
    dimensions = new Dimensions(context);
    locale = Localizations.localeOf(context);
    formatter = new NumberFormat.currency(locale: locale.toString());
    currencySymbol = NumberFormat.currency().simpleCurrencySymbol(formatter.currencySymbol);
  }
}
