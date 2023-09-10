import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:snabb_business/controller/britness_provider.dart';
import 'package:snabb_business/l10n/l10n.dart';
import 'package:snabb_business/screen/splash_screen.dart';
import 'package:location/location.dart' as loc;
import 'package:geocoding/geocoding.dart' as p;
import 'package:snabb_business/utils/colors.dart';
import 'package:snabb_business/utils/materialColor.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() async {
  runApp(const MyApp());
  String? locale = await Devicelocale.currentLocale;
  getLocation();
  print("local----- ${locale}");
}

Locale mainlocale = const Locale("en");
loc.Location location = loc.Location();
loc.LocationData? locationData;
double? long, lat;
Future<void> getLocation() async {
  SharedPreferences prefer = await SharedPreferences.getInstance();
  String? value = prefer.getString("local");

  if (value == null) {
    try {
      Location location = Location();

      // Check if location service is enabled
      bool serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        // Handle the case where the location service is not enabled.
        return;
      }

      // Check if the app has location permission
      PermissionStatus permissionStatus = await location.hasPermission();
      if (permissionStatus != PermissionStatus.granted) {
        // Request location permission
        permissionStatus = await location.requestPermission();
        if (permissionStatus != PermissionStatus.granted) {
          // Handle the case where permission was denied.
          return;
        }
      }

      // Now you can proceed to get the location
      LocationData locationData = await location.getLocation();

      // Do something with the location data
      // For example, print latitude and longitude
      print("Latitude: ${locationData.latitude}");
      print("Longitude: ${locationData.longitude}");
      long = locationData.longitude;
      lat = locationData.latitude;
      getcurrentLocation(lat!.toDouble(), long!.toDouble());
      // Save the location value to SharedPreferences
      prefer.setString("local", "value");
    } on PlatformException catch (e) {
      // Handle exceptions related to platform-specific issues
      print("Error: ${e.message}");
    } catch (e) {
      // Handle other types of exceptions
      print("Unexpected error: $e");
    }
  } else {
    print("-------------------------------");
    print("hello");
    if (value.toLowerCase() == "ita") {
      mainlocale = Locale("it");
    } else if (value.toLowerCase() == "fra") {
      mainlocale = Locale("fr");
    } else if (value.toLowerCase() == "dnk") {
      mainlocale = Locale("da");
    } else if (value.toLowerCase() == "deu") {
      mainlocale = Locale("de");
    } else if (value.toLowerCase() == "esp") {
      mainlocale = Locale("es");
    } else if (value.toLowerCase() == "pol") {
      mainlocale = Locale("pl");
    } else if (value.toLowerCase() == "swe") {
      mainlocale = Locale("sv");
    } else {
      mainlocale = Locale("en");
    }
  }
}
// if (value == null) {
//   bool? serviceEnabled;
//   PermissionStatus? permissionGranted;
//   serviceEnabled = await location.serviceEnabled();
//   if (!serviceEnabled) {
//     print("da334364635436ta");
//     serviceEnabled = await location.requestService();
//     if (!serviceEnabled) {
//       return;
//     }
//   }
//   permissionGranted = await location.hasPermission();
//   if (permissionGranted == PermissionStatus.denied) {
//     permissionGranted = await location.requestPermission();
//     if (permissionGranted != PermissionStatus.granted) {
//       return;
//     }
//   }
//   if (serviceEnabled) {
//     locationData = await location.getLocation();
//     long = locationData!.longitude;
//     lat = locationData!.latitude;
//     print("data ");
//     print("$long -------------$lat");
//     getcurrentLocation(lat!.toDouble(), long!.toDouble());
//   }
// } else {
//   print("-------------------------------");
//   print("hello");
//   if (value.toLowerCase() == "ita") {
//     mainlocale = Locale("it");
//   } else if (value.toLowerCase() == "fra") {
//     mainlocale = Locale("fr");
//   } else if (value.toLowerCase() == "dnk") {
//     mainlocale = Locale("da");
//   } else if (value.toLowerCase() == "deu") {
//     mainlocale = Locale("de");
//   } else if (value.toLowerCase() == "esp") {
//     mainlocale = Locale("es");
//   } else if (value.toLowerCase() == "pol") {
//     mainlocale = Locale("pl");
//   } else if (value.toLowerCase() == "swe") {
//     mainlocale = Locale("sv");
//   } else {
//     mainlocale = Locale("en");
//   }
// }
//}

Future<void> getcurrentLocation(double lat, double long) async {
  try {
    print("-------------------------------");
    SharedPreferences prefer = await SharedPreferences.getInstance();
    List<p.Placemark> placemark = await p.placemarkFromCoordinates(lat, long);
    String? countrycode = placemark[0].isoCountryCode;
    String? countryname = placemark[0].country;
    print("--------countrycode-------${countrycode}");
    print("--------countryname-------${countryname}");
    if (countrycode!.toLowerCase() == "ita") {
      mainlocale = Locale("it");
      prefer.setString("local", "ita");
    } else if (countrycode.toLowerCase() == "fra") {
      mainlocale = Locale("fr");
      prefer.setString("local", "fra");
    } else if (countrycode.toLowerCase() == "dnk") {
      mainlocale = Locale("dn");
      prefer.setString("local", "dnk");
    } else if (countrycode.toLowerCase() == "deu") {
      mainlocale = Locale("de");
      prefer.setString("local", "deu");
    } else if (countrycode.toLowerCase() == "esp") {
      mainlocale = Locale("es");
      prefer.setString("local", "esp");
    } else if (countrycode.toLowerCase() == "pol") {
      mainlocale = Locale("pl");
      prefer.setString("local", "pol");
    } else if (countrycode.toLowerCase() == "swe") {
      mainlocale = Locale("sv");
      prefer.setString("local", "swe");
    } else {
      mainlocale = Locale("en");
      prefer.setString("local", "en");
    }
  } catch (e) {
    print("exception ${e}");
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }
}

class _MyAppState extends State<MyApp> {
  void setLocale(Locale newlocale) {
    setState(() {
      mainlocale = newlocale;
    });
  }

  @override
  void initState() {
    Future.delayed(Duration(seconds: 2), () {
      setLocale(mainlocale);
    });
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    final lan = AppLocalizations.of(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<BritnessProvider>(
              create: (context) => BritnessProvider())
        ],
        child:
            Consumer<BritnessProvider>(builder: (context, britnessProvider, _) {
          return MaterialApp(
            theme: ThemeData(
                brightness: britnessProvider.britness == AppBritness.light
                    ? Brightness.light
                    : Brightness.dark,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                fontFamily: GoogleFonts.montserrat().fontFamily,
                primaryColor: AppColors.blue,
                primarySwatch: generateMaterialColor(AppColors.blue)
                // useMaterial3: true,
                ),
            home: SplashScreen(),
            supportedLocales: L10n.all,
            locale: mainlocale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            debugShowCheckedModeBanner: false,
          );
        }));
  }
}
