import 'package:crystal/services/data/structures/file_system/abstract_inode.dart';

class FolderData extends AbstractInode{
  bool _collapsed ;
  FolderData(super.name, [this._collapsed = false]);

  bool isCollapsed(){
    return _collapsed;
  }

  void toggleCollapse(){
    _collapsed = !_collapsed;
  }

  @override
  String additionalDataToString() {
    return "\"collapsed\": $_collapsed";
  }
}