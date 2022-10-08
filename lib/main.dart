import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:orderapp/config/app_router.dart';
import 'package:orderapp/repositories/voucher/voucher_repository.dart';
import 'package:orderapp/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'blocs/autocomplete/autocomplete_bloc.dart';
import 'blocs/basket/basket_bloc.dart';
import 'blocs/blocs.dart';
import '/models/models.dart';
import 'blocs/filter/filter_bloc.dart';
import 'blocs/voucher/voucher_bloc.dart';
import 'repositories/geolocation/geolocation_respository.dart';
import 'repositories/local_storage/local_storage_repository.dart';
import 'repositories/places/places_repository.dart';
import 'repositories/repositories.dart';

import 'config/theme.dart';
import 'screens/screens.dart';
import 'config/app_router.dart';
import 'simple_bloc_observer.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  Hive.registerAdapter(PlaceAdapter());
  BlocOverrides.runZoned(
        () {
      runApp(MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (_) => GeolocationRepository(),
        ),
        RepositoryProvider<PlacesRepository>(
          create: (_) => PlacesRepository(),
        ),
        RepositoryProvider<LocalStorageRepository>(
          create: (_) => LocalStorageRepository(),
        )
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AutocompleteBloc(
              placesRepository: context.read<PlacesRepository>(),
            )..add(LoadAutocomplete()),
          ),
          BlocProvider(
            create: (context) => FilterBloc(
            )..add(LoadFilter()),
          ),
          BlocProvider(
            create: (context) => VoucherBloc(
              voucherRepository: VoucherRepository(),
            )..add(LoadVouchers()),
          ),
          BlocProvider(
            create: (context) => BasketBloc(
              voucherBloc: BlocProvider.of<VoucherBloc>(context),
            )..add(StartBasket()),
          ),
          BlocProvider(
            create: (context) => LocationBloc(
              geolocationRepository: context.read<GeolocationRepository>(),
              placesRepository: context.read<PlacesRepository>(),
              localStorageRepository: context.read<LocalStorageRepository>(),
            )..add(LoadMap()),
          ),
        ],
        child: MaterialApp(
          title: 'FoodDelivery',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
        ),
      ),
    );
  }
}
