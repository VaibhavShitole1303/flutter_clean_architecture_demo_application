

import '../../../../core/use_cases/use_case.dart';
import '../entities/article.dart';
import '../repositorty/artical_repository.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>,void>{

  final ArticleRepository _articleRepository;

  GetSavedArticleUseCase(this._articleRepository);

  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepository.getSavedArticles();
  }

}