import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pretium_clone/constants/app_colors.dart';
import 'package:pretium_clone/routes/pages.dart' show AppPages;

import 'constants/custom_textstyles.dart';
import 'routes/observer.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Make app always in portrait
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  Bloc.observer = MyGlobalObserver();

  // get storage
  await GetStorage.init();

  runApp(
    DevicePreview(enabled: kDebugMode, builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return MultiBlocProvider(
      providers: [...AppPages.allBlocProviders(context)],
      child: ScreenUtilInit(
        designSize: const Size(375, 726),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Pretium_clone',
            locale: DevicePreview.locale(context),
            navigatorKey: navigatorKey,
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(
                seedColor: AppColors.primary,
                primary: AppColors.secondaryText,
              ),
              textTheme: TextTheme(
                titleLarge: titleLarge,
                titleMedium: titleMedium,
                titleSmall: titleSmall,
              ),
              useMaterial3: true,
              fontFamily: 'roboto',
              scaffoldBackgroundColor: AppColors.bg,
              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.transparent,
                foregroundColor: AppColors.primaryText,
              ),
              checkboxTheme: CheckboxThemeData(
                fillColor: WidgetStateProperty.fromMap({
                  WidgetState.selected: AppColors.primary,
                }),
              ),
              bottomSheetTheme: BottomSheetThemeData(
                backgroundColor: AppColors.white,
              ),
            ),
            onGenerateRoute: AppPages.generateRouteSettings,
          );
        },
      ),
    );
  }
}
