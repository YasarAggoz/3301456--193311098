import 'package:proje/Veritabani/todo.dart';
import 'package:proje/sekmeler/classes/widgetler.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:proje/Veritabani/note.dart';

// class DatabaseNote{
//   static final DatabaseNote instance = DatabaseNote._init();
//   static Database? _database ;
//   DatabaseNote._init();
//   Future<Database> get database async {
//     if (_database != null) return _database!;
//     _database = await _initDB ('notes.db');
//     return _database!;
//
//   }
//   Future<Database> _initDB (String filePath) async {
//     final dbPath =await getDatabasesPath();
//     final path = join(dbPath,filePath);
//     return await openDatabase(path, version:1 , onCreate: _createDB );
//   }
//   Future _createDB(Database db,int version ) async {
//     const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
//     const textType = 'TEXT NOT NULL';
//     await db.execute('''
//     CREATE TABLE $tableNotes (
//     ${NoteFields.id},$idType,
//     ${NoteFields.baslik},$textType,
//     ${NoteFields.notlar },$textType,
//
//     )
//     ''');
//   }
//   Future<Note> create (Note note) async {
//     final db = await instance.database;
//     final id = await db.insert(tableNotes,note.toJson());
//     return note.copy(id:id);
//   }
//   Future<int> update (Note note) async {
//     final db = await instance.database;
//     return db.update(
//       tableNotes,
//       note.toJson(),
//       where: '${NoteFields.id} = ?', whereArgs: [note.id],
//     );
//   }
//
//   Future<int> delete (int id) async {
//     final db = await instance.database;
//     return await db.delete(
//       tableNotes,
//       where: '${NoteFields.id} = ?', whereArgs: [id],
//     );
//
//   }
//
//   Future close() async {
//     final db =await instance.database;
//     db.close();
//   }
//   Future<List<Note>> readAllNote() async {
//     final db = await instance.database;
//     const orderBy = '${NoteFields.id}';
//     final result = await db.query(tableNotes,orderBy:orderBy);
//     return result.map((json) => Note.fromJson(json)) .toList();
//   }
//
//
//
//   Future<Note> readNote(int id) async {
//     final db = await instance.database;
//     final maps =await db.query(
//       tableNotes,
//       columns: NoteFields.values,
//       where: '${NoteFields.id} = ?',
//       whereArgs: [id],
//     );
//     if (maps.isNotEmpty) {
//       return Note.fromJson(maps.first);
//     } else {
//       throw Exception('ID $id Bulunamadı');
//     }
//   }
// }




class DatabaseHelper {

  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'Vb.db'),
      onCreate: (db, version) async {
        await db.execute("CREATE TABLE notlars(id INTEGER PRIMARY KEY, baslik TEXT, notlar TEXT)");
        await db.execute("CREATE TABLE todo(id INTEGER PRIMARY KEY, todo TEXT)");


      },
      version: 1,
    );
  }

  Future<int> notEkle(Notlars note) async {
    int taskId = 0;
    Database _db = await database();
    await _db.insert('notlars', note.toMap(), conflictAlgorithm: ConflictAlgorithm.replace).then((value) {
      taskId = value;
    });
    return taskId;
  }

  Future<List<Widgetler>> notGetir() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('notlars');
    return List.generate(taskMap.length, (index) {
      return Widgetler(id: taskMap[index]['id'], baslik: taskMap[index]['baslik'], notlar:taskMap[index]['notlar']);
    });
  }



  Future<void> baslikGuncelle(int id, String baslik) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE notlars SET title = '$baslik' WHERE id = '$id'");
  }
  Future<void> notSil(String baslik) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM notlars WHERE baslik = '$baslik'");
  }
  Future<void> notGuncelle(int id, String notlar) async {
    Database _db = await database();
    await _db.rawUpdate("UPDATE notlars SET baslik = '$notlar' WHERE id = '$id'");
  }
  Future<List<Widgetler>> todogetir() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('todo');
    return List.generate(taskMap.length, (index) {
      return Widgetler(id: taskMap[index]['id'],  notlar:taskMap[index]['notlar']);
    });
  }
  Future<void> Todoekle(Todo todo) async {
    Database _db = await database();
    await _db.insert('todo', todo.toMap());
  }
  Future<void> Todosil(Todo todo) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM todo WHERE notlar = '$todo'");
  }

  }

