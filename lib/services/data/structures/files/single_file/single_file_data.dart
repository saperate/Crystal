import 'package:crystal/services/data/structures/file_system/file_data.dart';
import 'package:crystal/services/data/structures/files/file_types.dart';


class SingleFileData extends FileData{
  String _data;

  SingleFileData(String name, [this._data = ""]) : super(name, FileTypes.singleFile);

  void setData(String data){
    _data = data;
  }

  void appendData(String data){
    _data += data;
  }

  String getData(){
    return _data;
  }

  @override
  String additionalDataToString() {
    String editedData = _data.replaceAll("\n", "");
    return "\"file\": \"$editedData\"";
  }
}