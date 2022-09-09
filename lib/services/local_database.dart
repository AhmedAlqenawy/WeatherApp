import 'dart:io' as io;

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:weatherapp/models/Sites/Sites.dart';

class CacheService {
  static Database? _db;

  String weatherFavPlaceTable = 'weatherFavPlaceTable';
  String weatherRecentPlaceTable = 'recentFavPlaceTable';
  String responseTable = 'responses';

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    io.Directory docDirect = await getApplicationDocumentsDirectory();
    String path = join(docDirect.path, 'Weather.db');

    var mydb = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE "$weatherFavPlaceTable"( "id" INTEGER PRIMARY KEY ,"name" Text NOT NULL,"region" Text NOT NULL,"country" Text NOT NULL )');
          await db.execute(
              'CREATE TABLE "$weatherRecentPlaceTable"( "id" INTEGER PRIMARY KEY ,"name" Text NOT NULL,"region" Text NOT NULL,"country" Text NOT NULL )');
        });
    return mydb;
  }

  Future<void> addWeatherFavPlace(Sites sitesModel, bool isFav) async {
    _db ??= await db;
    return isFav ?
    await _db!
        .rawInsert(
        'INSERT INTO $weatherFavPlaceTable(id,name,region,country) VALUES(${sitesModel
            .id},"${sitesModel.name}","${sitesModel.region}","${sitesModel
            .country}")')
        .then((value) {})
        .catchError((e) {})
        : await _db!
        .rawInsert(
        'INSERT INTO $weatherRecentPlaceTable(id,name,region,country) VALUES(${sitesModel
            .id},"${sitesModel.name}","${sitesModel.region}","${sitesModel
            .country}")')
        .then((value) {})
        .catchError((e) {});
  }

  Future<List<Map>> getAllWeatherFavPlace() async {
    _db ??= await db;
    return await _db!.rawQuery('SELECT * FROM $weatherFavPlaceTable ');
  }
  Future<List<Map>> getAllWeatherRecentPlace() async {
    _db ??= await db;
    return await _db!.rawQuery('SELECT * FROM $weatherRecentPlaceTable ');
  }

  Future<int?> deleteWeatherFavPlace({required int id}) async {
    Database? database = await db;
    int query = await database!
        .rawDelete('DELETE FROM $weatherFavPlaceTable where id = ?', [id]);
    return query;
  }
}
