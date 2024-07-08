import 'package:bookly/Features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_newest_books_use_case.dart';
import 'package:bookly/Features/home/domain/use_cases/fetch_similar_books_use_case.dart';
import 'package:bookly/Features/home/presentation/manager/featured_books/featured_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/fetch_similar_books/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:bookly/core/utils/api_services.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  //dio instance
  getIt.registerSingleton<Dio>(Dio());
  //api services instance
  getIt.registerSingleton<ApiServices>(
    ApiServices(
      getIt.get<Dio>(),
    ),
  );

  //data sources instance
  getIt.registerSingleton<HomeLocalDataSource>(
    HomeLocalDataSourceImpl(),
  );

  getIt.registerSingleton<HomeRemoteDataSource>(
    HomeRemoteDataSourceImpl(
      getIt.get<ApiServices>(),
    ),
  );
  //repos instance
  getIt.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
      getIt.get<HomeRemoteDataSource>(),
      getIt.get<HomeLocalDataSource>(),
    ),
  );
  // use cases
  getIt.registerSingleton<FetchFeaturedBooksUseCase>(
      FetchFeaturedBooksUseCase(getIt.get<HomeRepoImpl>()));
  getIt.registerSingleton<FetchNewestBooksUseCase>(
    FetchNewestBooksUseCase(getIt.get<HomeRepoImpl>()),
  );

  getIt.registerSingleton<FetchSimilarBooksUseCase>(
      FetchSimilarBooksUseCase(getIt.get<HomeRepoImpl>()));
  // register FeaturedBooks cubit
  getIt.registerSingleton<FeaturedBooksCubit>(
    FeaturedBooksCubit(getIt.get<FetchFeaturedBooksUseCase>()),
  );
  // register NewestBooks cubit
  getIt.registerSingleton<NewestBooksCubit>(
    NewestBooksCubit(getIt.get<FetchNewestBooksUseCase>()),
  );
 
}
