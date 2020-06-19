import 'package:random_date/random_date.dart';

void main() {
  var randomDate = RandomDate();
  var randomDateOptions = RandomDateOptions();
  randomDateOptions.addYearsToCurrent = 10;
  // generates a random date for given range
  print(
      'randomDateWithStartYear[2000]: ${randomDate.generateRandomDate(2000)}');
  print(
      'randomDateWithRange[2000-2010]: ${randomDate.generateRandomDate(2000, 2010)}');
  randomDateOptions.excludeLeapYear = true;
  print(
      'randomDateWithRangeAndSkipLeapYears[2000-2010]: ${randomDate.generateRandomDate(2000, 2010, randomDateOptions)}');
}
