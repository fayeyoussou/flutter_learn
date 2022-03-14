import 'package:mysql_utils/mysql1/mysql1.dart';
import 'package:mysql_utils/mysql_utils.dart';

class MyConnection {
  ConnectionSettings s = ConnectionSettings(
    host: 'remotemysql.com',
    port: 3306,
    user: 's1E5FKGp0B',
    password: 'U2YLck8V8B',
    db: 's1E5FKGp0B',
    useCompression: false,
    useSSL: false,
    timeout: const Duration(seconds: 10),
  );
  MysqlUtils _db = MysqlUtils(
      settings: ConnectionSettings(
    host: '172.20.10.8',
    port: 3306,
    user: 'fayeyoussou',
    password: 'mamico',
    db: 'qrcode',
    useCompression: false,
    useSSL: false,
    timeout: const Duration(seconds: 10),
  ));
  MyConnection() {
    _connect();
  }
  _connect() {
    _db = MysqlUtils(settings: s);
  }

  Future<MysqlUtils> get database async {
    try {
      await _db.query('select true', []);
      return _db;
    } catch (e) {
        // _db.close();
        await Future.delayed(Duration(seconds: 2));
        _connect();
        await Future.delayed(Duration(seconds: 2));
        return this._db;
        
    }
  }

  
}
