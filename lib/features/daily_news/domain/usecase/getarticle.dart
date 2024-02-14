

import '../../../../core/resources/data_state.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/article.dart';
import '../repositorty/artical_repository.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{

  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
  }

}