import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'features/daily_news/data/data_sources/local/app_database.dart';
import 'features/daily_news/data/data_sources/local/app_database.dart';
import 'features/daily_news/data/data_sources/local/remote/news_apiservice.dart';
import 'features/daily_news/data/repository/artical_repository.dart';
import 'features/daily_news/domain/repositorty/artical_repository.dart';
import 'features/daily_news/domain/usecase/get_saved_article.dart';
import 'features/daily_news/domain/usecase/getarticle.dart';
import 'features/daily_news/domain/usecase/remove_article.dart';
import 'features/daily_news/domain/usecase/save_article.dart';
import 'features/daily_news/presentation/bloc/local/local_article_bloc.dart';
import 'features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));

  sl.registerSingleton<ArticleRepository>(
      ArticleRepositoryImpl(sl(),sl())
  );

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(
      GetArticleUseCase(sl())
  );

  sl.registerSingleton<GetSavedArticleUseCase>(
      GetSavedArticleUseCase(sl())
  );

  sl.registerSingleton<SaveArticleUseCase>(
      SaveArticleUseCase(sl())
  );

  sl.registerSingleton<RemoveArticleUseCase>(
      RemoveArticleUseCase(sl())
  );


  //Blocs
  sl.registerFactory<RemoteArticlesBloc>(
          ()=> RemoteArticlesBloc(sl())
  );

  sl.registerFactory<LocalArticleBloc>(
          ()=> LocalArticleBloc(sl(),sl(),sl())
  );


}