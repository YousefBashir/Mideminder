import 'dart:io';

import 'package:mediminder/models/Medicine.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();

  static DbHelper dbHelper = DbHelper._();

  /// for medicine table ///

  static final String databaseName = "medicine.db";
  static final String tableName = "Medicine";
  static final String medicineIdColumnName = 'id';
  static final String medicineNameColumnName = 'medicineName';
  static final String medicineDosageColumnName = 'medicineDosage';
  static final String medicineTypeColumnName = 'medicineType';
  static final String intervalColumnName = 'interval';
  static final String startTimeColumnName = 'startTime';

/*  /// for category table ///
  static final String categoryTableName = "Categories";
  static final String categoryIdColumnName = "categoryId";
  static final String categoryNameColumnName = "categoryName";
  static final String categoryIconColumnName = "categoryIcon";*/

  Database database;

  initDatabase() async {
    database = await getDatabaseConnection();
  }

  Future<Database> getDatabaseConnection() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + '/$databaseName';
    Database database = await openDatabase(path, version: 1,
        /*  onConfigure:(db){
      db.execute('PRAGMA foreign_keys=ON');
    }*/
        onCreate: (db, v) {
      db.execute(
          '''CREATE TABLE $tableName ($medicineIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT, 
          $medicineNameColumnName TEXT, $medicineDosageColumnName INTEGER,
          $medicineTypeColumnName TEXT,$intervalColumnName INTEGER,$startTimeColumnName TEXT)''');
    });
    return database;
  }

  insertMedicine(Medicine medicine) async {
    int rowNum = await database.insert(tableName, medicine.toMap());
    print(rowNum);
  }

  Future<List<Medicine>> getAllMedicine() async {
    List<Map<String, dynamic>> result = await database.query(tableName);
    List<Medicine> medicines = result.map((e) => Medicine.fromMap(e)).toList();
    return medicines;
  }
  updateMedicine(Medicine medicine) async {
    await database.update(tableName, medicine.toMap(),
        where: '$medicineIdColumnName= ?', whereArgs: [medicine.medicineId]);
  }

  deleteMedicine(Medicine medicine) async {
    await database.delete(tableName, where: '$medicineIdColumnName = ?', whereArgs: [medicine.medicineId]);
  }

  Future<Medicine> getSpecificMedicine(int id) async {
    List<Map<String, dynamic>> result =
        await database.query(tableName, where: 'id = ?', whereArgs: [id]);
    Medicine medicine = Medicine.fromMap(result.first);
    return medicine;
  }
  getTablesName() async {
    List<Map<String, Object>> tables = await database
        .query('sqlite_master', where: 'type = ?', whereArgs: ['table']);
    List<String> tablesName = tables.map((e) => e['name'].toString()).toList();
    print(tablesName);
  }


/*Future<List<Category>> getAllCategory() async {
    List<Map<String, dynamic>> result = await database.query(categoryTableName);
    List<Category> categories = result.map((e) => Category.fromMap(e)).toList();
    return categories;
  }*/
/* Future<List<Category>> getAllCategory() async {
    List<Map> results = await database.query(
        categoryTableName, columns:Category.columns, orderBy: "id ASC"
    );
    List<Category> category = new List();
    results.forEach((result) {
      Category category = Category.fromMap(result);
      category.add(category);
    });
    return products;
  }*/
/*Future<Category> getCategoryById(int id) async {
    //final db = await database;
    List<Map<String, dynamic>> result = await database.query(categoryTableName,
        where: "$categoryIdColumnName = ?", whereArgs: [id]);
    Category category = Category.fromMap(result.first);
    return category;
  }*/
/* db.execute(
          '''CREATE TABLE $categoryTableName($categoryIdColumnName INTEGER PRIMARY KEY,
          $categoryNameColumnName TEXT,$categoryIconColumnName INTEGER)''');
      db.execute(
          "INSERT INTO $categoryTableName ('$categoryIdColumnName', '$categoryNameColumnName', '$categoryIconColumnName')values (?, ?, ?, ?, ?)",
      [1, "Bottle", "0xe900"]
      );
      db.execute(
          "INSERT INTO $categoryTableName ('$categoryIdColumnName', '$categoryNameColumnName', '$categoryIconColumnName')values (?, ?, ?, ?, ?)",
          [2, "Pill", "0xe901"]
      );
      db.execute(
          "INSERT INTO $categoryTableName ('$categoryIdColumnName', '$categoryNameColumnName', '$categoryIconColumnName')values (?, ?, ?, ?, ?)",
          [3, "Syringe", "0xe902"]
      );
      db.execute(
          "INSERT INTO $categoryTableName ('$categoryIdColumnName', '$categoryNameColumnName', '$categoryIconColumnName')values (?, ?, ?, ?, ?)",
          [4, "Tablet", "0xe903"]
      );*/
}
