import 'package:hive/hive.dart';
part 'hiveSearch.g.dart';

@HiveType(typeId: 0)
class SearchModel extends HiveObject {
  @HiveField(0)
  String search;

  SearchModel({
    required this.search,
  });
}
