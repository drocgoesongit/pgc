import 'dart:math';

import 'package:pgc/model/hour_slot_model.dart';
import 'package:pgc/model/one_hour_model.dart';

class HelperClass {
  static String generateRandomString() {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    final codeUnits = List<int>.generate(16, (index) {
      final randomIndex = random.nextInt(chars.length);
      return chars.codeUnitAt(randomIndex);
    });

    return String.fromCharCodes(codeUnits);
  }

  static String getSameDayDate() {
    String _twoDigits(int n) {
      if (n >= 10) {
        return '$n';
      }
      return '0$n';
    }

    DateTime now = DateTime.now();
    String formattedDate =
        '${now.year}-${_twoDigits(now.month)}-${_twoDigits(now.day)}';

    return formattedDate;
  }

  static List<String> generateDateList() {
    String _twoDigits(int n) {
      if (n >= 10) {
        return '$n';
      }
      return '0$n';
    }

    List<String> dateList = [];
    DateTime now = DateTime.now();

    for (int i = 0; i < 20; i++) {
      DateTime currentDate = now.add(Duration(days: i));
      String formattedDate =
          '${currentDate.year}-${_twoDigits(currentDate.month)}-${_twoDigits(currentDate.day)}';
      dateList.add(formattedDate);
    }

    return dateList;
  }

  static String getMonthAbbreviation(String month) {
    final Map<String, String> monthMap = {
      '01': 'Jan',
      '02': 'Feb',
      '03': 'Mar',
      '04': 'Apr',
      '05': 'May',
      '06': 'Jun',
      '07': 'Jul',
      '08': 'Aug',
      '09': 'Sep',
      '10': 'Oct',
      '11': 'Nov',
      '12': 'Dec',
    };

    return monthMap[month] ?? 'Invalid';
  }

  SingleSlotModel getHourModel(
      OneHourAvaialabilityModel availabilityModel, int index) {
    String formattedHour;
    List<String> availabilityStatus = [];

    switch (index) {
      case 0:
        availabilityStatus = availabilityModel.hour01_00_am;
        formattedHour = '01:00 AM';
        break;
      case 1:
        availabilityStatus = availabilityModel.hour02_00_am;
        formattedHour = '02:00 AM';
        break;
      case 2:
        availabilityStatus = availabilityModel.hour03_00_am;
        formattedHour = '03:00 AM';
        break;
      case 3:
        availabilityStatus = availabilityModel.hour04_00_am;
        formattedHour = '04:00 AM';
        break;
      case 4:
        availabilityStatus = availabilityModel.hour05_00_am;
        formattedHour = '05:00 AM';
        break;
      case 5:
        availabilityStatus = availabilityModel.hour06_00_am;
        formattedHour = '06:00 AM';
        break;
      case 6:
        availabilityStatus = availabilityModel.hour07_00_am;
        formattedHour = '07:00 AM';
        break;
      case 7:
        availabilityStatus = availabilityModel.hour08_00_am;
        formattedHour = '08:00 AM';
        break;
      case 8:
        availabilityStatus = availabilityModel.hour09_00_am;
        formattedHour = '09:00 AM';
        break;
      case 9:
        availabilityStatus = availabilityModel.hour10_00_am;
        formattedHour = '10:00 AM';
        break;
      case 10:
        availabilityStatus = availabilityModel.hour11_00_am;
        formattedHour = '11:00 AM';
        break;
      case 11:
        availabilityStatus = availabilityModel.hour12_00_pm;
        formattedHour = '12:00 PM';
        break;
      case 12:
        availabilityStatus = availabilityModel.hour01_00_pm;
        formattedHour = '01:00 PM';
        break;
      case 13:
        availabilityStatus = availabilityModel.hour02_00_pm;
        formattedHour = '02:00 PM';
        break;
      case 14:
        availabilityStatus = availabilityModel.hour03_00_pm;
        formattedHour = '03:00 PM';
        break;
      case 15:
        availabilityStatus = availabilityModel.hour04_00_pm;
        formattedHour = '04:00 PM';
        break;
      case 16:
        availabilityStatus = availabilityModel.hour05_00_pm;
        formattedHour = '05:00 PM';
        break;
      case 17:
        availabilityStatus = availabilityModel.hour06_00_pm;
        formattedHour = '06:00 PM';
        break;
      case 18:
        availabilityStatus = availabilityModel.hour07_00_pm;
        formattedHour = '07:00 PM';
        break;
      case 19:
        availabilityStatus = availabilityModel.hour08_00_pm;
        formattedHour = '08:00 PM';
        break;
      case 20:
        availabilityStatus = availabilityModel.hour09_00_pm;
        formattedHour = '09:00 PM';
        break;
      case 21:
        availabilityStatus = availabilityModel.hour10_00_pm;
        formattedHour = '10:00 PM';
        break;
      case 22:
        availabilityStatus = availabilityModel.hour11_00_pm;
        formattedHour = '11:00 PM';
        break;
      case 23:
        availabilityStatus = availabilityModel.hour12_00_am;
        formattedHour = '12:00 AM';
        break;
      default:
        availabilityStatus = [];
        formattedHour = 'Invalid';
        break;
    }

    return SingleSlotModel(
        hour: formattedHour, availabilityStatus: availabilityStatus);
  }

  static String reformatHourToModelType(String hour) {
    String formattedHour;
    switch (hour) {
      case '01:00 AM':
        formattedHour = '01_00_am';
        break;
      case '02:00 AM':
        formattedHour = '02_00_am';
        break;
      case '03:00 AM':
        formattedHour = '03_00_am';
        break;
      case '04:00 AM':
        formattedHour = '04_00_am';
        break;
      case '05:00 AM':
        formattedHour = '05_00_am';
        break;
      case '06:00 AM':
        formattedHour = '06_00_am';
        break;
      case '07:00 AM':
        formattedHour = '07_00_am';
        break;
      case '08:00 AM':
        formattedHour = '08_00_am';
        break;
      case '09:00 AM':
        formattedHour = '09_00_am';
        break;
      case '10:00 AM':
        formattedHour = '10_00_am';
        break;
      case '11:00 AM':
        formattedHour = '11_00_am';
        break;
      case '12:00 PM':
        formattedHour = '12_00_pm';
        break;
      case '01:00 PM':
        formattedHour = '01_00_pm';
        break;
      case '02:00 PM':
        formattedHour = '02_00_pm';
        break;
      case '03:00 PM':
        formattedHour = '03_00_pm';
        break;
      case '04:00 PM':
        formattedHour = '04_00_pm';
        break;
      case '05:00 PM':
        formattedHour = '05_00_pm';
        break;
      case '06:00 PM':
        formattedHour = '06_00_pm';
        break;
      case '07:00 PM':
        formattedHour = '07_00_pm';
        break;
      case '08:00 PM':
        formattedHour = '08_00_pm';
        break;
      case '09:00 PM':
        formattedHour = '09_00_pm';
        break;
      case '10:00 PM':
        formattedHour = '10_00_pm';
        break;
      case '11:00 PM':
        formattedHour = '11_00_pm';
        break;
      case '12:00 AM':
        formattedHour = '12_00_am';
        break;
      default:
        formattedHour = 'Invalid';
        break;
    }
    return formattedHour;
  }

  static String formatTimestampToAmPm(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String period = dateTime.hour >= 12 ? 'pm' : 'am';
    int hourIn12HourFormat =
        dateTime.hour > 12 ? dateTime.hour - 12 : dateTime.hour;
    String formattedTime =
        '${hourIn12HourFormat.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')} $period';
    return formattedTime;
  }
}
