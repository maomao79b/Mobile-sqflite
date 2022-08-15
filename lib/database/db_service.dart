import 'package:mobile_sqlite/database/db_connection.dart';
import 'package:sqflite/sqflite.dart';

class DBService{
  late DatabaseConnection _databaseConnection;
  String tableName = 'profileFB';

  DBService(){
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;

  Future<Database?> get database async{
    if(_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  get profileId => null;

  readData() async{
    var connection =await database;
    return await connection?.query(tableName);
  }

  insertData(data) async{
    var connection = await database;
    return await connection?.insert(tableName, data);
  }
}