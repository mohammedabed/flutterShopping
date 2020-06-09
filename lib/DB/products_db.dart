import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:untitled11/model/products_model.dart';



class ProductsDB {
  static ProductsDB productsDB;

  ProductsDB._();

  static final db = ProductsDB._();

  ProductsDB._createInstance();

  factory ProductsDB() {
    if (productsDB == null) {
      productsDB = ProductsDB._createInstance();
    }
    return productsDB;
  }

  static Database _database;
  String tableName = "products_table";
  String _id = "id";
  String __name = "name";
  String __price = "price";
  String __category = "category";
  String __desc = "desc";
  String __image = "image";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializedDatabase();
    }
    return _database;
  }

  Future<Database> initializedDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + "products.db";

    var userDB = await openDatabase(path, version: 1, onCreate: createDatabase);
    return userDB;
  }

  void createDatabase(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $tableName($_id INTEGER PRIMARY KEY AUTOINCREMENT, $__name TEXT, $__price TEXT," +
            " $__category TEXT, $__desc TEXT, $__image TEXT )");
  }

  Future<List<Map<String, dynamic>>> productsList() async {
    Database db = await this.database;
    var result = await db.query(tableName, orderBy: "$_id ASC");
    return result;
  }

  getAllProducts() async {
    final db = await database;
    var res = await db.query(tableName);
    List<ProductsModel> list =
        res.isNotEmpty ? res.map((c) => ProductsModel.fromMap(c)).toList() : [];
    return list;
  }

  Future<int> addProduct(ProductsModel productsDB) async {
    Database db = await this.database;
    var result = await db.insert(tableName, productsDB.toMap());
    return result;
  }
}
