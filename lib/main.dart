import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/travel_cubit.dart';
import 'package:travel_app/helper/dio_helper.dart';
import 'package:travel_app/pages/details_page.dart';
import 'package:travel_app/pages/home_page.dart';
import 'package:travel_app/pages/nav_pages/main_page.dart';

import 'pages/welcome_page/welcome_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TravelCubit()..getData(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: WelcomePage(),
      ),
    );
  }
}
