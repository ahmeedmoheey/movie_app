import 'package:movie_app/core/assets_manager.dart';
import 'package:movie_app/core/constant_manager.dart';
import 'package:movie_app/core/strings_manger.dart';

class CategoryDM {
  String id;
  String title;
  String imagePath;

  CategoryDM({
    required this.id,
    required this.title,
    required this.imagePath,
  });

  static List<CategoryDM> getAllCategories() => [
        CategoryDM(
            id: ConstantManager.actionId,
            title: StringsManager.action,
            imagePath: AssetsManager.actionFilm),
        CategoryDM(
            id: ConstantManager.adventureId,
            title: StringsManager.adventure,
            imagePath: AssetsManager.adventureFilm),
        CategoryDM(
            id: ConstantManager.animationId,
            title: StringsManager.animation,
            imagePath: AssetsManager.animationFilm),
        CategoryDM(
            id: ConstantManager.comedyId,
            title: StringsManager.comedy,
            imagePath: AssetsManager.comedyFilm),
        CategoryDM(
            id: ConstantManager.crimeId,
            title: StringsManager.crime,
            imagePath: AssetsManager.crimeFilm),
        CategoryDM(
            id: ConstantManager.documentaryId,
            title: StringsManager.documentary,
            imagePath: AssetsManager.documenteryFilm),
        CategoryDM(
            id: ConstantManager.dramaId,
            title: StringsManager.drama,
            imagePath: AssetsManager.dramaFilm),
        CategoryDM(
            id: ConstantManager.familyId,
            title: StringsManager.family,
            imagePath: AssetsManager.familyFilm),
        CategoryDM(
            id: ConstantManager.fantasyId,
            title: StringsManager.fantasy,
            imagePath: AssetsManager.fantasyFilm),
        CategoryDM(
            id: ConstantManager.historyId,
            title: StringsManager.history,
            imagePath: AssetsManager.historyFilm),
        CategoryDM(
            id: ConstantManager.horrorId,
            title: StringsManager.horror,
            imagePath: AssetsManager.horroFilm),
        CategoryDM(
            id: ConstantManager.musicId,
            title: StringsManager.music,
            imagePath: AssetsManager.musicFilm),
        CategoryDM(
            id: ConstantManager.mysteryId,
            title: StringsManager.mystery,
            imagePath: AssetsManager.mysteryFilm),
        CategoryDM(
            id: ConstantManager.romanceId,
            title: StringsManager.romance,
            imagePath: AssetsManager.romanceFilm),
        CategoryDM(
            id: ConstantManager.scienceId,
            title: StringsManager.science,
            imagePath: AssetsManager.scienceFilm),
        CategoryDM(
            id: ConstantManager.thrillerId,
            title: StringsManager.thriller,
            imagePath: AssetsManager.thrillerFilm),
        CategoryDM(
            id: ConstantManager.tvMovieId,
            title: StringsManager.tvMovie,
            imagePath: AssetsManager.tvMovieFilm),
        CategoryDM(
            id: ConstantManager.warId,
            title: StringsManager.war,
            imagePath: AssetsManager.warFilm),
        CategoryDM(
            id: ConstantManager.westernId,
            title: StringsManager.western,
            imagePath: AssetsManager.westernFilm),
      ];
}
