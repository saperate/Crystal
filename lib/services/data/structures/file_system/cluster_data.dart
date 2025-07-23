import 'package:crystal/services/data/structures/file_system/abstract_inode.dart';
import 'package:crystal/utils/uuid.dart';

///Top-level inode, think of it like a drive
class ClusterData extends AbstractInode{
  final Uuid ID;
  ClusterData(super.name, this.ID);

  @override
  int get hashCode => ID.hashCode;

  @override
  bool operator ==(Object other) {
    if (other is ClusterData) {
      return ID == other.ID;
    }
    return false;
  }

  @override
  String additionalDataToString() {
    return "\"ID\": \"$ID\"";
  }
}