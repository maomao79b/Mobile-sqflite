import 'package:mobile_sqlite/database/db_connection.dart';
import 'package:sqflite/sqflite.dart';

class DBService{
  late DatabaseConnection _databaseConnection;
  String tableName = 'profileDB';

  DBService(){
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;

  Future<Database?> get database async{
    // print("yyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyyy");
    if(_database != null) return _database;
    // print("sssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  get profileId => null;

  readData() async{
    var connection =await database;
    return await connection?.query(tableName);
  }

  insertData(data) async{
    // print(data);
    var connection = await database;
    return await connection?.insert(tableName, data);
  }

  readDataById(itemId)async{
    var connection = await database;
    return await connection?.query(tableName, where: "id=?", whereArgs: [itemId]);
  }

  updateData(profile, id)async{
    print("update");
    var connection = await database;
    return await connection?.update(tableName, profile, where: "id=?", whereArgs: [id]);
  }

  deleteData(profileId)async{
    var connection = await database;
    return await connection?.delete(tableName, where: "id=?", whereArgs: [profileId]);
  }
}