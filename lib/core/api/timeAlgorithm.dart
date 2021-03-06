
import 'package:icp_bit_schedule/icpProviders/icpTimeProvider.dart';
import 'package:ntp/ntp.dart';



void validateTime () {
  // delayed case
  int timeDifference = 120;
  if ( timeDifference >= 120) { // 1:30 min delay or Class over
    ; // Please skip to next part
  }
  else {  // class still running
    ;
  }
}

// int signedTimeDifference = timeDiff(tfm(currentTime), tfm(eventTime));
// if (signedTimeDifference < 0) { // If delayed or event has started
// int timeDifference = signedTimeDifference.abs(); // absolute difference |-x|
// if (timeDifference > 60 || timeDifference == 60) {
// return [true, timeDifference, true];
// }else{
// return [true, timeDifference, false];
// }
// } else {
// int timeDifference = signedTimeDifference;
// return [false, timeDifference, false];
// }




List remainingTime(String currentTime, String eventTime) {
  int signedTimeDifference = timeDiff(tfm(currentTime), tfm(eventTime));
  if (signedTimeDifference < 0) { // If delayed or event has started
    int timeDifference = signedTimeDifference.abs(); // absolute difference |-x|
    if (timeDifference > 60 || timeDifference == 60) {
      return [true, timeDifference, true];
    }else{
      return [true, timeDifference, false];
    }
  } else {
    int timeDifference = signedTimeDifference;
    return [false, timeDifference, false];
  }
}


void icpStart(String timeNow, String timeThen) {
  var currentTime = tfm(timeNow);
  var event = tfm(timeThen);
  int ctHrs = currentTime[0];
  int ctMns =  currentTime[1];

  int evHrs = event[0];
  int evMns = event[1];

  if (ctHrs == evHrs) { // when it's the same hour
    if (ctMns < evMns) { // but current minute is less
      ;
    } else if (ctMns > evMns) { // but current minutes is high
      ;
    } else { // and same minute
      ;
    }
  } else if (ctHrs < evHrs) { // when current hour is less
    if (ctMns < evMns) { // and minute is also less
      ;
    } else if (ctMns > evMns) { // but minute is high
      ;
    } else { // but minute is same
      ;
    }
  } else if (ctHrs > evHrs) { // when time has passed (hour)
    if (ctMns < evMns) { // but minute is less
      ;
    } else if (ctMns > evMns) { // and minute has passed too
      ;
    } else { // but minute is same
      ;
    }
  } else { // it's nothing LOL
    ;
  }
}

Future<DateTime> syncTime() async {
  DateTime currentSyncTime = await NTP.now();
  return currentSyncTime;
}

//! Minutes to hours converter
// List<double> minsToHrs(int minutes) {
//   double hrs, min;
//   min = minutes % 60;
//   hrs = (minutes - min)/60;
//   return [hrs, min, 0];
// }


//! Takes String and sends to intAnd24 to convert into
//! 24 hours formatted Time as a list (Uses intAnd24)
List<int> tfm(String time) {
  List<String> splittedTime = time.split(":");
  List<int> convertedTime = intAnd24(splittedTime);
  return convertedTime;
}

//! Function to convert Splitted Strings to 24 hours format
List<int> intAnd24(List<String> splitTime) {
  int hrs = int.parse(splitTime[0]);
  if (splitTime[1][2] == "P") {
    hrs += 12;
    int mns = int.parse(splitTime[1].replaceAll("PM", ""));
    return [hrs, mns];
  } else {
    int mns = int.parse(splitTime[1].replaceAll("AM", ""));
    return [hrs, mns];
  }
}

//! Calculate Time Difference in Minutes (-ve & +ve)
int timeDiff(List<int> currentTime, List<int> event) {
  int ctHrs = currentTime[0];
  int ctMns =  currentTime[1];

  int evHrs = event[0];
  int evMns = event[1];

  if (ctHrs == evHrs) { // when it's the same hour
    if (ctMns < evMns) { // but current minute is less
      return evMns - ctMns;
    } else if (ctMns > evMns) { // but current minutes is high
      return evMns - ctMns;
    } else { // and same minute
      return 0;
    }
  } else if (ctHrs < evHrs) { // when current hour is less
    if (ctMns < evMns) { // and minute is also less
      return (evMns - ctMns) + ((evHrs - ctHrs) * 60);
    } else if (ctMns > evMns) { // but minute is high
      return (evMns - ctMns) + ((evHrs - ctHrs) * 60);
    } else { // but minute is same
      return ((evHrs - ctHrs) * 60);
    }
  } else if (ctHrs > evHrs) { // when time has passed (hour)
    if (ctMns < evMns) { // but minute is less
      return (evMns - ctMns) + ((evHrs - ctHrs) * 60);
    } else if (ctMns > evMns) { // and minute has passed too
      return (evMns - ctMns) + ((evHrs - ctHrs) * 60);
    } else { // but minute is same
      return ((evHrs - ctHrs) * 60);
    }
  } else { // it's nothing LOL
    return 0;
  }
}