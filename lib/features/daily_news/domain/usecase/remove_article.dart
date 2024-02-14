

import '../../../../core/use_cases/use_case.dart';
import '../entities/article.dart';
import '../repositorty/artical_repository.dart';

class RemoveArticleUseCase implements UseCase<void,ArticleEntity>{

  final ArticleRepository _articleRepository;

  RemoveArticleUseCase(this._articleRepository);

  @override
  Future<void> call({ArticleEntity ? params}) {
    return _articleRepository.removeArticle(params!);
  }

}