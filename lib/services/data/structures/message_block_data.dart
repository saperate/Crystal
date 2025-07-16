import 'package:crystal/services/data/structures/message_data.dart';
import 'package:crystal/utils/uuid.dart';

/// A collection of MessageData, we use this as an intermediary
/// to not have to load in all the messages from a channel into RAM.
class MessageBlockData{
  final Uuid ID;
  final Map<Uuid, MessageData> messages = <Uuid,MessageData>{};

  MessageBlockData(this.ID);
  
}