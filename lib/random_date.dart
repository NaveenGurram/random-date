/// generates a random date between years.
/// option to skip leap years
library random_date;

import 'dart:math';

import 'package:random_date/src/random_date_base.dart';

export 'src/random_date_base.dart';

// class to generate a random date
class RandomDate {
  // generates random date for given startYear and optional endYear
  DateTime generateRandomDate(int startYear,
      [int endYear, RandomDateOptions randomDateOptions]) {
    // if no end year provided,we take currentYear and add 5 to it.
    randomDateOptions ??= RandomDateOptions();
    endYear ??= DateTime.now().year + randomDateOptions.addYearsToCurrent;
    if (endYear < startYear) {
      throw ArgumentError('Start year cannot be less then End year');
    }
    // when start and end year are equal, add one to end year if not leapYear
    if (startYear == endYear) {
      if (_isLeapYear(startYear)) {
        throw ArgumentError(
            'Start and End year cannot be same when leap years are excluded');
      } else {
        endYear += 1;
      }
    }
    var _random = Random();
    // generate year
    var _randYear =
        _randomYear(startYear, endYear, randomDateOptions.excludeLeapYear);
    // generate random month
    var _randMonthInt = _random.nextInt(12) + 1;
    // generate random day
    var _randDay = _random.nextInt(_maxDays(_randYear, _randMonthInt));
    // this is a valid day, month and year.
    return DateTime(_randYear, _randMonthInt, _randDay);
  }

  // generate random year for given range and flag to include/exclude leap years
  int _randomYear(int startYear, int endYear, bool excludeLeapYear) {
    var _year = startYear + Random().nextInt(endYear - startYear);
    if (excludeLeapYear) {
      while (_isLeapYear(_year)) {
        _year = startYear + Random().nextInt(endYear - startYear);
      }
    }
    return _year;
  }

  // max number of days for given year and month
  int _maxDays(int year, int month) {
    var maxDaysMonthList = <int>[4, 6, 9, 11];
    if (month == 2) {
      return _isLeapYear(year) ? 29 : 28;
    } else {
      return maxDaysMonthList.contains(month) ? 30 : 31;
    }
  }

// is year a leap
  bool _isLeapYear(int year) =>
      (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
}
