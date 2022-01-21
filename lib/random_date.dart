/// generates a random date between years.
/// option to skip leap years
library random_date;

import 'dart:math';

import 'package:random_date/src/random_date_base.dart';

export 'src/random_date_base.dart';

// class to generate a random date
class RandomDate {
  int _startYear;
  int? _endYear;
  RandomDateOptions? _randomDateOptions;
  // constructors
  RandomDate.withStartYear(this._startYear);
  RandomDate.withRange(this._startYear, this._endYear);
  RandomDate.withStartYearAndOptions(this._startYear, this._randomDateOptions);
  RandomDate.withRangeAndOptions(
      this._startYear, this._endYear, this._randomDateOptions);
  // generate random date for given options
  DateTime random() {
    _randomDateOptions ??= RandomDateOptions();
    _endYear ??= DateTime.now().year + _randomDateOptions!.addYearsToCurrent;
    if (_endYear! < _startYear) {
      throw ArgumentError('Start year cannot be less then End year');
    }
    // when start and end year are equal, add one to end year if not leapYear
    if (_startYear == _endYear) {
      if (_randomDateOptions!.excludeLeapYear && _isLeapYear(_startYear)) {
        throw ArgumentError(
            'Start and End year cannot be same when leap years are excluded');
      } else {
        _endYear += 1;
      }
    }
    var _random = Random();
    // generate year
    var _randYear = _generateRandomYear();
    // generate random month
    var _randMonthInt = _random.nextInt(12) + 1;
    // generate random day
    var _randDay = _random.nextInt(_maxDays(_randYear, _randMonthInt));
    // this is a valid day, month and year.
    return DateTime(_randYear, _randMonthInt, _randDay);
  }

  // generate random year for given range and flag to include/exclude leap years
  int _generateRandomYear() {
    var _year = _startYear + Random().nextInt(_endYear! - _startYear);
    if (_randomDateOptions!.excludeLeapYear) {
      while (_isLeapYear(_year)) {
        _year = _startYear + Random().nextInt(_endYear! - _startYear);
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
