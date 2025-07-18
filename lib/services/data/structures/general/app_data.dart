
import 'package:crystal/services/data/structures/channel_data.dart';
import 'package:crystal/services/data/structures/general/user_data.dart';
import 'package:crystal/utils/uuid.dart';

/// This is the "top container" for data
/// For stuff like channels, where to find messages, user and other general data
class AppData{
  final DateTime creationTime;
  final UserData userData;
  final Map<Uuid,ChannelData> _channels = <Uuid,ChannelData>{};

  AppData(this.creationTime, this.userData);

  void addChannel(ChannelData channel){
    if(_channels[channel.ID] != null){
      throw UnsupportedError("Channel was already in channels list");
    }
    _channels[channel.ID] = channel;
  }

  void deleteChannel(ChannelData channel){
    _channels.remove(channel.ID);
  }

  List<ChannelData> getChannels(){
    return List<ChannelData>.from(_channels.values);
  }
}

void main(){
  AppData data = new AppData(DateTime.now(), new UserData("Lucy"));
  data.addChannel(new ChannelData(Uuid.generateRandom()));
}
