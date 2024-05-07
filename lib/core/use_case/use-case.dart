// ignore_for_file: file_names

import 'package:dartz/dartz.dart';

import '../error/filure_class.dart';

abstract class UseCase<Type, Parameter> {
  Future<Either<Filure, Type>> call([Parameter param]);
}


class NoParameter {}



/* عملنا هنا الكلاس عشان اجبر اي حد يستخدم الكلاس يعمل ميسود اسمها كول ونبقي نفس المسميات  */