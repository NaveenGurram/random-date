/// Date options
class RandomDateOptions {
  /// by default include leap years
  bool excludeLeapYear = false;
  int addYearsToCurrent = 5;

  /// named constructor modifying default value
  RandomDateOptions.withDefaultYearsToCurrent(this.addYearsToCurrent);

  /// named constructor modifying default value
  RandomDateOptions.excludeLeapYears() {
    excludeLeapYear = true;
  }

  /// default constructor
  RandomDateOptions.withValues(this.excludeLeapYear, this.addYearsToCurrent);
  RandomDateOptions();
}
