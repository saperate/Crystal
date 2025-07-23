import 'package:crystal/services/data/structures/app/app_data.dart';
import 'package:crystal/services/data/structures/app/user_data.dart';

class DataManager{
  static final _instance = DataManager._internal();
  static AppData? _appData;

  void saveData(){

  }

  void saveDataToStorage() async {

  }

  void _saveDataToServer(){
    //TODO error message if cannot save to server
  }

  ///Loads the data stored in the storage and the server.
  ///Checks whichever is newest and discards the other.
  ///
  /// This also sets appData
  void loadData() async{
    AppData? storagedData = await _loadDataFromStorage();
    AppData? serverData = await _loadDataFromServer();

    if(storagedData != null && serverData != null){
      if(storagedData.creationTime.isAfter(serverData.creationTime)){
        _appData = storagedData;
      }else{
        _appData = serverData;
      }
      return;
    }

    if(storagedData != null){
      _appData = storagedData;
    }else if(serverData != null){
      _appData = serverData;
    }else{ // We have no data at all
      //TODO open a setup screen
      print("No data found, generating empty AppData");
      _appData = _generateAppData();
      saveData();
    }
  }

  Future<AppData?> _loadDataFromStorage() async {
    
  }

  Future<AppData?> _loadDataFromServer() async{
    //TODO error message if cannot load from server
  }



  AppData _generateAppData(){
    return new AppData(DateTime.now(), new UserData("Lucy"));
  }

  AppData getAppData(){
    if(_appData == null){
      loadData();
    }
    return _appData as AppData;
  }

  static DataManager getInstance() => _instance;
  DataManager._internal();/// Private constructor
}