import 'package:invest_master/db/db_provider.dart';
import 'package:invest_master/db/models/base_model.dart';

///базовый класс для репозитория
class BaseRepository<T extends BaseModel> {
  late final String tableName;
  BaseRepository({required this.tableName});

  getNewId() async {
    final db = await DBProvider.db;
    var table = await db.rawQuery("SELECT MAX(id)+1 as id FROM $tableName");
    return (table.first["id"] != null) ? table.first["id"] : 1;
  }

  removeAll() async {
    final db = await DBProvider.db;
    await db.execute('delete from $tableName');
  }
}
