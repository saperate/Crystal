import '../../../../../utils/uuid.dart';

/// Data attributed to a single message;
class MessageData{
  final Uuid ID;
  final String message;
  final DateTime creationDate;
  // Possibly have a list of previous revisions?

  MessageData(this.ID, this.message, this.creationDate);

}