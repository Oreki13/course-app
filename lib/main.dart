import 'package:course_app/core/theme/theme.dart';
import 'package:course_app/features/course/presentation/bloc/get_course_bloc.dart';
import 'package:course_app/init_dependencies.dart';
import 'package:course_app/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() async {
  await setUp();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<GetCourseBloc>(
          create: (context) => getIt<GetCourseBloc>(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _route = AppRouter();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp.router(
        title: 'Course App',
        debugShowCheckedModeBanner: false,
        routerConfig: _route.config(),
        theme: AppTheme.lightTheme,
      ),
    );
  }
}
