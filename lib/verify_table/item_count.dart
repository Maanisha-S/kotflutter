main() {
  var logger = Logger('UI');
  logger.log('Button clicked');

  var logMap = {'name': 'UI'};
  var loggerJson = Logger.fromJson(logMap);
  // var s1 = Singleton();
  // var s2 = Singleton();
  // var student1 = Student('Raja', 20);
  // var student2 = Student('Raja', 20);
  // print(identical(s1, s2)); // true
  // print(s1 == s2);
  // print(identical(student1, student2)); // true
  // print(student1 == student2); // true
}

class Singleton {
  static final Singleton _singleton = Singleton._internal();

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}

class Student {
  int age;
  String stuname;
  Student(this.stuname, this.age);

  @override
  bool operator ==(Object other) {
    return other is Student && stuname == other.stuname && age == other.age;
  }

  @override
  int get hashCode {
    print(Object.hash(stuname, age));
    return Object.hash(stuname, age);
  }
}

class Logger {
  final String name;
  bool mute = false;

  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) print(msg);
  }
}
