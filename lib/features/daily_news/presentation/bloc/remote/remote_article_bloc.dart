import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture_demo_application/features/daily_news/presentation/bloc/remote/remote_article_event.dart';
import 'package:flutter_clean_architecture_demo_application/features/daily_news/presentation/bloc/remote/remote_article_state.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/usecase/getarticle.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent,RemoteArticlesState> {

  final GetArticleUseCase _getArticleUseCase;

  RemoteArticlesBloc(this._getArticleUseCase) : super(const RemoteArticlesLoading()){
    on <GetArticles> (onGetArticles);
  }


  void onGetArticles(GetArticles event, Emitter < RemoteArticlesState > emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
          RemoteArticlesDone(dataState.data!)
      );
    }

    if (dataState is DataFailed) {
      emit(
          RemoteArticlesError(dataState.error!)
      );
    }
  }

}