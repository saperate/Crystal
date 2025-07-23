import 'package:crystal/services/data/structures/app/user_data.dart';
import 'package:crystal/services/data/structures/file_system/cluster_data.dart';
import 'package:crystal/services/data/structures/file_system/folder_data.dart';
import 'package:crystal/services/data/structures/files/single_file/single_file_data.dart';
import 'package:crystal/utils/uuid.dart';

/// This is the "top container" for data
/// For stuff like channels, where to find messages, user and other general data
///
/// The data structure is like so:
///
/// Appdata
///   -UserData
///   -Clusters
///       -Folders (optional)
///           -File
class AppData{
  final DateTime creationTime;
  final UserData userData;
  final Set<ClusterData> _clusters = {};

  AppData(this.creationTime, this.userData);

  void addCluster(ClusterData cluster){
    _clusters.add(cluster);
  }

  void removeCluster(ClusterData cluster){
    _clusters.remove(cluster);
  }

  void removeClusterByID(Uuid ID){
    _clusters.removeWhere((cluster) => cluster.ID == ID);
  }

  ClusterData? getCluster(Uuid ID){
    ClusterData? cluster;
    for(int i = 0; i < _clusters.length; i++){
      ClusterData curr = _clusters.elementAt(i);
      if(curr.ID == ID){
        cluster = curr;
        break;
      }
    }
    return cluster;
  }

  Set<ClusterData> getClusters(){
    return Set.from(_clusters);
  }

}

void main(){
  ClusterData cluster = new ClusterData("Test Cluster", Uuid.generateRandom());
  AppData appData = new AppData(DateTime.now(),new UserData("sap"));
  appData.addCluster(cluster);
  
  cluster.addChild(FolderData("Cool ass folder"));
  
  FolderData folder = FolderData("other folder!");//TODO restrict names
  folder.addChild(new SingleFileData("cool.txt","HIIIII \n Hope you have a wonderful day!"));
  cluster.addChild(folder);
  
  print(cluster);
}
