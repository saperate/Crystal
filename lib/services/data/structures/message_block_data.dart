import 'package:crystal/services/data/structures/message_data.dart';
import 'package:crystal/utils/uuid.dart';

/// A collection of MessageData, we use this as an intermediary
/// to not have to load in all the messages from a channel into RAM.
/// Will contain about 50 messages
class MessageBlockData implements Comparable{
  final Uuid ID;
  final DateTime earliestMessage;
  final List<MessageData> messages = [];

  MessageBlockData(this.ID, this.earliestMessage);

  void addMessage(MessageData message){
    messages.add(message);
  }

  void removeMessage(MessageData message){
    messages.remove(message);
  }

  void removeMessageByID(Uuid ID){
    for(int i = 0; i < messages.length; i++){
      MessageData message = messages[i];
      if(message.ID == ID){
        messages.remove(message);
        return;
      }
    }
  }

  @override
  int compareTo(other) {
    return earliestMessage.compareTo(other);
  }
}