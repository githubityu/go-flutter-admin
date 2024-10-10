// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.

import 'package:gin_vue_admin_web/models/simple_model.dart';
import 'package:ityu_tools/util/export_util.dart';

import 'models.dart';

MyJsonConverter jsonConvert = MyJsonConverter();

class MyJsonConverter {
  static T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return _asT<T>(value);
  }

  static List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => _asT<T>(e)).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  static List<T> convertListNotNull<T>(dynamic value) {
    try {
      return (value as List<dynamic>).map((dynamic e) => _asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  static T? _asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else {
        return MyJsonConverter.fromJsonAsT<T>(value);
      }
    } catch (e, stackTrace) {
      print('asT<$T> $e $stackTrace');
      return null;
    }
  }

  //Go back to a single instance by type
  static M? _fromJsonSingle<M>(Map<String, dynamic> json) {
    final String type = M.toString();

    if (type == (InfoModel).toString()) {
      return InfoModel.fromJson(json) as M;
    }
    if (type == (UserModel).toString()) {
      return UserModel.fromJson(json) as M;
    }

    if (type == (SimpleModel).toString()) {
      return SimpleModel.fromJson(json) as M;
    }
    if (type == (SysDictionaryDetailModel).toString()) {
      return SysDictionaryDetailModel.fromJson(json) as M;
    }
    if (type == (SysDictionaryModel).toString()) {
      return SysDictionaryModel.fromJson(json) as M;
    }
    if (type == (TreeMenusModel).toString()) {
      return TreeMenusModel.fromJson(json) as M;
    }
    if (type == (TreeApisModel).toString()) {
      return TreeApisModel.fromJson(json) as M;
    }
    if (type == (ArticleModel).toString()) {
      return ArticleModel.fromJson(json) as M;
    }
    "$type not found".log();
    return null;
  }

  //list is returned by type
  static M? _getListChildType<M>(List<dynamic> data) {
    if (<DataMenusItem>[] is M) {
      return data.map<DataMenusItem>((e) => DataMenusItem.fromJson(e)).toList()
          as M;
    }
    if (<ListItemAuthority>[] is M) {
      return data
          .map<ListItemAuthority>((e) => ListItemAuthority.fromJson(e))
          .toList() as M;
    }
    if (<ApiModel>[] is M) {
      return data.map<ApiModel>((e) => ApiModel.fromJson(e)).toList() as M;
    }
    if (<UserModel>[] is M) {
      return data.map<UserModel>((e) => UserModel.fromJson(e)).toList() as M;
    } //List<DataMenusItem>
    if (<DataMenusItem>[] is M) {
      return data.map<DataMenusItem>((e) => DataMenusItem.fromJson(e)).toList()
          as M;
    }
    if (<SysDictionaryModel>[] is M) {
      return data
          .map<SysDictionaryModel>((e) => SysDictionaryModel.fromJson(e))
          .toList() as M;
    }
    if (<SysDictionaryDetailModel>[] is M) {
      return data
          .map<SysDictionaryDetailModel>(
              (e) => SysDictionaryDetailModel.fromJson(e))
          .toList() as M;
    }

    if (<CronModel>[] is M) {
      return data.map<CronModel>((e) => CronModel.fromJson(e)).toList() as M;
    }
    if (<OpLogModel>[] is M) {
      return data.map<OpLogModel>((e) => OpLogModel.fromJson(e)).toList() as M;
    }
    if (<FileModel>[] is M) {
      return data.map<FileModel>((e) => FileModel.fromJson(e)).toList() as M;
    }
    if (<ArticleModel>[] is M) {
      return data.map<ArticleModel>((e) => ArticleModel.fromJson(e)).toList()
          as M;
    }
    if (<ChannelModel>[] is M) {
      return data.map<ChannelModel>((e) => ChannelModel.fromJson(e)).toList()
          as M;
    }
    "${M.toString()} not found".log();
    return null;
  }

  static M? fromJsonAsT<M>(dynamic json) {
    if (json == null) {
      return null;
    }
    if (json is List) {
      return _getListChildType<M>(json);
    } else {
      return _fromJsonSingle<M>(json as Map<String, dynamic>);
    }
  }
}
