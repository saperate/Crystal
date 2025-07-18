import 'package:crystal/services/data/structures/message_block_data.dart';
import 'package:crystal/utils/uuid.dart';


///Holds all of the message blocks for a specific channel
///along with the information for said channel
class ChannelData {
  final Uuid ID;
  //First entry is
  final List<MessageBlockData> messageBlocks = [];

  ChannelData(this.ID);

  void addMessage(String message){

  }
}