import 'package:random_date/random_date.dart';

void main() {
  var randomDateOptions = RandomDateOptions.withDefaultYearsToCurrent(10);
  // generates a random date for given range
  var randomDate = RandomDate.withStartYear(2000);
  print('randomDateWithStartYear[2000]: ${randomDate.random()}');
  randomDate = RandomDate.withRange(2000, 2010);
  print('randomDateWithRange[2000-2010]: ${randomDate.random()}');
  randomDateOptions.excludeLeapYear = true;
  randomDate = RandomDate.withRangeAndOptions(2000, 2010, randomDateOptions);
  print(
      'randomDateWithRangeAndSkipLeapYears[2000-2010]: ${randomDate.random()}');
  randomDate = RandomDate.withStartYearAndOptions(2000, randomDateOptions);
  print(
      'randomDateWithStartYearAndEndYearDefaultedTo[2000-2025]: ${randomDate.random()}');
}
