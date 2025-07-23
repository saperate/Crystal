import 'package:crystal/utils/uuid.dart';

abstract class AbstractInode {
  final String name;
  final Set<AbstractInode> _children = {};

  AbstractInode(this.name);

  void addChild(AbstractInode child){
    _children.add(child);
  }

  @override
  int get hashCode => name.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is AbstractInode) {
      return name == other.name;
    }
    return false;
  }

  @override
  String toString() {
    String additionalData = additionalDataToString();
    String val = "{\"name\": \"$name\", \"data\":{$additionalData}, \"children\": [";

    for(AbstractInode child in _children){
      val += "$child,";
    }
    if(_children.isNotEmpty){
      val = val.substring(0,val.length - 1);
    }

    return "$val]}";
  }

  String additionalDataToString();
}
