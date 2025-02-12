import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:ezparking/Entity/Carpark.dart';

class CarparkDataBase {
  static Database _db;
  static const String id = 'id';
  static const String carParkNo = 'carParkNo';
  static const String address = 'address';
  static const String xCoord = 'xCoord';
  static const String yCoord = 'yCoord';
  static const String carParkType = 'carParkType';
  static const String shortTermParking = 'shortTermParking';
  static const String freeParking = 'freeParking';
  static const String nightParking = 'nightParking';
  static const String carParkDecks = 'carParkDecks';
  static const String gantryHeight = 'gantryHeight';
  static const String carParkBasement = 'carParkBasement';
  static const String maxSlot = 'maxSlot';
  static const String currentSlot = 'currentSlot';
  static const String TABLE = 'CarPark';
  static const String DB_NAME = 'Carpark.db';
  static bool initialized;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {

    // Construct a file path to copy database to
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "carpark_database.db");

    // Only copy if the database doesn't exist
    if (FileSystemEntity.typeSync(path) == FileSystemEntityType.notFound){
      // Load database from asset and copy
      ByteData data = await rootBundle.load(join('assets', DB_NAME));
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Save copied asset to documents
      await new File(path).writeAsBytes(bytes);
    }
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String databasePath = join(appDocDir.path, 'carpark_database.db');
    var db = await openDatabase(databasePath,version: 1);
    initialized = true;
    return db;
  }


  Future<List<Carpark>> getAllCarpark() async {
    var dbClient = await db;
    // List<Map> maps = await dbClient.query(TABLE, columns: [id, carParkNo, address,xCoord,yCoord,carParkType,shortTermParking,freeParking,nightParking,carParkDecks,gantryHeight,carParkBasement,maxSlot,currentSlot]);
    List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<Carpark> carparks = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        carparks.add(Carpark.fromMap(maps[i]));
      }
    }
    return carparks;
  }
  Future<List<Carpark>> getCarparkByRadius(double xmin, double ymin, double xmax, double ymax) async{
    var dbClient = await db;
    List<Map> maps = await dbClient.query(TABLE, where: '$xCoord BETWEEN $xmin AND $xmax AND $yCoord BETWEEN $ymin AND $ymax');
    List<Carpark> carparks = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        carparks.add(Carpark.fromMap(maps[i]));
      }
    }
    return carparks;
    
  }

  Future<int> deleteCarparkById(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$id = ?', whereArgs: [id]);
  }

  Future<int> updateCarPark(Carpark carpark) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, carpark.toMap(),
        where: '$id = ?', whereArgs: [carpark.id]);
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}