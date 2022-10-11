import 'package:adaptive_flutter/registration_cubit/registration_cubit.dart';
import 'package:adaptive_flutter/responsive/desktop_body.dart';
import 'package:adaptive_flutter/responsive/mobile_body.dart';
import 'package:adaptive_flutter/responsive/responsive_layout.dart';
import 'package:adaptive_flutter/responsive/tablet_body.dart';
import 'package:adaptive_flutter/data/user_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_alice/alice.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/secure_storage_client.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferencesRepository().init();
  runApp(const MyApp());
}
Alice alice = Alice(showNotification: true);



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>(create: (_) => UserRepository())
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => RegistrationCubit(user: context.read<UserRepository>()))
        ],
        child: MaterialApp(
          navigatorKey: alice.getNavigatorKey(),
          debugShowCheckedModeBanner: false,
          home:  const ResponsiveLayout(desktopBody: DesktopBody(), mobileBody: MobileBody(), tabletBody: TabletBody(),),
          theme: ThemeData(primarySwatch: Colors.deepPurple),
        ),
      ),
    );
  }
}
