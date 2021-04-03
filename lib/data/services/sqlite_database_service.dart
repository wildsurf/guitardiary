import 'package:flutter/material.dart';
import 'package:guitardiary/data/repositories/guitar_dates_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseService {
  Future<int> insert(String table, Map<String, dynamic> row);

  Future<List<Map<String, dynamic>>> query(
    String table,
    String where,
    List<dynamic> whereArgs,
  );
}

class SqliteDatabaseService implements DatabaseService {
  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    return openDatabase(join(await getDatabasesPath(), 'guitar_date.db'),
        version: 1, onCreate: (Database db, int version) async {
      try {
        await db.execute('CREATE TABLE GuitarDatesTable ('
            '$guitarDateTableKeysId INTEGER PRIMARY KEY, '
            '$guitarDateTableKeysDate INTEGER, '
            '$guitarDateTableKeysDuration INTEGER, '
            '$guitarDateTableKeysRepertoireTime INTEGER, '
            '$guitarDateTableKeysTechniqueTime INTEGER, '
            '$guitarDateTableKeysImprovisationTime INTEGER, '
            '$guitarDateTableKeysKnowledgeTime INTEGER, '
            '$guitarDateTableKeysEartrainingTime INTEGER)');
      } catch (err) {
        print('Could not execute create table: $err');
      }
    });
  }

  @visibleForTesting
  Future<void> reset() async {
    _database.close();
    _database = null;
    return deleteDatabase(join(await getDatabasesPath(), 'guitar_date.db'));
  }

  Future<int> insert(String table, Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> query(
    String table,
    String where,
    List<dynamic> whereArgs,
  ) async {
    Database db = await database;
    return await db.query(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }
}
