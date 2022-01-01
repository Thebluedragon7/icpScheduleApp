
import 'package:ntp/ntp.dart';


List remainingTime(String currentTime, String eventTime) {
  int signedTimeDifference = timeDiff(tfm(currentTime), tfm(eventTime));
  if (signedTimeDifference < 0) {
    int timeDifference = signedTimeDifference.abs();
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


void icpStart() {
  print("running...");
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
//! 24 hours formatted Time as a list
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

  if (ctHrs == evHrs) {
    if (ctMns < evMns) {
      return evMns - ctMns;
    } else if (ctMns > evMns) {
      return evMns - ctMns;
    } else {
      return 0;
    }
  } else if (ctHrs < evHrs) {
    if (ctMns < evMns) {
      return (evMns - ctMns) + ((evHrs - ctHrs) * 60);
    } else if (ctMns > evMns) {
      return (evMns - ctMns) + ((evHrs - ctHrs) * 60);
    } else {
      return ((evHrs - ctHrs) * 60);
    }
  } else if (ctHrs > evHrs) {
    if (ctMns < evMns) {
      return (evMns - ctMns) + ((evHrs - ctHrs) * 60);
    } else if (ctMns > evMns) {
      return (evMns - ctMns) + ((evHrs - ctHrs) * 60);
    } else {
      return ((evHrs - ctHrs) * 60);
    }
  } else {
    return 0;
  }
}