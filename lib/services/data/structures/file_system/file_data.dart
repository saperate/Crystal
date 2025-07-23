import 'package:crystal/services/data/structures/file_system/abstract_inode.dart';
import 'package:crystal/services/data/structures/files/file_types.dart';

abstract class FileData extends AbstractInode{
  final FileTypes type;

  FileData(super.name, this.type);

  //I would add some method like "getData" or smth, but
  //each file type will be rendered differently.
  //Which is why we can't abstract it more.
}