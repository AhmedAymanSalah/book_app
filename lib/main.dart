import 'package:bookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_source/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_imple.dart';
import 'package:bookly/Features/home/domain/use_case/fetch_newsed_book_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/cubit/feature_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/newest_cubit/cubit/newest_book_cubit.dart';
import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

import 'Features/home/domain/entities/book_entity.dart';
import 'Features/home/domain/use_case/fetch_feature_book_use_case.dart';
import 'core/utils/setup_service_locator.dart';

void main() async {
  await Hive.initFlutter();
  setupServiceLocator();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kFeaturedBox);
  await Hive.openBox<BookEntity>(kNewesdBox);

  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return FeatureBooksCubit(
              FetchFeaturedBookUseCase(homeRepo: getIt.get<HomeRepoImple>()),
            );
          },
        ),
        BlocProvider(
          create: (context) {
            return NewestBookCubit(
              FetchNewestdBooksUseCase(homeRepo: getIt.get<HomeRepoImple>()),
            );
          },
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
